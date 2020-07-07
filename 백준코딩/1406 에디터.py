import sys
string = sys.stdin.readline().strip()

index = len(string)

N = int(sys.stdin.readline().strip())
for i in range(N):
    com = sys.stdin.readline().split()
    if com[0] == 'L':
        if not index <=0:
            index -=1
    if com[0] == 'D':
        if not index > len(string):
            index +=1
    if com[0] == 'B':
        if not index <=0:
            string = string[:index-1] + string[index:]
            index -=1
    if com[0] == 'P':
        string = string[:index]+com[1]+string[index:]
        index+=1
        
print(string)



