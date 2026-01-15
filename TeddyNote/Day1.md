# 파이썬의 기초와 자료형

## Print : 출력
- **print( )**
- 기본적으로 결과물을 출력하기 위한 함수
- ( ) 사이에 출력할 내용을 입력하는 방식

``` python
print('2조 김정현입니다.')
print(1, 3, 5, 7, 9)
```

## 변수 (Variable)
변수란 **데이터를 담는 그릇**
텍스트, 파일, 숫자값 등 데이터를 재사용하기 쉽게 별도의 이름을 지정해 두는 것

### 변수의 이름 규칙
아래 문자만 사용 가능함
- 영문 소문자 / 대문자
- 숫자(0~9)
- 한글 (비추)
* 특수 기호는 언더바(_)만 가능

아래 규칙을 따름
- 대소문자는 구별됨: 변수명 aa / AA / Aa / aA는 모두 다른 변수로 구별됨
- 숫자는 처음에 올 수 없음: a1은 가능하지만 1a는 불가능
- 키워드 사용 불가: def, if, del, import, return 등 기본에 명령어로써 기능을 가지는 단어들

``` python
a = 1
print(a)

a19 = 19
print(a)

Aa = 23
aA = 32
print(Aa)
print(aA)

a1 = 1
print(a1)

_a = 66
a_ = 77
print(_a)
print(a_)
```

> 일반 특수문자(_ 제외), 첫자리에 숫자가 오는 경우 사용 **불가**하며, 공백 사용 불가
``` python
korea13! = 13
13korea = 13
korea 13 = 13
```

> 일반적으로는 [영문 소문자 + _ 혹은 숫자] 형식이 일반적임
``` python
test = 10
test1 = 11
test_1 = 21
print(test)
print(test1)
print(test_1)
```

## 데이터 타입 (Data Type)
자료형(자료형태), 자료 구조 라고도 불림

주요 데이터 타입
1. `int`: Integer의 약자, 정수 형태
2. `float`: Floating point의 약자, 소수점이 존재하는 숫자 형태
3. `str`: String의 약자, 문자 형태이며 '' 혹은 "" 사이에 내용 기입
4. `bool`: boolean의 약자, 참/거짓으로 구분 가능한 자료형, True / False로 나오며 T F는 반드시 대문자 표기해야 함
5. `None`: Null 값을 의미

### type()
- type 함수는 데이터의 타입을 알아볼 수 있음.
- 변수에 값을 지정한 경우, type(변수명) 을 실행시 해당 값의 타입 확인 가능

``` python
type(1)
type(53.9)
type('안녕하세요')
type("안녕하세요")
type(True)
# type(true) : 소문자는 변수로 취급

true = True
type(true)

a = None
type(a)
print(a)
```

* 만약 여러 줄의 텍스트를 입력할 경우, ' 혹은 "을 3번 연속 중첩하여 사용
``` python
string = '''나는
우리집의
사람
입니다.
'''
print(string)


string_ = """나는
우리집의
사람
입니다.
"""
print(string_)
```

* bool의 경우 True False가 1, 0을 의미합니다.
``` python
1 == True   # 참
0 == False  # 참
1 == False  # 거짓
```

## 타입 변환

- `int`를 `float`으로 변환할 경우 **float()** 정수 뒤에 ".0"이 생성됨
``` python
a = 1
type(a)

float(a)
```

- `float`을 `int`로 변환할 경우 **int()** 소수점 이하는 절삭됨
``` python
b = 52.3
int(b)
```

- `bool`을 `int`로 변환할 경우, **int()** True는 1 / False는 0으로 치환
``` python
c = True
int(c)

d = False
int(d)
```

- 다른 자료형들을 `bool`로 변환할 경우, **bool()** 0이 아닌 모든 값은 True 치환
``` python
bool('우리집')
bool(5252.52)
```

