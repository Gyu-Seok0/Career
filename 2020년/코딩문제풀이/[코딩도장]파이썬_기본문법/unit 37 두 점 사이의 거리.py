## Unit37 두 점 사이의 거리 구하기.

#1 class 준비.
class Point2D:
    def __init__(self,x,y):
        self.x = x
        self.y = y

p1 = Point2D(x=30, y=20)
p2 = Point2D(x=60, y=50)

print('p1: {} {}'.format(p1.x,p1.y))
print('p2: {} {}'.format(p2.x,p2.y))

#2 피타고라스 정리
import math

a = p2.x - p1.x
b = p2.y - p1.y

c= math.sqrt(a*a+b*b)
print(c)

#collections 응용 --> class 구현 --> 약간 람다로 함수 구현하는 거랑 비슷

import collections
point2D = collections.namedtuple('Point2D', ['x','y'])
p1 = Point2D(x=30, y=20)
p2 = Point2D(x=60, y=50)
print('p1: {} {}'.format(p1.x,p1.y))
print('p2: {} {}'.format(p2.x,p2.y))

#연습문제: 사각형의 넓이 구하기.
class Rectangle:
    def __init__(self, x1,y1,x2,y2):
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
rect = Rectangle(x1 = 20, y1=20, x2=40, y2=30)
width = rect.x1-rect.x2
vertical = rect.y1-rect.y2
area = abs(width*vertical)
print(area)

#퀴즈 선의 길이의 총합.
import math
class Point2D:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y
length = 0.0
p = [Point2D(), Point2D(), Point2D(), Point2D()]
p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y, p[3].x, p[3].y = map(int, input().split())

#함수의 parameter로 class 인자를 사용해도 된다는 점을 알게 되었다.
def line(A,B):
    width = A.x - B.x
    vertical = A.y - B.y
    return math.sqrt(width**2 + vertical**2)

for i in range(len(p)-1):
    length += line(p[i],p[i+1])
print(length)

# class를 이용해서 두 점 사이의 거리(피타고라스 정리)를 쉽게 구할 수 있다.
# sqrt와 같은 경우, math 라이브러리를 이용한다.


