#Unit38. 예외 처리 --> 예외가 발생해도, 남은 스크립트를 모두 실행시켜준다.

#1 맛보기
def ten_div(x):
    return 10/x

try: #시도.
    x = int(input("나눌 숫자를 입력하세요: "))
    y = 10/x
    print(y)
except:         #예외가 발생하면 구문 실행.
    print("예외가 발생했습니다")


#2 특정 예외만 처리

y = [10,20,30]
try:
    index, x = map(int,input("인덱스와 숫자 입력: ").split())
    print(y[index]/x)
except ZeroDivisionError as e:
    print("0으로 나눌 수 없습니다", e)
except IndexError as e:
    print("잘못된 인덱스 입니다", e)

##3 else
#실행
try:
    x = int(input("숫자입력: "))
    y = 10/x
#예외
except ZeroDivisionError as e:            
    print("0으로 나눌 수 없습니다.",e)
#예외가 발생하지 않았을 때
else:
    print(y)

##4 finally
#실행
try:
    x = int(input("숫자입력: "))
    y = 10/x
#예외
except ZeroDivisionError as e:            
    print("0으로 나눌 수 없습니다.",e)
#예외가 발생하지 않았을 때
else:
    print(y)
#항상실행.
finally:
    print("코드실행이 끝났습니다")

##5 raise
try:
    x = int(input("3의 배수를 입력하세요:"))
    if x % 3 != 0:
        raise Exception("3의 배수가 아닙니다")
    print(x)
except Exception as e:
    print("예외 발생!", e)

##6 raise 심화
def three_multiple():
    x = int(input("3의 배수를 입력하세요:"))
    if x%3 != 0:
        raise Exception('3의 배수 아님')
    print(x)

try:
    three_multiple()
except Exception as e:
    print("예외발생", e)
 
##6 함수안에도 try-except를 넣어봅시다.
def three_multiple():
    try:
        x = int(input("3의 배수를 입력하세요:"))
        if x%3 != 0:
            raise Exception('3의 배수 아님')
        print(x)
    except Exception as e:
        print('three_multiple 함수에서 예외발생',e)
        raise
try:
    three_multiple()
except Exception as e:
    print("스크립트 파일에서 예외발생", e)

##7 asssert
x = int(input("3의배수를 입력하세요"))
assert x%3 ==0, "3의 배수가 아닙니다"
print(x)

## 예외 만들기.
class NotThreeMultipleError(Exception):
    pass

def three_multiple():
    try:
        x = int(input("3의 배수 입력: "))
        if x%3 !=0:
            raise NotThreeMultipleError("3의 배수가 아닙니다!")
        print(x)
    except Exception as e:
        print('예외발생!', e)
three_multiple()


#퀴즈
class NotPalindromeError(Exception):
    pass

def palindrome(word):
    temp = ""
    for i in reversed(range(len(word))):
        temp += word[i]
    if temp == word:
        print(word)
    else:
        raise NotPalindromeError('회문이 아닙니다')
try:
    word = input()
    palindrome(word)
except NotPalindromeError as e:
    print(e)
    

