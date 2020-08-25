# Unit 43. 정규표현식
'''
#43.1 
import re
re.match('Hello','Hello, world! ')

# ^ = 맨앞, $ = 맨뒤
print(re.search('^Hello','Hello, world!'))
print(re.search('world!$','Hello, world!'))

# | = or의 뜻
print(re.match('hell|world','hello'))

#43.2 범위 판단하기
# *는 0개 이상,
# +는 1개 이상.
import re
print(re.match('[0-9]*','1234')) # 1234는 0~9 숫자가 0개 이상이므로 매칭.
print(re.match('[0-9]+','1234')) # 1234는 0~9 숫자가 1개 이상이므로 매칭.
print(re.match('[0-9]+','abcd')) # abcd 0~9 숫자가 없으므로 매칭 x
print(re.match('[0-9]*','abcd'))

#연습
import re
print(re.match('a+b','aab'))
print(re.match('a+bc+','aab'))  # c가 1개 이상 없으므로, 매칭되지 않는다.

#문자가 한 개만 있는지 판단하기
# . 위치에 아무문자가 1개 있는지
import re
print(re.match('ab.d','abxd')) #
print(re.match('ab[0-9]?c', 'ab0c'))

#문자가 정확히 몇 개 있을까?
print(re.match('h{3}', 'hhhelloh'))
print(re.match('[a-zA-Z0-9]+', 'Hello1234')) #a-z까지,A-Z까지,0-9까지 1개이상 있으면 매칭
print(re.match('[가-힣]+','홍길동'))


#특정문자가 포함되지 않는것을 판별
# [^A-Z]+
# [^A-Z]*
import re
print(re.match('[^A-Z]+', 'Hello')) #대문자가 한 개 이상 없어야 함.
print(re.match('[^A-Z]+', 'hello')) #대문자가 한 개도 없으므로, 매칭


# 간단한 정규표현식
print(re.match('\d+','1234'))
print(re.match('\D+','1234'))
print(re.match('\w+','1234')) # [a-zA-Z0-9]와 동일함.
print(re.match('\W+','1234'))

#43.3 그룹사용.
import re
m = re.match('([0-9]+) ([0-9]+)','10 295')
print(m.group(1)) #첫번째 그룹에 매칭된 문자열
print(m.group(2)) #두번째 그룹에 매칭된 문자열
print(m.group()) #첫번째, 두번쨰 그룹에 매칭된 문자열
print(m.groups()) #첫번째, 두번째 그룹에 매칭된 문자열을 튜플 형태로 반환.

#findall
print(re.findall('[0-9]+', '1 2  Fizz 4 Buzz Fizz 7 8'))
print(re.findall('\w+', '1 2  Fizz 4 Buzz Fizz 7 8'))

#43.4 특정 문자열을 찾은 뒤, 다른 문자열로 바꾸기!
import re
print(re.sub('apple|orange', 'fruit', 'apple box orange tree'))
print(re.sub('[0-9]+','n' ,'1 2  Fizz 4 Buzz Fizz 7 8'))

def multiple10(m):
    n = int(m.group())
    return str(n*10)

print(re.sub('[0-9]+',multiple10, '1 2  Fizz 4 Buzz Fizz 7 8'))

#연습문제: 이메일 주소 검사하기.
import re
p = re.compile('^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
emails = ['python@mail.example.com', 'python+kr@example.com',              # 올바른 형식
          'python-dojang@example.co.kr', 'python_10@example.info',         # 올바른 형식
          'python.dojang@e-xample.com',                                    # 올바른 형식
          '@example.com', 'python@example', 'python@example-com']          # 잘못된 형식
 
for email in emails:
    print(p.match(email) != None, end=' ')
'''

#퀴즈문제
import re
url = input()
#url = "http://www.example.com/hello/world.do?key=python"
p = re.compile('^http://[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/[a-zA-Z0-9-_.?=/]+|^https://[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/[a-zA-Z0-9-_.?=/]+')
print( p.match(url) != None)



