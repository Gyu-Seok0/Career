# Unit44 모듈 사용하기.
'''
#맛보기
import math
print(math.pi)
print(math.sqrt(4.0))

#간단하게 사용하기.
import math as m
print(m.sqrt(2))

#모듈에서 특정 변수만 가져오기.
from math import pi
from math import sqrt
print(pi)
print(sqrt(3))

#한줄에 가져오기.
from math import pi as p, sqrt as s
print(p)
print(s(5))


#url패키지에서 request모듈 사용하기.
#import.패키지.모듈
import urllib.request
response = urllib.request.urlopen('http://www.google.co.kr')
response2 = urllib.request.urlopen('https://hisnet.handong.edu/for_student/main.php')

print(response.status)
print(response2.status)

#간단하게 사용 
import urllib.request as r
res = r.urlopen("http://www.naver.com")
print(res.status)

#from 사용
from urllib.request import Request, urlopen # Request 클래스와, urlopen 함수를 가져옴.
req = Request('http://www.naver.com')
response = urlopen(req)
print(response.status)

#간단사용
from urllib.request import Request as r, urlopen as u
req = r("http://www.google.co.kr")
print(u(req))


#모듈 설치
#윈도우+R --> cmd
# pip install 패키지 이름.
import requests
r = requests.get("www.naver.com")
print(r.status_code)
'''

#연습문제: 소수점 이하 올림, 버림 구하기.
from math import ceil, floor
x= 1.5
print(ceil(x),floor(x))

#원넓이 구하기.
from math import pi
r = float(input())
ans = pi*r*r
print(ans)










