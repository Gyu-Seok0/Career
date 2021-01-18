#문자열 바꾸기
#파이썬은 OOP를 지향하기 때문에, 문자열의 기능을 Method라고 부른다.


#문자열 바꾸기
s = 'Hello, world, world'
s = s.replace('world','python')  #world라는 모든 문자를 다 찾아서, 바꿔준다.
print(s)

#문자열 분리하기
fruit = 'apple pear grape pineapple orange'.split()
print(fruit)

#리스트를 문자열로 연결하기
str_fruit = ' '.join(fruit)
print(str_fruit)

#메소드 체이닝 --> 여러 개의 메소드를 연결해서 호출할 수 있다.
answer = 'python'.rjust(10).upper()
print(answer)

#문자열 왼쪽에 0 채우기
print('35'.zfill(4))
print('3.5'.zfill(6))

#문자열 찾기: find

print('apple pineapple'.find('pl')) #인덱스 2를 출력
print('apple pineapple'.find('xy')) #해당 문자가 없으므로, -1 출력

#문자열 개수 세기: count
print('apple pineapple'.count('pl'))

##############################################

#24.2 문자열 서식 지정자와 포매팅 사용하기

#ex1
print('I am %s.' % 'james')

#ex2
print('Today is %d %s.' %(3, 'April'))

#ex3 포매팅 {index}
print('Hello, {0}'.format('world!'))

#ex4
print('Hello, {0} {2} {1}'.format('Python', 'Script', 3.6))

#ex5
lan = 'python!'
version = 3.6
answer = f'Hello, {lan} {version}'   #문자열 앞에 f를 붙이면 된다. 
print(answer)


# 연습문제 파일명만 출력하기
path = 'C:\\Users\\dojang\\AppData\\Local\\Programs\\Python\\Python36-32\\python.exe'
p = path.split('\\')
filename = p[-1]
print(filename)


# 실전문제 the의 개수 찾기
#내 풀이
string = input()
temp = string.split(' ')

cnt = 0
for item in temp:
    if item == 'the' or (item[:3] == 'the' and item[3:].isalpha()== False) :
        cnt +=1
print(cnt)


#정답
string = input()
words = string.split()

cnt = 0
for word in words:
    temp = word.strip(",.\"")
    print(temp)
    if temp == 'the':
        cnt +=1
print(cnt)



# 실전문제 --> 높은 가격 순으로 출력하기
test = "51900;83000;158000;367500;250000;59200;128500;1304000"
t_list = test.split(";")
t_list = sorted(map(int,t_list))


for item in reversed(t_list):
    item = str(item)
    num = len(item) // 3
    
    index = -3
    while(num >0):
         item = item[:index]+','+item[index:]
         index -= 4
         num -=1
    item = item.strip(',')
    print("%9s"% item)







































