
#파일 쓰기
file = open('hello.txt','w')
file.write('Hello, world!')
file.close()

#파일 읽기
file = open('hello.txt','r')
s = file.read()
print(s)
file.close()

#자동으로 닫기 --> with
with open('hello.txt','r') as file:
    s = file.read()
    print(s)


#파일을 한 줄씩 쓰기

lines = ['안녕하세요.\n', '저는\n', '파이썬마스터\n', '입니다.\n']
with open('hello.txt','w') as file:
    file.writelines(lines)

#파일을 한 줄씩 읽기
with open('hello.txt', 'r') as file:
    for line in file:
        print(line.strip())


#파이썬 객체를 파일에 저장하기 (피클링)
import pickle

name = 'GyuSeok'
age = 25
address = '경기도 하남시 덕풍동'
scores = {'korean':90, 'English':100, 'Math':110}

with open('Gyuseok.p', 'wb') as file:
    pickle.dump(name,file)
    pickle.dump(age,file)
    pickle.dump(address,file)
    pickle.dump(scores,file)
    
   
#파이썬 객체를 파일에 저장하기 (언피클링)
import pickle

with open('Gyuseok.p','rb') as file:
    name = pickle.load(file)
    age = pickle.load(file)
    address = pickle.load(file)
    scores = pickle.load(file)
    print(name)
    print(age)
    print(address)
    print(scores)

#연습문제
with open('words.txt','r') as file:
    words = file.read().split()
    for word in words:
        if 'c' in word:
            print(word.strip('.,'))






