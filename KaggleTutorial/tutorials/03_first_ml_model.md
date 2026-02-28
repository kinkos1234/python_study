# 튜토리얼 3: 첫 번째 머신러닝 모델 (Your First Machine Learning Model)

> 원본: [Kaggle - Your First Machine Learning Model](https://www.kaggle.com/code/dansbecker/your-first-machine-learning-model)  
> 실습: [Ex 2: 첫 번째 ML 모델](../exercises/ex2_first_ml_model.ipynb)

---

## 🎯 학습 목표

- 모델링에 사용할 데이터(특성, 타겟)를 선택하는 방법을 배운다
- scikit-learn으로 첫 번째 결정 트리 모델을 학습시키고 예측한다

---

## 📖 내용 정리

### 1단계: 열 목록 확인

데이터를 불러온 뒤, 어떤 열(feature)을 사용할지 파악합니다.

```python
import pandas as pd

melbourne_file_path = '../input/melbourne-housing-snapshot/melb_data.csv'
melbourne_data = pd.read_csv(melbourne_file_path)

# 모든 열 이름 확인
melbourne_data.columns
```

---

### 2단계: 결측값 처리 (임시)

지금은 가장 단순한 방법으로 **결측값이 있는 행을 제거**합니다.

```python
# axis=0: 행(row) 단위로 결측값이 있는 행을 제거
melbourne_data = melbourne_data.dropna(axis=0)
```

> 💡 `dropna`: "drop NaN(결측값)" 의 약자. 나중에 더 정교한 결측값 처리 방법을 배웁니다.

---

### 3단계: 예측 대상(y) 선택

예측하고 싶은 값(타겟)을 선택합니다. 관례적으로 **`y`** 라는 변수명을 사용합니다.

```python
# 점(dot) 표기법으로 특정 열 선택
y = melbourne_data.Price
```

> **Series**: 하나의 열만 선택하면 DataFrame이 아닌 Series가 됩니다 (1차원 데이터).

---

### 4단계: 특성(X) 선택

모델에 입력될 열들을 **특성(features)** 이라고 합니다. 관례적으로 **`X`** 라는 변수명을 사용합니다.

```python
# 사용할 특성 열 목록
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'BuildingArea',
                      'YearBuilt', 'Lattitude', 'Longtitude']

# 리스트로 여러 열 선택
X = melbourne_data[melbourne_features]
```

데이터를 빠르게 확인하는 방법:

```python
X.describe()  # 통계 요약
X.head()      # 처음 5행 확인
```

---

### 5단계: 모델 정의 및 학습

scikit-learn 라이브러리를 사용합니다.

```python
from sklearn.tree import DecisionTreeRegressor

# 모델 정의 (random_state: 결과 재현성을 위한 고정값)
melbourne_model = DecisionTreeRegressor(random_state=1)

# 모델 학습 (fit: 훈련 데이터에서 패턴 학습)
melbourne_model.fit(X, y)
```

---

### 6단계: 예측

```python
print("다음 5채의 집 예측 가격:")
print(melbourne_model.predict(X.head()))
```

---

## 🔑 핵심 개념 정리

### X와 y의 역할

```
X (특성/Features)           y (타겟/Target)
┌─────────────────────┐     ┌──────────┐
│ Rooms │ Bathroom │… │ →  │  Price   │
│   3   │    1     │… │     │ 950,000  │
│   4   │    2     │… │     │ 1,200,000│
└─────────────────────┘     └──────────┘
        입력 변수                예측할 값
```

### scikit-learn 모델 학습의 4단계

| 단계      | 코드                              | 설명                |
| --------- | --------------------------------- | ------------------- |
| 1. 임포트 | `from sklearn.tree import ...`    | 라이브러리 가져오기 |
| 2. 정의   | `model = DecisionTreeRegressor()` | 모델 객체 생성      |
| 3. 학습   | `model.fit(X, y)`                 | 데이터로 패턴 학습  |
| 4. 예측   | `model.predict(X_new)`            | 새 데이터 예측      |

---

## 💻 전체 코드

```python
import pandas as pd
from sklearn.tree import DecisionTreeRegressor

# 데이터 로드
melbourne_file_path = '../input/melbourne-housing-snapshot/melb_data.csv'
melbourne_data = pd.read_csv(melbourne_file_path)

# 결측값 제거
melbourne_data = melbourne_data.dropna(axis=0)

# 타겟(y)과 특성(X) 분리
y = melbourne_data.Price
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'BuildingArea',
                      'YearBuilt', 'Lattitude', 'Longtitude']
X = melbourne_data[melbourne_features]

# 모델 학습
melbourne_model = DecisionTreeRegressor(random_state=1)
melbourne_model.fit(X, y)

# 예측
predictions = melbourne_model.predict(X.head())
print(predictions)
```

---

## 💡 핵심 정리

- `y`: 예측 대상 (타겟), 하나의 열
- `X`: 입력 특성들, 여러 열로 구성
- `dropna()`: 결측값 있는 행 제거
- `fit(X, y)`: 모델 학습
- `predict()`: 학습된 모델로 예측

---

## ➡️ 다음 단계

- 📝 [실습 2: 첫 번째 ML 모델](../exercises/ex2_first_ml_model.ipynb) 완료 후
- [튜토리얼 4: 모델 검증](04_model_validation.md)으로 이동
