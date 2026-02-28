# 튜토리얼 4: 모델 검증 (Model Validation)

> 원본: [Kaggle - Model Validation](https://www.kaggle.com/code/dansbecker/model-validation)  
> 실습: [Ex 3: 모델 검증](../exercises/ex3_model_validation.ipynb)

---

## 🎯 학습 목표

- 모델의 품질을 측정하는 방법을 이해한다
- MAE(평균 절대 오차)를 계산한다
- 훈련 데이터와 검증 데이터를 분리하는 이유와 방법을 배운다

---

## 📖 내용 정리

### 모델 검증이란?

만든 모델이 얼마나 좋은지 평가해야 합니다. 대부분의 경우 **예측 정확도**가 핵심 지표입니다.

---

### ❌ 흔한 실수: "학습 데이터"로 평가하기

많은 사람들이 저지르는 큰 실수가 있습니다: **모델을 훈련시킨 데이터 그대로 예측하고 평가하는 것**입니다.

왜 문제일까요?

> **비유**: 시험에서 나올 문제를 미리 알고 공부했다면 점수는 높겠지만, 실제 실력을 측정하지 못합니다.

예를 들어, 학습 데이터에서 "초록색 문 집"이 모두 비쌌다면, 모델은 "초록색 문 = 비싼 집"을 배웁니다. 하지만 이건 우연일 수 있고, 새로운 데이터에서는 맞지 않을 수 있습니다.

---

### 평균 절대 오차 (MAE, Mean Absolute Error)

모델 품질을 하나의 숫자로 표현하는 지표입니다.

**계산 방법:**

```
각 집에 대한 오차 = 실제 가격 - 예측 가격

MAE = 평균(|오차|)
```

**해석**: "우리 예측은 평균적으로 X만큼 틀립니다"

```python
from sklearn.metrics import mean_absolute_error

# 학습 데이터에 대한 예측 (이건 잘못된 평가 방식!)
predicted_home_prices = melbourne_model.predict(X)
mean_absolute_error(y, predicted_home_prices)
```

---

### ✅ 올바른 방법: 검증 데이터 분리

데이터 일부를 **검증용**으로 따로 빼두고, 모델은 이 데이터를 학습에 사용하지 않습니다.

```
전체 데이터
    ↓ train_test_split
┌─────────────────┐  ┌──────────────┐
│  훈련 데이터     │  │  검증 데이터  │
│ (모델 학습용)   │  │ (평가용)     │
│   train_X, train_y  │  │  val_X, val_y  │
└─────────────────┘  └──────────────┘
```

```python
from sklearn.model_selection import train_test_split

# 데이터를 훈련/검증 세트로 분리
# random_state: 매번 같은 방식으로 나누어 재현 가능
train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=0)

# 훈련 데이터로만 학습
melbourne_model = DecisionTreeRegressor()
melbourne_model.fit(train_X, train_y)

# 검증 데이터로 평가 (모델이 처음 보는 데이터!)
val_predictions = melbourne_model.predict(val_X)
print(mean_absolute_error(val_y, val_predictions))
```

---

### 결과 비교

| 평가 방식                        | MAE       | 의미                     |
| -------------------------------- | --------- | ------------------------ |
| 학습 데이터로 평가 (잘못된 방식) | ~$500     | 거의 완벽해 보임 (착각!) |
| 검증 데이터로 평가 (올바른 방식) | ~$250,000 | 실제 성능                |

> 🚨 차이가 **500배** 입니다! 검증 데이터 기준의 MAE는 평균 집값(110만 달러)의 약 1/4에 해당합니다.

---

## 💻 전체 코드

```python
import pandas as pd
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split

# 데이터 로드
melbourne_file_path = '../input/melbourne-housing-snapshot/melb_data.csv'
melbourne_data = pd.read_csv(melbourne_file_path)
filtered_melbourne_data = melbourne_data.dropna(axis=0)

# 타겟과 특성 분리
y = filtered_melbourne_data.Price
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'BuildingArea',
                      'YearBuilt', 'Lattitude', 'Longtitude']
X = filtered_melbourne_data[melbourne_features]

# 훈련/검증 분리
train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=0)

# 모델 학습
melbourne_model = DecisionTreeRegressor()
melbourne_model.fit(train_X, train_y)

# 검증 데이터로 평가
val_predictions = melbourne_model.predict(val_X)
print(mean_absolute_error(val_y, val_predictions))
```

---

## 💡 핵심 정리

- 모델을 **학습 데이터로 평가하면 안 됩니다** (과적합 착각)
- `train_test_split`: 데이터를 훈련/검증으로 분리
- **MAE**: 예측 오차의 평균 (낮을수록 좋음)
- `random_state`: 분리 결과를 항상 동일하게 재현

---

## ➡️ 다음 단계

- 📝 [실습 3: 모델 검증](../exercises/ex3_model_validation.ipynb) 완료 후
- [튜토리얼 5: 과소적합과 과대적합](05_underfitting_overfitting.md)으로 이동
