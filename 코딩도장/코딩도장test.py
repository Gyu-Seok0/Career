'''
#6.29 월 --> slice 공부
a = [10,20,30,40,50,60,70,80,90,100]

a[7::2]

n = (-32, 75, 97, -10, 9, 32, 4, -15, 0, 76, 14, 2)

print(n[1::2])


a = input()
b = input()

c = a[1::2] + b[::2]
print(c)


#6.30 화
for i in range(100):
    if i% 2 == 0:
        continue
    print(i)
  
#연습문제 3으로 끝나는 숫자만 출력하기

i = 0
while True:
    i+=1
    if i % 10 != 3:
        continue
    if i > 73:
        break
    print(i, end= ' ')
   
#퀴즈문제
start, stop = map(int, input().split())
for i in range(start,stop+1):
    if i % 10 == 3:
        continue
    print(i)

start, stop = map(int, input().split())
i = start
while True:
    if i % 10 == 3:
        i+=1
        continue
    if i > stop:
        break
    print(i, end= ' ')
    i += 1

for i in range(5):
    for j in range(5):
        print(j, sep = '-')
'''
a = [1,2,3,4,5]
print(a[0],a[1], sep=',')

