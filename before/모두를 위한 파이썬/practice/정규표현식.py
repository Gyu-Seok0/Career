#정규식 표현 연습
import re
'''
hand = open("tt.txt")
for line in hand:
    line.rstrip()
    #if line.find('From:') >=0:
    #if re.search('From:', line): # From이 들어가 있으면,
    #if line.startswith('From:'):
    if re.search('X-\S+:',line):
            print(line)
#cahpter2

#패턴 추출하기
from collections import Counter
x= 'My 2 favorite numbers are 19 and 42'
y = re.findall('[0-9]+',x)
y = re.findall('[aeiou]+',x)  #정규식으로 모음 찾아주기.
count = Counter(y)
print(y)
print(count)

#탐욕적 추출
x = 'From stemphen.marquard@uct.ac.ze Sat Jan 5 09:14:16 2008'
y = re.findall('\S+?@\S+?',x)
print(y)

y = re.findall('^From (\S+@\S+)',x)
print(y)
'''
#chapter3 실습
#uct.ac.ze 를 추출하는 다양한 방법
#1 find 함수 사용하기
data = 'From stemphen.marquard@uct.ac.ze Sat Jan 5 09:14:16 2008'
atpos = data.find('@')
sppos = data.find(' ',atpos)
host = data[atpos+1: sppos]
print(host)

#2 Double split pattern
words =data.split()
email = words[1]
pieces = email.split('@')
print(pieces[1])

#3 정규표현식
y =re.findall('@([^ ]*)',data)
print(y)

#4 정규표현식2
y = re.findall('^From .*@([^ ]*)', data)
print(y)

#예제
hand = open('mbox-short.txt')

numlist= list()

for line in hand:
    line = line.rstrip()
    stuff = re.findall('^X-DSPAM-Confidence: ([0-9.]+)',line)
    if len(stuff) != 1: continue
    num = float(stuff[0])
    numlist.append(num)
print('Max', max(numlist))
