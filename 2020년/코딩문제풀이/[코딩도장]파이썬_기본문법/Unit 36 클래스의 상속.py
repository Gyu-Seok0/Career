
#Unit 36: 클래스의 상속
#상속은 동등한 관계에서 발생.
class Person:
    def greeting(self):
        print("안녕하세요 나는 사람입니다")

class Student(Person): # Studnet class(자식)가 Person class(부모)의 기능을 상속받는다. 
    def study(self):
        print("공부하기")

james = Student()
james.greeting()
james.study()

#동등한 관계가 아닌 포함관계에서는 상속이 아닌 인스턴스를 이용한다. --> 실행오
class Personlist:
    def __intit__(self):
        self.person_list = []
        
    def append_person(self,Person):
        self.person_list.append(Person)

gyuseok = Person()
A = Personlist()

# super(): 기반클래스(부모)의 init사용.

class Person:
    def __init__(self):
        print('Person __itit__')
        self.hello = "안녕하세요"

class Student(Person):
    def __init__(self):
        print('Student __init__')
        self.school = "파이썬 코딩 도장"
        super().__init__()

james = Student()
print(james.school)
print(james.hello)

# 파생클래스(자식)의 init이 존재하지 않다면, 자연스레 부모의 init이 상속.

class Studnet2(Person):
    pass
hong = Studnet2()
print(hong.hello)

# 기반클래스와 파생클래스의 오버라이딩 (우선하다)
class Person:
    def greeting(self):
        print("안녕하세요^.^")
class Student(Person):
    def greeting(self):
        super().greeting() #이게 없으면 자식class의 greeting으로 overriding 됌.
        print("저는 파이썬을 뿌시러 왔습니다 :)")

s = Student()
s.greeting()

## 다중상속
class Person:
    def greeting(self):
        print("안녕하세요")
class University:
    def manage(self):
        print('학점관리')
class Undergraduate(Person,University):
    def study(self):
        print('공부하기')
jane = Undergraduate()
jane.greeting()
jane.manage()
jane.study()
jane.mro()


# 36.8 연습문제
class AdvancedList(list):
    def replace(self,old,new):
        while old in self:
            self[self.index(old)] = new

x = AdvancedList([1, 2, 3, 1, 2, 3, 1, 2, 3])
print(x)
x.replace(1, 100)
print(x)


# 퀴즈문제
class Animal:
    def eat(self):
        print('먹다')
class Wing:
    def flap(self):
        print('파닥거리다')

class Bird(Animal,Wing):
    def fly(self):
        print('날다')
b = Bird()
b.eat()
b.flap()
b.fly()
print(issubclass(Bird, Animal))
print(issubclass(Bird, Wing))
