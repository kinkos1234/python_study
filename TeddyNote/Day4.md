# 연산과 조건문

## 연산

### 사칙연산
- 더하기 (+)
  - a += 3 은 a = a + 3 과 동일
- 빼기 (-)
  - a -= 3 은 a = a - 3 과 동일
- 나누기(/)    # 출력값은 int가 아닌 float형식으로 나옴
  - a /= 3 은 a = a / 3 과 동일
- 곱하기(*)
  - a *= 3 은 a = a * 3 과 동일
``` python
#덧셈
a = 10
b = 5
print(a + b)

a += 5
print(a)

#뺄셈
print(a - b)

a -= 5
print(a)

#나눗셈
print(a / b)

a /= 5
print(a)

#곱셈
print(a * b)

a *= 5
print(a)
```

### 기타 연산자

- `//` : floor division, 나눗셈에 대한 몫을 **정수형**으로 구함
- `%` : modulus, 몫을 나눈 나머지를 구함
- `**` : 제곱 연산자
``` python
# Floor division
a = 10
b = 3

print(a / b)
print(a // b)

# Modulus
print(a % b)

# 제곱
print(a ** b)
```

### 연산의 순서
일반 수학의 연산과 마찬가지로 *과 /을 먼저 계산하며, 괄호를 활용하여 먼저 연산할 부분을 지정할 수 있음

* 만약 연산시 두 인자의 타입이 다를 경우 에러가 발생함
``` python
print(10 + 2 * 5)
print((10 + 2) * 5)

# 동일한 인자인 경우
a = "10"
b = "20"

print(a+b)

# 다른 인자인 경우 에러 발생
a = '10'
b = 20

print(a + b)
```

### 비교연산자
- 대소비교
  - `>` : 크다
  - `>=` : 크거나 같다
  - `<` : 작다
  - `<=` : 작거나 같다
  
- 대소비교의 결과는 bool 타입으로 출력됨
``` python
print(1 > 2)
print(2 >= 2)
print(9 < 10)
print(8 <= 7)
```

- `==` : 같음을 의미
- `!=` : 같지 않음을 의미
``` python
# = 는 대입 연산자
a = 2

# 같다는 의미는 ==
print(a == 2)

# 같지 않다는 !=
print(a != 3)
```

## 조건문

### 조건문 if
- `if`는 '어떤 조건이 성립한다면~' 의 의미
  - if 구문의 끝에는 반드시 콜론(:)이 와야 함
  - 이하 구문에서의 들여쓰기 필수!

- `else`는 if 조건 후에 따라 나오며, if조건이 참이 아닌 경우 실행
  - else는 if와 동일한 들여쓰기여야 함

- `elif`는 3가지 이상 분기의 동작을 수행할 때 사용

- `0`과 `1`은 참 거짓을 표현하기도 함
``` python
# 단순 if문
if 5 > 3:
  print("참")

# if-else문
if 54 < 3:
  print("참")
else:
  print("거짓")

# if-elif-else문
if 27 < 5:
  print("if")
elif 32 > 7:
  print("elif")
else:
  print("else")

# 0과 1을 활용한 구문
if 1:
  print('참')
else:
  print('거짓')

if 0:
  print('참')
else:
  print('거짓')
```

### 삼항 연산자
- `[참일 때 출력] if [조건] else [거짓일 때 출력]` 형식의 문법
``` python
age = 35

print("30세 이상") if age >= 30 else print("30세 이하")

age1 = 20
print("30세 이상") if age1 >= 30 else print("30세 이하")
```

### 논리 연산자
- `and`와 `or`는 두 가지 이상의 조건을 다룰 때 활용
  - `and`는 모든 조건을 만족할 때 참으로 인식
  - `or`는 조건 중 하나라도 만족할 때 참으로 인식
- `not`은 bool 값을 반전시킴
``` python
# and
print(True and True and True)
print(True and True and False)
print(False and False and False)

if (0 < 10) and (0 < 2):
  print('a도 참, b도 참')
else:
  print('둘 중 하나라도 거짓')

if (0 < 10) and (0 > 2):
  print('a도 참, b도 참')
else:
  print('둘 중 하나라도 거짓')

# or
print(True or True or True)
print(True or True or False)
print(False or False or False)

if (0 > 10) or (1 < 10):
  print('하나라도 참')
else:
  print('모두 거짓')

if (0 > 10) or (1 > 10):
  print('하나라도 참')
else:
  print('모두 거짓')

  # not
  print(not True)
  print(not False)
  print(not 0)

  if not True:
    print('not True')
  else:
    print('false')

  if not False:
    print('not False')
  else:
    print('false')
```

---