## Unit33 클로저 사용하기

#1. 전역변수
x = 10
def foo():
    print(x)
foo()
print(x)


#2. 지역변수
def foo2():
    x2 = 10
    print(x2)
foo2()
print(x2)   # error처리.


#3. 글로벌 변수
def foo3():
    global x3
    x3 = 30
    print(x3)

foo3()
print(x3)

#4. locals()를 사용 --> 전역 혹은 지역 내 변수들이 어떤 것이 있는지 locals()를 통해 알 수 있다.
x_ = 10
print(locals())

def foo4():
    x4 = 40
    print(locals())
foo4()

#5. 함수 안에 함수를 만들어보자.
def print_hello():
    hello = "Hello, world!"
    def print_message():
        print(hello)
    print_message()
print_hello()

#6. nonlocal 사용
def A():
    x = 10
    def B():
        nonlocal x   #B의 지역변수로 선언되지 않고, A의 지역변수로 까지 영향을 끼친다.
        x = 20
    B()
    print(x)
A()


#7. nonlocal을 사용하기 // 정답: 50,400 --> (20+30, 100+400)
def A():
    x = 10
    y = 100
    def B():
        x = 20
        def C():
            nonlocal x
            nonlocal y
            x = x + 30
            y = y + 300
            print(x)
            print(y)
        C()
    B()
 
A()


#8. global 사용하기 // 정답 31
x = 1
def A():
    x = 10
    def B():
        x = 20
        def C():
            global x
            x = x + 30
            print(x)
        C()
    B()
 
A()

#9. closure
# 이렇게 함수를 둘러싼 환경(지역 변수, 코드 등)을 계속 유지하다가, 함수를 호출할 때 다시 꺼내서 사용하는 함수를 클로저(closure)라고 합니다.
def calc():
    a = 3
    b = 5
    def mul_add(x):
        return a * x + b    # 함수 바깥쪽에 있는 지역 변수 a, b를 사용하여 계산
    return mul_add          # mul_add 함수를 반환
 
c = calc() # c는 mul_add를 의미. a=3, b=5를 유지하고 여기에 x값을 집어넣으면 해당 값이 출력 됌.
print(c(1), c(2), c(3), c(4), c(5))

#10. 람다를 이용한 closure
def calc2():
    a = 30
    b = 50
    return lambda x: a*x +b
c = calc2()    
print(c(1),c(2),c(3),c(4),c(5))


#연습문제
def counter():
    i=0
    def count():
        nonlocal i
        i+=1
        return i
    return count
c = counter()
for i in range(10):
    print(c(),end=' ')

#퀴즈
def countdown(n):
    n +=1
    def count():
        nonlocal n
        n-=1
        return n
    return count

n = int(input())
c = countdown(n)
for i in range(n):
    print(c(), end=' ')
