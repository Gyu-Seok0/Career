'''
You should use the statndard input/output

in order to receive a score properly.

Do not use file input and output

Please be very careful. 
'''

import sys

'''
	The method below means that the program will read from input.txt, instead of standard(keyboard) input.
	To test your program, you may save input data in input.txt file,
	and call below method to read from the file when using open() method.
	You may remove the comment symbols(#) in the below statement and use it.
	But before submission, you must remove the open function or rewrite comment symbols(#).
'''

#inf = open('input.txt');
inf = sys.stdin 
T = inf.readline()
for t in range(0, int(T)):
    N,K = map(int,input().split())
    mat = [[0]*N for i in range(N)] # [[0]*N]*N 이 된다.
    cnt = 0
    key = 0
    row = 0
    col = 0
    flag = sum(i for i in range(N+1))
    while(cnt<= N*N):
        cnt+=1
        if cnt <= flag:
            mat[row][col] = cnt
    
            if key %2 == 1:
                if row == key:
                    key+=1
                    row = key
                    
                    continue
                row +=1
                col -=1
            else:
                if col == key:
                    key+=1
    
                    col = key
                    continue
                row -=1
                col +=1
        elif cnt == flag+1:
            if key % 2 == 0:
                row = N-1
                col = key - N +1
            else:
                row = key - N +1
                col = N-1          
        else:
            mat[row][col]= cnt-1
            if key%2 == 1:
                if row == N-1:
                    key +=1
                    col +=1 
                    continue
                row +=1
                col -=1
            else:
                if col == N-1:
                    key +=1
                    row +=1
                    continue
                row -=1
                col +=1
    row = 0
    col = 0
    Answer = 0
    string = input()
    for com in string:    
        if com == 'D':
            row +=1
        elif com == "U":
            row -=1
        elif com == "L":
            col -=1
        elif com == "R":
            col +=1
        Answer += mat[row][col]
    print('Case #%d' %(int(t)+1))    
    print(Answer+1)
inf.close()
