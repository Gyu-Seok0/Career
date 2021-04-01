#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/resource.h>
#include <dirent.h>
#include <signal.h>
#include <time.h>

#define READ 0
#define WRITE 1
#define MAX 1024

//target, solution에 대한 process를 만들어보자.
pid_t target_pid, sol_pid, term_pid;
int fd; // file descriptor
int exit_code;

/* time */
float min_time = 1e10;
float max_time = -1e10;
float total_time = 0;

// dup와 pipe를 위한 변수 선언
int pip[2],pip2[2], pip_sol[2], pip_target[2];
char buf[MAX], buf_sol[MAX], buf_target[MAX];
pid_t pipe_child, pipe_child2 ;
int in; //input pipe를 위한 fd임
int flag = 0; //컴파일 여부와 잘실행됐는지를 체크
int success = 0;
int failure = 0;
struct timespec begin, end ;
float execute_time;

/* chlid process가 작업이 끝났음을 parent에게 알려주는 것*/
void sigchld_handler(int sig){
    flag++;
}

/* runtime_error handler */
void runtime_error(int sig){
    printf("runtime error 발생!\n");
    exit(1);
}

int solve(char * path, int time_limit){

        signal(SIGCHLD, sigchld_handler) ; // child process가 끝났음을 알려줌.
        signal(SIGSEGV, runtime_error) ; // wrong memeory reference
	    signal(SIGILL, runtime_error); // illegal instruction

        //target에서 실행된 결과를 pctest parent로 읽어오기 위한, pipe 만들기
        if (pipe(pip_target) != 0){
            printf("pip_target make error\n");
            exit(1);
        }
        /* 시작 시간 잡아주기*/
        clock_gettime(CLOCK_REALTIME, &begin);
        target_pid = fork();
        // target_pid
        if (target_pid == 0){
            /* target.c 열기 */
            if ((fd = open("target.c", O_RDONLY)) == -1){
                    fprintf(stderr, "target 파일 open 중 오류 발생");
                    return -1;
                }
            else{
                //printf("target.c open 성공, fd = %d\n",fd);
                pid_t compile_target = fork();
                // child: compile
                if (compile_target == 0){
                    execl("/usr/bin/gcc","gcc", "-o", "target" ,"target.c", (char *) 0x0) ;
                }
                // parent: 컴파일된 파일을 실행시킨다.
                // 컴파일이 잘 되었는지 안되었는지 확인하기
                else{
                    wait(&exit_code);
                    //printf("exit_code = %d\n", exit_code);
                    if (exit_code == 256){
                        printf("\n\tCompile error!\n");
                        return -1;
                    }
                    else{
                        printf("\tCompile Success!\n");
                    }
                    close(fd); // target.c 닫아주기
                    // pip2 만들기
                    //input과 output을 위함
                    if (pipe(pip2) != 0){
                        printf("make pip2 error\n");
                        exit(1);
                    }

                    if((pipe_child2 = fork()) <0){
                        printf("pipe_child2 fork error\n");
                        exit(1);
                    }
                    // parent로 read하기
                    // pctest의 상단으로 데이터 옮겨주기.
                    if (pipe_child2 != 0){
                        
                        // executable한 파일의 실행을 기다립니다.
                        sleep(time_limit);
                        
                        /* 시간초과  */
                        // flag == 1 gcc만 되었을 때, --> 현재 시간이 오래 걸리는 중이므로, 시간 초과되면 죽여야함.
                        // flag == 2 gcc되고, executble 되었을 때
                        
                        if (flag%2 == 1){ // 애초에 문제 발생 
                            kill(pipe_child2, SIGKILL);
                            printf("\t Time over --> kill the target.o\n");
                        }
                        //int temp;
                        wait(0x0);
                        close(pip2[WRITE]);
                        read(pip2[READ],buf,MAX);
                        close(pip2[READ]);

                        //다시 쓰기
                        // compare the value in parent process
                        close(pip_target[READ]);
                        write(pip_target[WRITE], buf, strlen(buf));
                    }

                    // child로 target 파일에 인자넣기
                    // dup2로 실행결과 집어놓기
                    else{
                        close(pip2[READ]);
                        in = open(path, O_RDONLY);
                        dup2(in,0);
                        dup2(pip2[WRITE],1);
                        close(pip2[WRITE]);
                        execl("./target","20000",(char*)0x0);
                    }
                }
            }
        } /* target 끝 */

        //parent
        //내부에서 source_pid를 만들 예정임.
        else{
            if(pipe(pip_sol) != 0){
                printf("pipe error\n");
                exit(1);
            }
            //source_pid
            sol_pid = fork();
            if (sol_pid == 0){
                //sleep(1); // 이렇게하면 solution.c를 target보다 나중에 실행시킬 수 있음. 
                if ((fd = open("solution.c", O_RDONLY)) == -1){
                    fprintf(stderr, "solution 파일 open 중 오류 발생");
                    return -1;
                }
                else{
                
                    // child: compile for solution
                    pid_t compile_sol = fork();
                    if (compile_sol == 0){
                        execl("/usr/bin/gcc","gcc", "-o", "sol" ,"solution.c", (char *) 0x0) ;
                    }

                    // parent for execute
                    else{
                        wait(&exit_code); //gcc 기다리기
                        close(fd); // solution.c 닫아주기
                        // pipe를 만들어줍시다.
                        if (pipe(pip) != 0){
                            printf("pipe error\n");
                            exit(1);
                        }
                        if((pipe_child = fork()) <0 ){
                            printf("fork error\n");
                            exit(1);
                        }
                        //parent --> read하기
                        if (pipe_child != 0){
                            wait(&exit_code);
                            close(pip[WRITE]);
                            read(pip[READ], buf, MAX);
                            close(pip[READ]);

                            //pctest의 root-parent와 연결된 pipe를 만들어봅시다.
                            // 이친구의 기능은 다시 쓰는 역할임
                            close(pip_sol[READ]);
                            write(pip_sol[WRITE], buf, strlen(buf));
                        }
                        //child --> write하기 (./sol파일에 INPUT 넣기)
                        else{
                            close(pip[READ]);
                            in = open(path, O_RDONLY);
                            dup2(in,0);
                            dup2(pip[WRITE], 1);
                            close(pip[WRITE]);
                            execl("./sol","100",(char*)0x0);
                        }
                    }
                }

            }
            //parent —> root가 된다고 생각하면 되겠음.
            else{

                /* target.c를 읽어옴 */
                term_pid = wait(&exit_code) ;
                clock_gettime(CLOCK_REALTIME, &end); // 끝시간
                execute_time = 	(end.tv_sec - begin.tv_sec) + (end.tv_nsec - begin.tv_nsec) / 1000000000.0 ;
                if (min_time > execute_time){
                    min_time = execute_time;
                }
                if (max_time < execute_time){
                    max_time = execute_time;
                }
                total_time += execute_time;

                close(pip_target[WRITE]);
                read(pip_target[READ],buf_target,MAX);
                close(pip_target[READ]);

                /* solution.c를 읽어옴 */
                term_pid = wait(&exit_code) ;
                close(pip_sol[WRITE]);
                read(pip_sol[READ],buf_sol,MAX);
                close(pip_sol[READ]);

                if (strcmp(buf_sol,buf_target) == 0){
                    success++;
                }
                else{
                    failure++;
                }
            }
        }
    return 0;
}

int
main(int argc, char ** args){
    int idx = 0;
    int check = 0;
    int time = 0;
    char dir[100];
    if (argc != 7){
        printf("wrong command\n");
        return 0;
    }
    
    while (idx < argc){
        // pctest
        if (strcmp(args[idx],"./pctest") == 0){
            check++;
        }
        // -i
        else if (strcmp(args[idx],"-i") == 0) {
            check++;
            idx++;
            strcpy(dir,args[idx]);
        }
        // -t: time
        else if (strcmp(args[idx],"-t") == 0){
            check++;
            idx++;
            time = atoi(args[idx]);
        }
        // solution.c
        else if (strcmp(args[idx],"solution.c") == 0){
            check++;
        }
        //target.c
        else if (strcmp(args[idx],"target.c") == 0){
            check++;
        }
        else{
            printf("wrong command\n");
            return 0;
        }
        idx++;
    }
    if (check == 4){
        printf("wrong command\n");
        return 0;
    }
    // 파일을 읽기 위한 setting
    FILE *fp;
    // directory를 읽기 위한 setting
    DIR * dp = 0x0;
    struct dirent *item = 0x0;
    //struct stat buf;
    if ((dp = opendir(dir)) == 0x0){
        printf("tests folder open fail\n");
        return -1;
    }
        /* 입력값 하나씩 읽어오기 */
    int child = 0;

    struct rlimit rlim;
    getrlimit(RLIMIT_NOFILE, &rlim);
    //printf("Open file %llu : %llu\n", rlim.rlim_cur, rlim.rlim_max);
    rlim.rlim_cur = 100;
	rlim.rlim_max = 100;
    if(setrlimit(RLIMIT_NOFILE, &rlim) == -1){
        return 0;
    }
    int temp_pid = getpid();
    while((item = readdir(dp)) != 0x0){
        if (strstr(item->d_name, "txt") && temp_pid == getpid()){ //txt파일이 잡히는지 체크했음.
            //printf("file: %s\n pid =%d\n", item -> d_name, getpid());
            char path[100] = "tests/";
            strcat(path,item->d_name);
            solve(path, time);
            //break;
        }
    }

    if (temp_pid == getpid()){
        printf("[time] total = %.3f, min = %.3f, max = %.3f\n", total_time, min_time, max_time);
        printf("[check] success = %d // failure = %d\n", success, failure);
    }

    return 0;
}