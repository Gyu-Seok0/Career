# unit19 계단시 별 출력
for i in range(5):
    for j in range(5):
        print('j:', j, sep='', end=' ')
    print('i:',i,'\\n',sep='')

# 사각형 출력하기
for i in range(5):
    for j in range(5):
        print("*", end='')
    print()

#계단식 별
for i in range(6):
    for j in range(i):
        print("*",end='')
    print()
print
#계단식 별2
for i in range(5):
    for j in range(5):
        if j<=i:
            print('*', end='')
    print()
print()
#대각선 별
for i in range(5):
    for j in range(5):
        if i==j:
            print("*", end='')
        else:
            print(" ", end='')
    print()
print()

#트리 만들기
N = int(input())
for i in range(N):
    index = N-i
    for j in range(N*2-1):
        if j+1 == index:
            print("*"*(2*i+1), end='') #기준이 되는 index 4,3,2,1,0
        else:                          #별의 개수 1,3,5,7,9 (홀수)
            print(" ", end='')
    print()

#트리만들기2
height = int(input())
for i in range(height):
    for j in reversed(range(height)):
        if j>i:
            print(' ', end='')
        else:
            print("*", end='')
    for j in range(height):
        if j<i:
            print('*', end='')
    print()
