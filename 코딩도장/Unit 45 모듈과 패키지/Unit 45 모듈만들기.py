# Unit45 모듈만들기!
'''
import square2 as s #모듈 square2를 불러서 s에 담는다.

print(s.base) #s에 내장된 변수인 base를 부른다.
print(s.square(10)) #s의 내장함수인 square를 이용해서 2^10을 출력한다.

import person as p
maria = p.Person('마리아',20,'서울시 서초구 반포동')
maria.greeting()
'''
from person import Person as p
hong = p('홍길동',25,'미스터피자')
hong.greeting()
