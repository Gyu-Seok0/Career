#class 선언하기.
class person:
    def greeting(self):
        print("Hello")

s = person()
s.greeting()


#속성 공부하기.
class person2:
    def __init__(self):
        self.hello = '안녕'
    def greeting(self):
        print(self.hello)
s2 = person2()
s2.greeting()

#인스턴스를 만들 때 값받기.
class person3:
    def __init__(self,name,age,address):
        self.hello = "안녕"
        self.name = name
        self.age = age
        self.address = address
    def greeting(self):
        print("{0} 저는 {1}입니다.".format(self.hello,self.name))

maria = person3("마리아","20","서울시 서초구 반포동")
maria.greeting()

#위치인수와 리스트 언패킹 사용.
class person4:
    def __init__(self, *args):
        self.hello = "안녕"
        self.name = args[0]
        self.age = args[1]
        self.address = args[2]
    def greeting(self):
        print("{0} 저는 {1}입니다.".format(self.hello,self.name))

maria = person4(*["마리아4","20","서울시 서초구 반포동"])
maria.greeting()

#키워드 인수 사용.
class Person:
    def __init__(self, **kwargs):    # 키워드 인수
        self.name = kwargs['name']
        self.age = kwargs['age']
        self.address = kwargs['address']
 
maria1 = Person(name='마리아', age=20, address='서울시 서초구 반포동')
maria2 = Person(**{'name': '마리아', 'age': 20, 'address': '서울시 서초구 반포동'})

#인스턴스를 생성 뒤 속성 추가.
class Person:
    pass

maria = Person()
maria.name ="마리아"
print(maria.name)


# 메서드 안에서 속성 추가 --> 단, 메서드가 불려지고 나서 해당됌
class Person:
     def greeting(self):
         self.hello = '안녕하세요'

s = Person()
s.greeting()
s.hello

######################### 34.2
# 비공개 속성
class person():
    def __init__(self,name,age,address,wallet):
        self.name = name
        self.age = age
        self.address = address
        self.__wallet = wallet
    def pay(self, amount):
        self.__wallet -= amount
        print("이제 {0}원 남았습니다".format(self.__wallet))
        
maria = person("마리아",20,"서울시 서초구 반포동",10000)
maria.pay(3000)

#연습문제: 게임 캐릭터 클래스 만들기
class Knight:
    def __init__(self,**kwargs):
        self.health = kwargs['health']
        self.mana = kwargs['mana']
        self.armor = kwargs['armor']
    def slash(self):
        print('베기')

x = Knight(health=542.4, mana=210.3, armor=38)
print(x.health, x.mana, x.armor)
x.slash()



#퀴즈문제: 게임 캐리터 만들기
class Annie:
    def __init__(self,health,mana,ability_power):
        self.health = health
        self.mana = mana
        self.ability_power = ability_power
    def tibbers(self):
        print('티버: 피해량 {0}'.format(self.ability_power*0.65+400))


health, mana, ability_power = map(float, input().split())
 
x = Annie(health=health, mana=mana, ability_power=ability_power)
x.tibbers()





