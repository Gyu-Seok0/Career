'''
# pprint를 통해서 2차원 리스트가 사각형ㅎ
from pprint import pprint

a = [[10,20],
     [30,40],
     [50,60]]

pprint(a, indent=0, width=20)  #indent는 들여쓰기 칸 수, width는 가로폭


# for 반복문으로, 리스트의 가로 한 줄에서 요소 두 개를 꺼내보자
for x,y in a:
    print(x,y)

# 리스트 표현식으로 2차원 리스트 만들기
a = [[0 for j in range(2)] for i in range(3)]
print(a)

a = [ [0,0] for i in range(3)]
print(a)

a = [[0]*i for i in [3,1,3,2,5]]
print(a)

# sorted로 2차원 리스트 정렬
students = [
    ['john', 'C', 19],
    ['maria', 'A', 25],
    ['andrew', 'B', 7]
]

print(sorted(students, key = lambda student: student[1])) #2차원리스트 index 1을 기준으로 sort
print(sorted(students, key = lambda student: student[2])) # index 2를 기준으로 sort

##
import copy
a = [[10,20],[30,40]]
b = copy.deepcopy(a)

b[0][0] = 500

print(a)
print(b)
'''
import copy
#지뢰찾기 문제
row,col = map(int,input().split())
matrix = []
for i in range(row):
    matrix.append(list(input()))

answer = copy.deepcopy(matrix)
for i in range(row):
    for j in range(col):
        if matrix[i][j] == '*':
            answer[i][j] = '*'
        else:
            count = 0
            #모서리에 있는 경우
            if i==0 and j==0:
                if matrix[i][j+1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
                if matrix[i+1][j+1] == '*':
                    count+=1
                    
            elif i+1 == row and j==0:
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i-1][j+1] == '*':
                    count+=1
                if matrix[i][j+1] == '*':
                    count+=1
                    
            elif i== 0 and j+1 == col:
                if matrix[i][j-1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
                if matrix[i+1][j-1] == '*':
                    count+=1
                    
            elif i+1 == row and j+1 == col:
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i-1][j-1] == '*':
                    count+=1
                if matrix[i][j-1] == '*':
                    count+=1
                    
            elif j== 0:
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i-1][j+1] == '*':
                    count+=1
                if matrix[i][j+1] == '*':
                    count+=1
                if matrix[i+1][j+1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
                    
            elif j+1 == col :
                if matrix[i-1][j-1] == '*':
                    count+=1
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i][j-1] == '*':
                    count+=1
                if matrix[i+1][j-1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
            elif i==0:
                if matrix[i][j-1] == '*':
                    count+=1
                if matrix[i+1][j-1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
                if matrix[i+1][j+1] == '*':
                    count+=1
                if matrix[i][j+1] == '*':
                    count+=1

            elif i+1==row:
                if matrix[i][j-1] == '*':
                    count+=1
                if matrix[i-1][j-1] == '*':
                    count+=1
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i-1][j+1] == '*':
                    count+=1
                if matrix[i][j+1] == '*':
                    count+=1
            else:
                if matrix[i-1][j-1] == '*':
                    count+=1
                if matrix[i-1][j] == '*':
                    count+=1
                if matrix[i-1][j+1] == '*':
                    count+=1
                if matrix[i][j-1] == '*':
                    count+=1
                if matrix[i][j+1] == '*':
                    count+=1
                if matrix[i+1][j-1] == '*':
                    count+=1
                if matrix[i+1][j] == '*':
                    count+=1
                if matrix[i+1][j+1] == '*':
                    count+=1
            
            answer[i][j] = count

for i in range(len(answer)):
    for j in range(len(answer[i])):
        print(answer[i][j], end='')
    print()

                






