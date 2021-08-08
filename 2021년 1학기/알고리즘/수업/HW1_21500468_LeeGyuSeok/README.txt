Video demo: 
https://youtu.be/IXkcpg0TxWc


1) Total skeleton
It is divided into two main parts. Main reads the directory of the input file and saves the file name as path, and func counts compilation, time measurement, success, and failure using various system calls.

2) Execution command
Step1: make
Step2: ./pctest -i./tests -t 1 solution.c target.c.

<detail explanation>

3) main
First, check if the wrong command-line came in from the main.
If it is properly received, run it by putting the instrument path and time_limit into the func.

4) solve(char * path, int time_limit)
I. Make each process
First of all, we ran a process for target.c and solution.c files via fork(). Solution.c has the premise that it is a perfect program, so we will only discuss target.c.


II. Compile 
I made another process for Compile (compile_target)
In case of a Compile error, the wait (&exit_code) shows an exit_code of 256. 


III. Input & output
For Input and Output, the pipe was connected. (pipe_child2)
It connected input via Dup2(in,0) and output via dup2(pipe[WRITE],1). And a double pipe was created to make it read in the process corresponding to the root. So, as a result, it makes comparison possible.

IV. Timeout
Using Sleep (time_limit), the parent did sleep for a limited time and later gave the child process a kill if it had not yet ended. Here, to find out if the child process was terminated, signal (SIGCHLD, sigchld_handler) was used.


V. Runtime error
In order to get an index error or an invalid memory reference, several signals were created, runtime_error was printed, and exit (1) was terminated.

5) Output
As a result, the values for compile, total, min, max, success, and failure are printed out respectively.




