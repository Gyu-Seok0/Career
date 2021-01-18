
# 인스턴스 속성 (객체당 각자 고유의 bag를 소유)
class Person:
    def __init__(self):
        self.bag = []
        
    def put_bag(self, stuff):
        self.bag.append(stuff)

james = Person()
james.put_bag("책")
maria = Person()
maria.put_bag("열쇠")
print(james.bag)
print(maria.bag)

# 클래스 속성 --> 하나의 bag을 공유한다.
class Person():
    bag = []
    def put_bag(self,stuff):
        Person.bag.append(stuff)   #Person 대신에 self를 써도 되지만, 클래스 속성임을 표현하기 위함.

A = Person()
A.put_bag("이산수학")
B = Person()
B.put_bag("선형대수학")
print(A.bag)

# 독스트링 --> 주석을 읽을 때 씀!
class Person:
    '''사람 클래스입니다.'''
    
    def greeting(self):
        '''인사 메서드입니다.'''
        print('Hello')
 
print(Person.__doc__)             # 사람 클래스입니다.
print(Person.greeting.__doc__)    # 인사 메서드입니다.
 
maria = Person()
print(maria.greeting.__doc__)     # 인사 메서드입니다.

# 정적 메소드 사용 --> 인스턴스를 부르지 않고, class로 바로 구현 가능
class Calc:
    @staticmethod
    def add(a,b):
        print(a+b)

    @staticmethod
    def mul(a,b):
        print(a*b)

Calc.add(10,20)
Calc.mul(10,20)

# 파이썬 자료형의 인스턴스 메소드와 정적 메소드
a = {1,2,3,4}
a.update({5}) #인스턴스 메소드

set.update({1,2,3,4},{5})







