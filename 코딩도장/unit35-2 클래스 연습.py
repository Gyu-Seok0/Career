#클래스 method

class Person:
    count =0          # class 변수
    def __init__(self):
        Person.count+=1 # 클래스가 불려질때마다 추가.

    @classmethod      # 클래스 메소드
    def print_count(cls):  #class의 약자 cls
        print("{0}명 생성".format(cls.count)) 

james = Person()
maria = Person()

Person.print_count()

#연습문제: 날짜 클래스 만들기

class Date:
    @classmethod
    def is_date_valid(cls,date):
        temp = date.split("-")
        month = int(temp[1])
        day = int(temp[2])
        if (month >=1 and month <=12) and (day >=1 and day <=31):
            return True
        return False

if Date.is_date_valid('2000-10-31'):
    print('올바른 날짜 형식입니다.')
else:
    print('잘못된 날짜 형식입니다.')

#퀴즈: Time

class Time:
    def __init__(self,hour,minute,second):
        self.hour = hour
        self.minute = minute
        self.second = second

    @classmethod
    def is_time_valid(cls,string):
        h,m,s = map(int,string.split(':'))
        return h<=24 and m<=59 and s<=60

    @classmethod
    def from_string(cls,string):
        h,m,s = map(int,string.split(':'))
        return Time(h,m,s)

time_string = input()
 
if Time.is_time_valid(time_string):
    t = Time.from_string(time_string)
    print(t.hour, t.minute, t.second)
else:
    print('잘못된 시간 형식입니다.')
