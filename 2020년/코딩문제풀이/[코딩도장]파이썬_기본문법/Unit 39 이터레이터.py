
# Unit39 이터레이터
#1 dir로 메서드 확인 --> iter 메서드 사용.
print(dir([1,2,3]))
print([1,2,3].__iter__())

#2 iterator가 어떻게 구현되는지 확인.
it = [1,2,3].__iter__()
try:
    print(it.__next__())
    print(it.__next__())
    print(it.__next__())
    print(it.__next__())
except:
    print("Error 발생")

#3 이터레이터 만들기.
class Counter:
    def __init__(self,stop):
        self.current = 0
        self.stop = stop
    def __iter__(self):
        return self
    def __next__(self):
        if self.current < self.stop:
            r = self.current
            self.current +=1
            return r
        else:
            raise StopIteration
for i in Counter(3):
    print(i,end = " ")
print()
#이터레이터 언패킹
a,b,c = Counter(3)
print(a,b,c)
a,b,c,d,e = Counter(5)
print(a,b,c,d,e)

# _사용하면, 해당 변수는 사용하지 않겠다.
a, _, c, d = range(4)
print(a,c,d)

## 인덱스로 접근할 수 있는 이터레이터 만들기.
class Counter:
    def __init__(self,stop):
        self.stop = stop
    def __getitem__(self,index):
        if index < self.stop:
            return index*10
        else:
            raise IndexError

print(Counter(3)[0],Counter(3)[1],Counter(3)[2])
for i in Counter(5):
    print(i, end= " ")
print()
#파이썬 내장 함수: iter과 next
it = iter(range(3))
print(next(it))
print(next(it))
print(next(it))


# 2가 나올때 까지 for문 돌리기.
import random
it = iter(lambda : random.randint(0,5),2)
for i in iter(lambda : random.randint(0,5),2):
    print(i, end= " ")


#연습문제: 배수 이터레이터 만들기.
class MultipleIterator:
    def __init__(self, stop, multiple):
        self.current = 0
        self.stop = stop
        self.mul = multiple
    def __iter__(self):
        return self
    def __next__(self):
        temp = self.current*self.mul
        if temp < self.stop:
            self.current +=1
            return temp
        else:
            raise StopIteration
for i in MultipleIterator(20,3):
    print(i, end= " ")
print()
            
#퀴즈
class TimeIterator:
    def __init__(self,start,stop):
        self.key = stop - start
        self.cnt = 0
        self.s = start % 60
        temp = start//60
        self.m = temp%60
        h = temp//60
        if h>=24:
            h = h-24
        self.h = h
        
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.cnt < self.key:
            temp_s = self.cnt + self.s
            if temp_s >= 60:
                temp_m = self.m + 1
            else:
                temp_m = self.m

            if temp_m >= 60:
                temp_h = self.h +1
            else:
                temp_h = self.h

            if temp_h >= 24:
                temp_h = temp_h -24
            ans = '{0:02d}:{1:02d}:{2:02d}'.format(temp_h,temp_m,temp_s)
            self.cnt +=1
            return ans
        else:
            raise StopIteration
        
    def __getitem__(self,index):
        if index < self.key:
            temp_s = index + self.s
            if temp_s >= 60:
                temp_m = self.m + 1
            else:
                temp_m = self.m

            if temp_m >= 60:
                temp_h = self.h +1
            else:
                temp_h = self.h

            if temp_h >= 24:
                temp_h = temp_h -24
            ans = '{0:02d}:{1:02d}:{2:02d}'.format(temp_h,temp_m,temp_s)
            return ans
        else:
            raise IndexError

start, stop, index = map(int, input().split()) 
for i in TimeIterator(start, stop):
    print(i)
print('\n', TimeIterator(start, stop)[index], sep='')

