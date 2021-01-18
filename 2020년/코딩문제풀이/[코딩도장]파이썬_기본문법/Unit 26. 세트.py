
# set 익히기 --> 집합

fruits = {'strawberry', 'grape', 'orange', 'pineapple', 'cherry'}
letter = set('apple')


#합집합
a = {1,2,3,4}
b = {3,4,5,6}

print(a|b)
print(set.union(a,b))

#교집합
print(a & b)
print(set.intersection(a,b))

#차집합
print(a-b)
print(set.difference(a,b))

#대칭차집합
print(a^b)
print(set.symmetric_difference(a,b))

#할당 연산자
a = {1,2,3,4}
a |= {5}
print(a)

a = {1,2,3,4}
a.update({5})
print(a)

#부분집합인지 여부묻기  --> 부등호로 크기 비교하면 됌.
a = {1,2,3,4}
a <= {1,2,3,4}

#세트에 요소 추가하기
a={1,2,3,4}
a.add(5)
print(a)

##세트에 특정 요소 삭제
#방법1
a.remove(3)
print(a)

#방법2
a.discard(2)
print(a)

#set의 복사
a = {1,2,3,4}
b = a.copy()
a is b #주소가 다르다.
a == b #요소가 같다.

#set의 표현식

a = {i for i in 'pineapple' if i not in 'apl'}
a = {i for i in range(10) if i !=7 and i != 2}



a,b = map(int,input().split())

a = {i for i in range(1,a+1) if a %i == 0}
b = {i for i in range(1,b+1) if b %i == 0}

