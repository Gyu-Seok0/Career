'''
def pr_num(*args):
    for arg in args:
        print(arg)

pr_num(*[1,2,3,4,5])

def p_num(**kwargs):
    for kr,arg in kwargs.items():
        print(kr,arg)

A = {"홍길동":123, "이석규":154}
'''
#람다식 연습--> x= x+10
plus_ten = lambda x:x+10
print(plus_ten(1))
print((lambda x:x+10)(2))

#람다를 쓰는 이유: 기존 함수(def)로 표현했을 때보다 훨씬 줄었다.
print(list(map(lambda x:x+10,[1,2,3])))

#람다표현식에서 조건부 표현식 사용하기
a = [x for x in range(1,11)]
print(list(map(lambda x: str(x) if x%3 ==0 else x,a)))

#map에 객체를 여러 개 넣기
a = [1,2,3,4,5]
b = [2,4,6,8,10]
ans = list(map(lambda x,y: x*y,a,b))
https://dojang.io/mod/page/view.php?id=2360
