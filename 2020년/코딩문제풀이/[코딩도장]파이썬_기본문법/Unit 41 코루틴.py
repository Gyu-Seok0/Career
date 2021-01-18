
#1 코루틴 맛보기
def number_coroutine():
    while True:
        x = (yield)
        print(x)

co = number_coroutine()
next(co)

co.send(1)
co.send(2)
co.send(3)

#정리: next 함수로 코루틴의 코드를 최초실행 --> send로 값을 보내고, print를 해주고, x= yield에서 대기. 메인루프와 서브루프를 왔다갔다 하는 이런 과정이 바로 코루틴
#코루틴(coroutine)... 기존에는 함수에서 다른 함수를 부르면, 서브루틴은 메인루틴에 종속되는 관계였다. 그러나 코루틴은 이와달리, 메인과 서브가 서로 협력하며 왔다 갔다한다.

#2 코루틴 응용 
def sum_coroutine():
    total = 0
    while True:
        x = (yield total)
        total += x
co = sum_coroutine()
print(next(co))        # 코루틴의 코드를 최초 실행.

print(co.send(1))      # 코루틴에 숫자 1을 넣어줌  --> 출력되는 totla 1
print(co.send(2))      # 코루틴에 숫자 2를 넣어줌  --> 출력되는 total 1+2
print(co.send(3))      # 코루틴에 숫자 3을 넣어줌  --> 출력되는 total 1+2+3

#3 코루틴을 종료시키자.
def number_cor():
    while True:
        x = (yield)
        print(x, end= " ")

co = number_cor()
next(co)

for i in range(20):
    co.send(i)
co.close()

#4 코루틴 안에서 예외처리.
def sum_coroutine():
    try:
        total = 0
        while True:
            x = (yield)
            total+=x
    except RuntimeError as e:
        print(e)
        yield total
co = sum_coroutine()
next(co)

for i in range(20):
    co.send(i)
print(co.throw(RuntimeError, "예외로 코루틴 끝내기")) # e = 예외로 코루틴 끝내기, total = 190

#코루틴과 같은 자료구조가 존재한다는 정도만 알면 될듯.




