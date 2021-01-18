#방법1

word = input("단어입력:")
print(word == word[::-1])

#방법2

word = input("단어입력:")

flag = True
for i in range(len(word)//2):
    if word[i] != word[-1-i]:   #뒤에서 읽는 다는 표현을 이렇게!
        flag = False
        break
print(flag)

#방법3

word = input("단어입력")
#print(list(word) == list(reversed(word)))  # reversed로 읽고, 이를 list로 표현
print(word == ''.join(reversed(word)))


##############
#N-gram
word = input("입력: ")
N = int(input("N 입력: "))

for index in range(len(word)):
    if index+N <= len(word):
        print(word[index:index+N])
    else:
        break

#zip을 사용하면 훨씬 쉽게 접근 가능
text = "hello"
print(list(zip(text,text[1:])))  #각 요소를 묶는 객체 zip 


#퀴즈문제
line = ["apache\n","decal\n","did\n","neep\n","noon\n","refer\n","river"]
with open('words.txt','w') as file:
    file.writelines(line)

file = open('words.txt', 'r')
s = file.read()
s = s.split('\n')

for word in s:
    if word == word[::-1]:
        print(word)

file.close()


