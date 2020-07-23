
# *(애스터리스크)를 추가해서, 리스트 언패킹
def print_numbers(a,b,c):
    print(a)
    print(b)
    print(c)

x = [1,2,3]
print_numbers(*x)

# *args(가변인수)를 추가해서 함수만들기  -->함수인수의 개수가 정해지지 않을 때 사용.
def pr_num(*args):
    for arg in args:
        print(arg)
y = (1,2,3,4)

pr_num(*x)
pr_num(*y)


#고정인수와 가변인수 함께 사용
def p_num(a,*args):
    print(a)
    print(args)

p_num(*[10,20,30])

#output
#10
#(20,30)

#######################################################
#키워드인수
def personal_info(name,age,address):
    print('이름: ', name)
    print('나이: ', age)
    print('주소: ', address)

personal_info(name = '홍길동', age = 25, address = '서울시')
print()

#딕셔너리 언패킹

d = {'name': '홍길동', 'age': 312, 'address': '포항시'}
personal_info(**d)

#키워드 인수를 사용하는 가변 인수 함수 만들기

def personal_info(**kwargs):
    for kw,arg in kwargs.items():
        print(kw,':',arg, sep="")

#보통은 다음과 같이 표현한다.
def personal_info(**kwargs):
    if 'name' in kwargs:
        print('이름:', kwargs['name'])
    if 'age' in kwargs:
        print('나이:', kwargs['age'])
    if 'address' in kwargs:
        print('주소:', kwargs['address'])


personal_info(name='홍길동', age=30, address='서울시 용산구 이촌동')

#참고 위치인수 args와 키워드 인수 kwarg를 같이 사용한다면?
def custom_print(*args, **kwargs):
    print(*args, **kwargs)

custom_print(1,2,3, sep= ":", end= '')

#퀴즈
def get_max_score(*args):
    return max(args)

korean, english, mathematics, science = 100, 86, 81, 91
max_score = get_max_score(korean, english, mathematics, science)
print('높은 점수:', max_score)

#실전

def get_min_max_score(*args):
    return min(args), max(args)

def get_average(**kwargs):
        return sum(kwargs.values())/len(kwargs)

korean, english, mathematics, science = map(int, input().split())


min_score, max_score = get_min_max_score(korean, english, mathematics, science)
average_score = get_average(korean=korean, english=english,
                            mathematics=mathematics, science=science)
print('낮은 점수: {0:.2f}, 높은 점수: {1:.2f}, 평균 점수: {2:.2f}'
      .format(min_score, max_score, average_score))
 
min_score, max_score = get_min_max_score(english, science)
average_score = get_average(english=english, science=science)
print('낮은 점수: {0:.2f}, 높은 점수: {1:.2f}, 평균 점수: {2:.2f}'
      .format(min_score, max_score, average_score))
