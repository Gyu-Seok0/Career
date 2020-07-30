
#map사용하기 --> if문을 쓸때 :은 생략하고, else문을 반드시 작성해야 한다.
a = [x for x in range(1,11)]
A = list(map(lambda x: str(x) if x%3 == 0 else x,a))
print(a)
print(A)


#map의 여러 객체를 넣기
a = [1,2,3,4,5]
b = [2,4,6,8,10]
X = list(map(lambda x,y: x*y,a,b))
print(a,b,X)

#filter 사용하기 --> 해당값이 True일때만 값을 가져온다.
def f(x):
    return x>5 and x<10

a = [8,3,2,10,15,7,1,9,0,11]
A = list(filter(f,a))
print(a,A)

#lambda+filter
A2 = list(filter(lambda x: x>5 and x<10,a))
print(A2)

#reduce --> 순차적으로 누적해서 f값을 적용한다!
def f(x,y):
    return x-y

a = [1,2,3,4,5]
from functools import reduce
ans = reduce(f,a)
print(ans)

#lambda+reduce
from functools import reduce
ans2 = reduce(lambda x,y: x-y,a)
print(ans2)


#퀴즈
files = input().split()
ans = list(map(lambda word: "0"*(3-len(word[:word.find('.')]))+word if len(word[:word.find('.')]) <3 else word,files))
