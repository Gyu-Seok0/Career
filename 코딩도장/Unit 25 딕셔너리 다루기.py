#딕셔너리 공부하기
x = {'a':10, 'b':20, 'c':30, 'd':40}

#딕셔너리에 값 추가하기
x.setdefault('e', 50)

#딕셔너리 값 수정하기
x.update(a = 90)

#zip을 이용한 표현
dict(zip([1,2],['one','two']))
list(zip([1,2],['one','two']))  # tuple 형태의 원소로 묶인 list
tuple(zip([1,2],['one','two'])) # tuple 형태의 원소로 묶인 tuple (이중 tuple)

#딕셔너리 값 삭제하기.
x.pop('a')  #해당 value값을 출력하면서 딕셔너리에서 삭제.
x.pop('z',0) # x에는 key값 z가 존재하지 않으므로, 지정된 값인 0을 출력.

#딕셔너리에서 값 가져오기
x['b']
x.get('b')

## get 활용법
temp = 'I am the father, the God'
temp_list = temp.split()

temp_dic = dict()
for item in temp_list:
    temp_dic[item] = temp_dic.get(item,0) +1

# key, value를 출력해보자
for key, value in x.items():
    print(key, value, sep=':')
    
#응용
x = {key: value for key, value in x.items() if value != 20}

#이렇게 하면, dict의 size가 바뀌면서 error발생.
'''
for key, item in x.items():
    if item == 20:
        del x[key]
'''    
#이렇게 해도 key값만 출력이 가능합니다
for key in x:
    print(key)

#연습문제

keys = input().split()
values = map(int, input().split())

x = dict(zip(keys, values))
x = {key:value for key, value in x.items() if value != 30 and key != 'delta'}



print(x)


