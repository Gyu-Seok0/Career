'''
# Unit 40 제너레이터 --> 지난 시간에 배웠던 iterator 기능이 모두 들어가 있다.
# yield만 넣으면 간단하게 이터레이터를 구현가능!
def number_generator():
    yield 0
    yield 1
    yield 2

for i in number_generator():
    print(i)

# 이터레이터의 메소드인. next를 사용해보자.
g = number_generator()

while(g.__next__()):
    print(g.__next__())

#return
def one_generator():
    yield 1
    return "return에 지정한 값"

try:
    g = one_generator()
    next(g)
    next(g)
except StopIteration as e:
    print(e)

#range 처럼 작동하는 제너레이터

def number_generator(stop):
    n=0
    while n< stop:
        yield n
        n +=1

for i in number_generator(10):
    print(i)


# 대문자로 바꿔주는 제너레이터
def upper_generator(x):
    for i in x:
        yield i.upper()

fruits = ['apple','pear','grape','pineapple','orange']
for i in upper_generator(fruits):
    print(i)

#yield from
def number_generator():
    x = [1,2,3]
    yield from x

for i in number_generator():
    print(i)

#연습문제!
def file_read():
    with open("text.txt") as file:
        while(1):
            line = file.readline()
            if line == "":
                break
            yield line.strip("\n")

for i in file_read():
    print(i)
'''
#퀴즈문제!
def prime(num):
    for i in range(2,num):
        if num%i == 0:
            return False
    return True

def prime_number_generator(start, stop):
    for i in range(start,stop):
        if prime(i) == True:
            yield i


start, stop = map(int, input().split())
g = prime_number_generator(start, stop)
print(type(g))
for i in g:
    print(i, end=' ')



