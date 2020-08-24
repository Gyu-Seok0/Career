#42.1 데코레이터 만들기

#1 함수의 시작과 끝을 나타내는 데코레이터.
def trace(func):
    def wrapper():
        print(func.__name__, "함수시작")
        func()
        print(func.__name__, "함수종료")
    return wrapper

def hello():
    print('hello')
def world():
    print('world')

trace_hello = trace(hello)
trace_hello()

#2 @사용하기.
def trace(func):
    def wrapper():
        print(func.__name__, "함수시작")
        func()
        print(func.__name__, "함수종료")
    return wrapper

@trace
def hello():
    print("안녕")

hello()

#42.2 매개변수와 반환값을 처리하는 데코레이터 만들기.
def trace(func):
    def wrapper(a,b):
        r = func(a,b)
        print('{0}(a={1},b={2}) -> {3}'.format(func.__name__,a,b,r))
        return r
    return wrapper

@trace
def add(a,b):
    return a+b

print(add(10,20))

#42.2.1 가변 인수 함수 데코레이터
def trace(func):
    def wrapper(*args, **kwargs):
        r = func(*args, **kwargs)
        print("{0}(args = {1}, kwargs={2}) -> {3}".format(func.__name__, args, kwargs,r))
        return r
    return wrapper

@trace
def get_max(*args): # 위치인수를 사용하는 가변인수 함
    return max(args)

@trace
def get_min(**kwargs):
    return min(kwargs.values())
print(get_max(10,20))
print(get_min(x=10,y=20,z=30))


#42.3 매개변수가 있는 데코레이터 만들기.
def is_multiple(x):              # 데코레이터가 사용할 매개변수를 지정
    def real_decorator(func):    # 호출할 함수를 매개변수로 받음
        def wrapper(a, b):       # 호출할 함수의 매개변수와 똑같이 지정
            r = func(a, b)       # func를 호출하고 반환값을 변수에 저장
            if r % x == 0:       # func의 반환값이 x의 배수인지 확인
                print('{0}의 반환값은 {1}의 배수입니다.'.format(func.__name__, x))
            else:
                print('{0}의 반환값은 {1}의 배수가 아닙니다.'.format(func.__name__, x))
            return r             # func의 반환값을 반환
        return wrapper           # wrapper 함수 반환
    return real_decorator        # real_decorator 함수 반환
 
@is_multiple(3)     # @데코레이터(인수)
def add(a, b):
    return a + b
 
print(add(10, 20))
print(add(2, 5))

#42.4 클래스로 데코레이터 만들기.
class Trace:
    def __init__(self,func):
        self.func = func
    def __call__(self):
        print(self.func.__name__, "함수시작")
        self.func()
        print(self.func.__name__, "함수 끝")
@Trace
def hello():
    print("안녕")

hello()

#42.5 클래스로 매개변수와 반환 값을 처리하는 데코레이터
class Trace:
    def __init__(self, func):
        self.func = func
    def __call__(self, *args, **kwargs):
        r = self.func(*args, **kwargs)
        print("{0}(args={1}, kwargs = {2} -> {3}".format(self.func.__name__, args, kwargs, r))
        return r
@Trace
def add(a,b):
    return a+b

print(add(10,20))
print(add(a=10,b=20))

#42.7 연습문제
def type_check(type_a, type_b):
    def real_decorator(func):
        def wrapper(a, b):
            if isinstance(a, type_a) and isinstance(b, type_b):
                return func(a, b)
            else:
                raise RuntimeError('자료형이 올바르지 않습니다.')
        return wrapper
    return real_decorator
    



@type_check(int,int)
def add(a,b):
    return a+b
print(add(10,20))
print(add('hello','world'))

#42.7 퀴즈
def html_tag(key):
    def real(func):
        def wrapper():
            temp1 = "<"+key+">"
            temp2 = func()
            temp3 = "</"+key+">"
            return temp1+temp2+temp3
        return wrapper
    return real


a, b = input().split()
 
@html_tag(a)
@html_tag(b)
def hello():
    return 'Hello, world!'
print(hello())


