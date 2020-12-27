#Unit20 FizzBuzz
# 3,5,15의 공배수
for i in range(100):
    if i%3 == 0 and i%5 ==0:
        print('FizzBuzz')
    elif i%3==0:
        print('Fizz')
    elif i%5==0:
        print('Buzz')
    else:
        print(i)

# 5,7,35의 공배수
import sys
a = int(sys.stdin.readline())
b = int(sys.stdin.readline())

for i in range(a,b+1):
    if i%35 ==0:
        print('FizzBuzz')
    elif i%5 ==0:
        print('Fizz')
    elif i%7 ==0:
        print('Buzz')
    else:
        print(i)


#Unit21 turtle  --> 이런게 있다는 정보만 알면 된다.
import turtle as t
t.shape('turtle')
t.forward(100)

#Unit22 리스트와 튜플 응용
#1 리스트 Comprehension
a = [i for i in range(10) if i%2==0]
b = list(i for i in range(10))
c = [i*j for i in range(2,10)
        for j in range(1,10)]


print(a) #0~9
print(b) #0~9
print(c) #2~9단


#2 map 사용하기

a = [1.2, 2.5, 3.7, 4.6]
print(a)
a = list(map(int, a))
print(a)

a,b = map(int, input().split())
print(a)
print(b)

x = map(int, input().split())
a,b = x
print(a)
print(b)

x = [1,2]
a,b = x
print(a)
print(b)
