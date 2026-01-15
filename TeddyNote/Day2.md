# 리스트, 튜플, 그리고 클래스

## 리스트(list)

- 리스트는 데이터의 요소를 순차적으로 파악하는데 용이한 자료형. 순서가 있는 가변 구조
- 리스트는 다양한 메서드(method) 혹은 함수를 지원하며 활용하여 요소를 추가, 삭제 및 변경할 수 있음

! **메서드(method)**: 객체(object)가 포함하는 함수 혹은 기능

### - 생성
`[]` 형태로 표현


- 빈 리스트 생성 방법
``` python
lista = []
lista

listb = list()
listb
```

- 리스트를 생성하면서 값을 포함하는 방법
``` python
listc = [1, 3, 2, 4, 5]
listc
```

### list 규칙
* list는 다양한 type의 데이터를 집합으로 가짐
* 2중 list 구조(list안에 list)도 허용
* list는 순서(order)의 개념이 존재
``` python
a = []
a

a = [1, 2, 3]
a

a = [1, 'hello', 3, 3.14, True]
a

# 이중 list 구조
a = [1, 'hello', 3, 3.14, [6, 7, '8']]
a
```

### list 관련 함수

- `.` 점 연산자로 함수를 실행

### append() : 값 추가
- 빈 리스트 생성 후 append() 로 값 추가 가능
- 이때 맨 뒤에 값이 추가됨
``` python
lista = []
lista.append(1)
lista
```

- 중복된 값을 추가할 수 있으며, 순서가 **유지** 됨
``` python
lista.append(7)
lista.append(7)
lista.append(7)
lista.append(3)
lista.append(5)
lista.append(2)
lista
```

### sort() : 정렬
- 요소를 순서대로 정렬(오름차순)
- sort()는 내부적으로 정렬
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
lista.sort()
lista
```
- 역정렬(reverse order)도 가능(`reverse=True`를 지정)
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
lista.sort(reverse=True)
lista
```

### sorted() : 정렬

- 요소를 순서대로 정렬
- 내부적으로 정렬하지 않고 **정렬된 복사본을 반환** (원본은 변형되지 않음)
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
listb = sorted(lista)
print(lista)
print(listb)
```
- `reverse=True`를 지정하여 역정렬
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
sorted(lista, reverse=True)
```

### reverse() : 역정렬
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
lista.reverse() #내부적 정렬
lista           #출력시 역정렬 된 상태로 나옴

lista[::-1]     #사본 정렬 반환
lista           #출력시 정렬 전 그대로 나옴
```

### len() : 전체 항목의 개수 세기
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
len(lista)
```

### insert() : 값 추가
- 지정한 index에 값 추가
- index(a, b) : a는 index, b는 추가할 값
``` python
lista = [1, 6, 3, 2, 7, 5, 4]
lista.insert(1, 100)
lista
```

### remove() : 값 제거
- 리스트에서 첫 번째 나오는 해당 값 삭제
``` python
lista = [1, 2, 3, 4, 7, 7, 7, 6, 5]
lista.remove(7)
lista
```

### pop() : 요소 꺼내기
- 해당 index의 요소를 반환주고 해당 요소는 리스트에서 삭제
``` python
lista = [1, 2, 3, 4, 7, 7, 7, 6, 5]
lista.pop(1)
lista
```

### del : 요소 삭제
- `del list명[a]` 형식 : a는 index
``` python
lista = [100, 200, 300, 400, 500]

del lista[1]
print(lista)

del lista[3]
print(lista)
```

### count() : 갯수 세기
``` python
a = [1, 1, 1, 1, 1, 2, 2, 3]
a.count(1)
a.count(2)
a.count(5)
```

### extend() : 리스트 확장
- `extend([a, b, c])` : 기존 리스트의 두에 다른 리스트를 추가하는 방법
``` python
a = [1, 2, 3]
a.extend([4, 5])
a
```
`+` 연산자는 extend()와 동일한 기능을 수행합니다.
``` python
a = [1, 2, 3]
a + [4, 5]

c = [6, 7, 8]
a + c
```

### 인덱싱(indexing): 색인
``` python
lista = [1, 2, 3, 4]
```
인덱스는 **0번 부터 시작** 합니다.
``` python
lista[0]
lista[3]
lista[4]    #index가 리스트의 기존 범위 밖일 경우 에러 반환
```

### 역순 인덱싱

- 파이썬은 음수 인덱싱을 지원
``` python
lista
lista[-1]
lista[-3]
lista[-5]    #index가 리스트의 기존 범위 밖일 경우 에러 반환
```

### 인덱스로 접근하여 값 바꾸기
``` python
listb = [1, 2, 3, 4, 5]
listb

listb[0]

listb[0] = 100

listb
listb[-1] = 300

listb
```

### 중첩된 리스트 인덱싱

- 중첩된 리스트에 대한 리스트는 중첩 인덱싱으로 접근. 값 변경도 가능
``` python
listc = [['가', '나', '다'], [4, 5, 6], 7, 8, 9]
listc[1]            #2번째 값 [4, 5, 6] 지칭
listc[1][1]         #2번째 값의 2번째 값 5 지칭
listc[1][1] = 99
listc
```

### 슬라이싱(Slicing): 범위 추출

- 슬라이싱의 활용: [start:stop:step] 을 명시하여 부분을 추출
- `[:]` : 전체 추출
- `[start:]` : 시작 index 부터 끝까지 추출
- `[:end]` : 처음부터 end **전까지** 추출
- `[start:end]` : start부터 end **전까지** 추출
- `[::-1]` : **역순** 출력
- `[::step]` : step의 수만큼 건너뛰며 출력

``` python
listd = [100, 200, 300, 400, 500]
listd[:]
listd[2:]
listd[-3:]      #역순 인덱싱 지원
listd[:3]
listd[1:3]
listd[-3: -1]
listd[::-1]
listd[::-2]
listd[1::2]
```

### list 덧셈: list 확장
``` python
a = [1, 2, 3, 4]
b = [5, 6, 7, 8]
a + b
```

### list 곱셈: list 반복
``` python
a = ['a', 'b', 'c']
b = [1, 2, 3, 4]
a * 2
b * 3
a * b    #곱셈은 [리스트 * 숫자]만 가능
```

## 튜플(tuple)

- 리스트(list)는 가변(mutable)하는 객체(object)이지만, **튜플(tuple)은 불변(immutable)한 객체**
- 불편 객체는 **요소에 대한 수정, 삭제, 변경이 불가**

### 생성
- tuple(), () 로 생성합니다.
- 혹은 , 로 생성할 수 있습니다.
``` python
tuplea = (1, 2, 3)
tuplea

tuplea = tuple([1, 2, 3])
tuplea

tuplea = 1, 2, 3
tuplea
```
- **단일 요소를 생성**할 때는 반드시 ,를 붙여야 함
- (1,)과 (1)은 다른 자료구조임
``` python
mytuple = 1,
print(type(mytuple))
mytuple

mytuple = (1,)
print(type(mytuple))
mytuple

mytuple = (1)
print(type(mytuple))
mytuple                 #이 경우 튜플이 아닌 정수형으로 처리됨
```

**튜플 언패킹(unpacking)**
- 튜플로 한 번에 **여러 변수에 값을 한 번에 할당**
``` python
a, b, c = 1, 2, 3

print(a)
print(b)
print(c)

# 좌우변의 항목 수가 동일해야 함
a, b = 1, 2, 3    #에러
```

### 튜플 요소 조회
``` python
tuplec = (1, 2, 3)
tuplec[1]
```

### 튜플 덧셈: 튜플의 확장
- 리스트의 연산과 동일
``` python
a = (1, 2)
b = (3, 4)

a + b
```

### 튜플 곱셈: 튜플의 반복
- 리스트의 연산과 동일
``` python
a * 3
a * 10
```

### 길이 파악하기
``` python
mytuple
len(mytuple)
```

### list를 tuple로 변환
``` python
a = [1, 2, 3, 4]
type(a)

b = tuple(a)
type(b)
```

### tuple을 list로 변환
``` python
a = (1, 2, 3, 4)
type(a)

b = list(a)
type(b)
```

## 클래스(class)
  * 프로그램 코드를 작성하기 위한 필수 요소는 아니지만, 사용시 얻을 수 있는 이익이 참 많음

! 계산기 예시
- 만약 class 없이 계산기를 만드려면 한 프로그램에서 2개 이상의 계산기가 필요한 경우 각각의 결과값을 유지하기 위해 함수를 개별적으로 따로 만들어야 함.

### 클래스와 객체
- 클래스란 빵틀을, 객체는 그 빵틀로 찍어낸 빵을 의미
- 즉, 클래스는 무언가를 반복적으로 만들어 낼 수 있는 도면 / 객체는 그를 활용해 생성된 피조물을 의미
- 단, 클래스로 생성된 객체는 객체마다 고유의 성격을 가져 동일 클래스로 생성해도 각각의 객체에 영향을 주지 않음

- class 기본형
``` python
class Cookie:
  pass
```

- 객체 생성
``` python
a = Cookie()
b = Cookie()
```
→ 이 때 Cookie()의 결과값을 리턴 받는 a와 b가 객체

### !객체와 인스턴스의 차이
- `a = Cookie()`에서 `a`는 "객체"이면서 Cookie의 인스턴스
- 즉, 인스턴스란 특정 객체가 어떤 클래스의 객체인지를 **관계 위주로 설명**한 표현
- ex. a는 객체다.
- ex. a는 Cookie의 인스턴스다

### 메서드(method)

- 클래스 내부에서 정의된 함수를 의미 (내부 함수)
- 함수 정의 기본형

``` python
def 함수명(매개변수):
  수행할_문장
  ...
```

### 메서드의 매개변수
- 첫째 매개변수로 사용되는 `self`, 객체 메서드를 호출할 때 호출한 객체 자신이 전달되기 때문
- ex. `a.setdata(4, 2)`에서 `a`가 `self`에 대입 됨
- →`Calc.setdata(a, 4, 2)` 이런 형식으로도 사용 가능하지만 잘 쓰지 않음

### 메서드의 수행문
- 메서드가 수행할 내용을 문서로 정의
- 매개변수를 입력시 먼저 `self.first = first`처럼 변수를 정의 함
- 이때 a에 객체변수 first가 생성되고, first에 해당하는 변수 값이 저장되는 방식
- 이 객체변수를 `인스턴스 변수` 혹은 `속성` 이라고 부름

### 사칙연산 계산기 클래스
``` python
class Calc:
    def setdata(self, first, second):      # 메서드 매개변수 정의
        self.first = first                 # 메서드 수행문
        self.second = second               # 메서드 수행문
    def add(self):                         # 덧셈 메서드 매개변수 정의
        result = self.first + self.second  # 덧셈 메서드 수행문
        return result                      # 덧셈 메서드 수행문(결과 반환)
    def mul(self):
        result = self.first * self. second
        return result
    def sub(self):
        result = self.first - self.second
        return result
    def div(self):
        result = self.first / self.second
        return result
```

### 생성자(Constructor)
- 상기와 같은 코드에서 `setdata`를 선행하지 않고 `add`를 실행시 `AttributeError`가 발생하게 됨
- 하여 이럴 때는 `setdata`와 같은 메서드 호출보다, 생성자를 사용하는 것이 안전

#### 생성자 개념
- 객체가 생성될 때 자동으로 호출되는 메서드
- 파이썬 메서드명 `__inti__`를 사용하면 메서드가 생성자가 됨
- 객체 생성시 자동으로 호출 됨
``` python
class Calc:
    def __init__(self, first, second):
        self.first = first
        self.second = second
    def setdata(self, first, second):
        self.first = first
        self.second = second
    def add(self):
        result = self.first + self.second
        return result
    def mul(self):
        result = self.first * self. second
        return result
    def sub(self):
        result = self.first - self.second
        return result
    def div(self):
        result = self.first / self.second
        return result
```
- 이 때, `__init__`는 이름 빼고 `setdata`와 모든 것이 동일하지만, `__init__`이기 때문에 생성자로 인식되어 **객체가 생성되는 시점에 자동으로 호출 됨**

### 클래스 상속
- 클래스를 만들 때 다른 클래스의 기능을 물려받을 수 있게 하는 것
- class 구문 작성시 `(상속할 클래스 이름)`으로 시작하면 상속 됨
- 이때 상속할 클래스를 `부모 클래스`라고 부르며, 상속 받은 클래스를 `자식 클래스`라고 부름
``` python
class moreCalc(Calc):
  pass
```

#### 상속의 근본적 사용 이유
- 기존 클래스를 변경하지 않고 기능을 추가하거나 기존 기능을 변경하려 할 때 사용
- 기존 클래스가 **라이브러리 형태**로 제공되거나, **수정이 허용되지 않는 상황**에서 주로 사용

### 제곱근 계산기
``` python
class moreCalc(Calc):
    def pow(self):
        result = self.first ** self.second
        return result
```

### 오버라이딩(oeverriding)
- 부모 클래스에 있는 메서드를 동일한 이름으로 다시 만드는 것
- 오버라이딩 한 경우, 부모 클래스의 메서드 대신 오버라이딩 한 메서드가 호출 됨
``` python
class moreCalc(Calc):
    def div(self):
        if self.second == 0:
            return 0
        else:
            return self.first / self.second
```

### 클래스변수
- 클래스 안에 변수를 선언하여 생성 됨
- `클래스이름.클래스변수`로 사용 가능
``` python
class Family:
    lastname = "김"
```
- 위 경우 `Family` 클래스에 선언한 `lastname`이 클래스변수
- `Family.lastname`으로 사용 가능

-  객체변수는 다른 객체변수들 간에 영향을 주고받지 않고 독립적으로 값을 유지
- 클래스변수는 동일 클래스로 만든 모든 객체에 공유됨
- 단, 객체변수를 직접 생성하여 값을 배정할 경우 다른 객체변수에 영향을 주지 않음
- ex. `a.lastname = "최"` 를 사용할 경우, `Family.lastname`과 `b.lastname`에는 영향을 주지 않음

---