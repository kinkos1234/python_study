# 세트, 딕셔너리, 문자열

## 세트(set)

- 집합이라고도 부름, 순서가 보장 되지 않음 (Index 없음)
- 요소의 중복을 허용하지 않음
- `{}`로 생성 가능

### 세트 생성하기
``` python
seta = set()
seta

seta = set([1, 2, 3, 4, 5, 6, 6, 6, 7, 8, 8])
seta
```

### `add()` 값 추가하기
- `add()`를 활용해 세트에 값을 추가 가능, 한번에 1개 값 추가
- 이 때 요소의 중복은 허용하지 않으므로 중복되지 않은 값만 추가 됨
``` python
seta = set()

seta.add(1)
seta.add(1)
seta.add(1)
seta.add(2)
seta.add(3)

seta
```

###  `update()` 여러 값 추가
- `update()`를 사용할 경우 동시에 여러 값을 추가 가능
- list나 tuple 혹은 set 요소들도 한번에 추가 가능(단 중복 제거된 상태로 추가됨)
* `update()`를 사용할 경우 문자열은 반드시 리스트로 감싸고 입력해야 함
``` python
seta = {1, 2, 3}

seta.update([4, 5, 6, 6])
seta

seta.update((7, 8, 9))
seta

seta.update({10, 11, 12})
seta
```

### `remove()` 값 제거
- 단일 요소 제거 가능
``` python
seta = {1, 2, 3, 4}
seta.remove(2)
seta
```

### 교집합(intersection)
- 집합 A와 B가 주어졌을 때 공통된 요소
- `&`기호나 `intersection` 메서드를 활용해 구할 수 있음
``` python
a = {1, 2, 3, 4, 5}
b = {3, 4, 5, 6, 7}

a & b

a.intersection(b)
```

### 합집합(union)
- 집합 A와 B가 주어졌을 때 두 요소 모두를 포함하는 것
- `|` 기호나 `union()` 메서드를 활용해 구할 수 있음
``` python
a= {1, 2, 3, 4, 5}
b = {3, 4, 7}
a | b

a.union(b)
```

### 차집합(difference)
- 두 집합에서, 하나의 집합에는 포함되고 다른 집합에 포함되지 않는 원소들
- `-`연산자 혹은 `difference()` 메서드를 활용해 구할 수 있음
``` python
a = {1, 2, 3, 4, 5}
b = {3, 4, 5, 6, 7}
a - b

a.difference(b)
```

### set를 list로 변환
- `list()`로 가능
- 단, 자체 변환이 아니기 때문에 변수 지정이 필요함
``` python
a = {1, 2, 3, 4, 5}
list(a)

b = list(a)
```

### list를 set로 변환
- `set()`로 변환 가능
- 중복 요소 제거할 때 많이 활용
``` python
a = [1, 1, 3, 2, 5, 5, 4]
set(a)

b = set(a)
```

## 딕셔너리(dictionary, dict)
- 순서가 보장되지 않는 자료형
- 키와 값의 쌍으로 이루어짐
- key를 사용하여 값 조회 가능
- 수정, 삭제, 추가 가능 (가변)

### 생성하기
- `dict()` 메소드로 생성 가능
- `{'key' : value, }` 포멧으로 생성 가능
``` python
dicta = dict()
type(dicta)

dictb = {'a' : 1, 'b' : 2}
```

### 값 조회하기
- key 값으로 값 조회 가능
- `변수명[key]` 형식으로 조회
- 이때 조회한 key 가 딕셔너리에 존재하지 않을 경우 에러 출력
``` python
dictc = {'a' : 1, 'b' : 2}
dictc['b']

dictc['c']  #변수 내에 존재하지 않으므로 에러 반환
```

### `keys()` 모든 key 조회하기
- `.keys()` 메소드로 딕셔너리 내에 존재하는 모든 키값 조회 가능
! 이때 출력되는 `dict_keys`는 리스트가 아님. 객체로 생성되니 list로 변경하려면 타입 변환이 필요함
``` python
dictd = {'aa' : 11, 'bb' : 22, 'cc' : 33}
dictd.keys()
```

### `values()` 모든 value 조회하기
- `.values()` 메소드로 딕셔너리 내에 존재하는 모든 value값 조회 가능.
``` python
dictd.values()
```

### `itens()` 모든 key, value 조회
- key, value가 튜플로 뮥여서 조회 됨
``` python
dictd.items()
```

### key 값 존재 유무 확인
- `'key' in 변수명` 형태로 확인 가능
- 결과는 True / False 형태로 출력
``` pyton
'dd' in dictd
```

### 값 추가하기

- `변수명['key] = value` 로 key-value 쌍을 추가할 수 있음
``` python
dicte = {'aaa' : 11, 'bbb' : 22, 'ccc' : 33}

dicte[0] = 223
dicte

dicte["ddd"] = 44
dicte
```

### `update()` 다중 업데이트
- 여러 값의 쌍을 한번에 업데이트
``` python
dictf = {"사과" : 1000, "바나나" : 2000, "배" : 3000}
fruit = {"오렌지" : 4000, "귤" : 5000, "한라봉" : 6000}

dictf.update(fruit)
dictf
```

### value 값 변경
- `변수명[기존key] = 신규value` 형식으로 값 변경 가능
``` python
dictf["사과"] = 9999
dictf
```

### `pop()` 값 제거
- `pop(key)` 형식으로 값 제거 가능하며, 이 때 제거되는 값의 value를 반환함
``` python
dictf.pop("바나나")
dictf
```

### `len()` 요소 개수 파악
`len(변수명)` 행식으로 요소 개수 파악 가능. 이 때 요소는 key-value 쌍의 수를 의미
``` python
len(dictf)
```

## 문자열(string, str)

### 문자열(텍스트)의 중요성
- 자연어처리 데이터는 대부분 텍스트 데이터로 이루어짐
- 흔히 접하는 Excel, Table 데이터 안에도 수많은 텍스트 데이터 존재
- 게다가 한국은 영어와 한글까지 추가 처리할 수 있어야 함

### 문자열 특성
- 문자열 역시 리스트, 튜플과 마찬가지로 sequesnce형 자료 구조
- 불변 객체임(immutable)

### 문자열 생성
- `''`나 `""`로 생성할 수 있음
- `'`나 `"`를 3번 중첩하여 여러 줄의 문자열 생성 가능
  - 이 때, 그냥 `'`나 `"`를 사용한 후 줄 바꿈을 `\n`의 개행 이스케이프 코드를 사용할 수 있지만, 줄이 너무 길어져 불편함
``` python
a = '나는 김정현 입니다.'
b = "너는 누구입니까?"
print(a, b)

c = '''나는 김정현 인데
너는
누구니?'''
print(c)

d = """나는 김벙어리 인데
왜 자꾸
말을
시키는거야"""
print(d)

e = "이거는\n뭔지 모른다"
print(e)
```

#### 이스케이프 코드 정리
1. `\n`	: 문자열 안에서 줄을 바꿀 때 사용
2. `\t`	문자열 사이에 탭 간격을 줄 때 사용
3. `\\`	\를 그대로 표현할 때 사용
4. `\'`	작은따옴표(')를 그대로 표현할 때 사용
5. `\"`	큰따옴표(")를 그대로 표현할 때 사용
6. `\r`	캐리지 리턴(줄 바꿈 문자, 커서를 현재 줄의 가장 앞으로 이동)
7. `\f`	폼 피드(줄 바꿈 문자, 커서를 현재 줄의 다음 줄로 이동)
8. `\a`	벨 소리(출력할 때 PC 스피커에서 '삑' 소리가 난다)
9. `\b`	백 스페이스
10. `\000`	널 문자

주로 1~4번이 많이 쓰이고 나머지는 거의 쓰이지 않음

### 문자열 출력(포맷팅)

#### `print()` 출력
- `print(출력할 항목)` 형태로 출력 가능
- `%`를 활용한 출력 기능
  - %s = 문자열
  - %d = 정수
  - %f = 실수 (자릿수 제한시 %.xf)
  - %c = 문자 1개
- {}와 format 메소드를 사용한 출력 : `'{}' .format(출력값)` 형태로 사용
  - 소수점 x자리 까지 제한할 경우, `'{:.xf}' .format(0.12341231231)` 형태로 사용
``` python
"안녕하세요 %s" % ('반갑습니다.')
"제 나이는 %d살 입니다" % (36)
'제 승률은 %.1f 입니다' % (52.3)
'너의 학점은 %c란다' % ('C')
'웰컴투 {}' .format('더 헬')
'우리집 가격은 {}억 입니다.' .format(8.7791)
'우리집 가격은 {:.1f}억 입니다.' .format(8.7791)
```

### f 문자열 포맷팅
- `print(f'문자열 내용 {변수명}.')` 형식으로 변수명을 바로 사용 가능
- 연산 처리도 가능 ex. {age+1}
- dict의 값을 호출시 `{변수명['key']}` 형식을 사용할 경우 value 출력 가능
``` python
name = '김삼돌'
age = 17
print(f'안녕하세요 저는 {name}입니다. 저는 {age}살이에요.')
print(f'내년에는 {age+1}살이 되겠지요.')

a = {'age' : 39, 'name' : '김한구'}
print(f"반갑다. 나는 {a['name']} 이라고 한다. 내 나이는 {a['age']} 살이다.")
```

### `len()` 문자열 길이 확인
- 영문의 경우 알파벳 수를 세개 되며, 공백이 있을 경우 포함됨
- 한글은 완성된 한 글자를 1개로 카운트
``` python
print(len("nano"))
print(len("nano banana"))
print(len("나노"))
print(len("나노 바나나"))
```

### 인덱싱(indexing)
- 문자열에서 한 개의 글자(c)를 조회하기 위해서 `[]`를 활용한 인덱싱
- 이 때도 음수 인덱싱 가능
``` python
a = 'welcom to the hell'
print(a[0])
print(a[-3])
```

### 슬라이싱
- `[start:stop:step]` 슬라이싱을 활용하여 부분 추출 가능
``` python
a[:]    #전체 추출
a[2:]   #시작 인덱스 지정
a[-3:]  #음수 인덱스도 가능
a[:5]   #종료 인덱스 지정, 인덱스 앞까지 출력
a[5:9]  #시작점 포함, 종료점 제외 구간 인덱싱
a[::2]  #건너뛸 범위 설정
a[::-1] #역순 출력
```

### 문자열 연산
- 덧셈 : 두 문자열을 연결시킴
- 곱셈 : 문자열을 숫자 만큼 반복하여 생성
``` python
a = "orange "
b = "cola"
a + b

a * 5

print(a * 7)
print('===' * 17)
```

### 문자열 변환
- list로 변환할 경우 `list(문자열)`로 가능
  - 이 때, 한 글자를 요소로 갖는 리스트 생성
- set로 변환할 경우 `set(문자열)`로 가능
  - 이 때, 한 글자를 요소로 갖는 세트가 생성되며 중복은 제거됨
``` python
list('cucumber')

set('cucumber')
```

### 문자열 관련 기능
- 문자열만 가지고 있는 고유의 기능들

- `spit()` : 분리
  - 문장을 특정 규칙에 의해 쪼기는 기능
  - 분리한 결과는 list 형식으로 값을 return
  - 기본 값은 공백으로 지정되어 있음(공백 기준으로 쪼개서 리스트로 반환)
``` python
a = 'This is a pen'
a.split()

a = 'This-is-a pen'
a.split('-')

a = '한글도 동일하게 처리 됩니다요'
a.split()

a = '한글도-동일하게-처리*됩니다요'
a.split('-')
```

- `join()` : 합치기
  - 결합하고자 하는 문자에 `.join()`로 결합 가능
``` python
'-'.join(['010', '1234', '4567'])

'-'.join('가나다라마바사아자차카타파하')
```

- `lower()`, `upper()` : 소문자/대문자 만들기
  - 영문은 가능, 한글은 대문자 개념이 없어서 변환 안됨
``` python
a = "My Name Is Tommy"
a.lower()

a.upper()
```

- `startswith()`, `endswith()` : 시작/끝 문자열 확인, Bool 타입으로 결과 반환
``` python
a = 'so easy 003'

a.startswith('so')

a.startswith('012')

a.endswith('003')
```

### `Replace()` : 문자열 바꾸기, 공백 제거
- 문자열에 `replace(바꿀 대상, 바꾸려는 문자열)` 지정하여 문자열 교체 가능
- 결과는 복사본이 만들어져 반환 됨
``` python
a = '012.png'

a.replace('png', 'jpg')
```

### `strip()` : 공백 제거
- `strip()` : 양쪽 공백 제거
- `lstrip()` : 좌측 공백 제거
- `rstrip()` : 우측 공백 제거
``` python
a = '      hello        '
a.strip()
a.lstrip()
a.rstrip()
```