#10828 스택
'''
import sys

stack = []

com_num = int(sys.stdin.readline())

for i in range(com_num):
    com =  sys.stdin.readline().strip().split()
    if com[0] == 'push':
        stack.append(int(com[1]))
    elif com[0] == 'top':
        if len(stack) == 0:
            print(-1)
        else:
            print(stack[-1])
        
    elif com[0] == 'size':
        print(len(stack))
    elif com[0] == 'pop':
        if len(stack) == 0:
            print(-1)
        else:
            print(stack[-1])
            del stack[-1]
    elif com[0] == 'empty':
        if len(stack) == 0:
            print(1)
        else:
            print(0)

#9093번

import sys

N = int(sys.stdin.readline())

for i in range(N):
    com = sys.stdin.readline().strip()
    temp = com[::-1].split()
    print(" ".join(temp[::-1]))



#9012
import sys
N = int(sys.stdin.readline())

for i in range(N):
    stack= []
    com = sys.stdin.readline().strip()
    check = True
    for item in com:
        if item == '(':
            stack.append(item)
        elif item == ')':
            if len(stack) != 0 and stack[-1] == '(':
                del stack[-1]
            else:
                check = False
                break
           
    if check == True and len(stack) == 0:
        print("YES")
    else:
        print("NO")

# 20.6.30
# 1874번
import sys

N = int(sys.stdin.readline().strip())
check = [0 for i in range(N+1)]
stack = []
cnt=1
i=1

while(cnt<=N):
    com = int(sys.stdin.readline().strip())
    cnt +=1
    while len(stack)==0 or com > stack[-1]:
        if  check[com] == 1:
            print("NO")
            sys.exit()
        stack.append(i)
      
        i+=1
        print("+")
    while len(stack) != 0 and com <= stack[-1]:
        if len(stack)== 0:
            print("NO")
            sys.exit()
        check[stack[-1]] = 1

        del stack[-1]
        print("-")
    
import sys
arr = [int(sys.stdin.readline()) for _ in range(int(input()))]        


def save_ranking(*args):
    print(args)

save_ranking(1,5,2,54,5,8)
'''
# 1874번
import sys

def stack():
    N = int(sys.stdin.readline())
    m = 0
    stack = []
    ans = ""
    while N>0:
        com = int(sys.stdin.readline())
        if com > m:
            while com > m:
                m+=1
                stack.append(m)
                ans += "+"
            stack.pop() #pop은 리스트의 마지막을 삭제해준다.
            ans+="-"
        else:
            found = False
            if stack != []:
                top = stack[-1]
                stack.pop()
                ans += '-'
                
                if (com == top):
                    found = True
            if found== False:
                return "NO"
        N-=1
    return ans

answer = stack()
if answer == "NO":
    print(answer)
else:
    for i in answer:
        print(i)




    
