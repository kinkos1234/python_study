# 튜토리얼 5: 과소적합과 과대적합 (Underfitting and Overfitting)

> 원본: [Kaggle - Underfitting and Overfitting](https://www.kaggle.com/code/dansbecker/underfitting-and-overfitting)  
> 실습: [Ex 4: 과소/과대적합](../exercises/ex4_underfitting_overfitting.ipynb)

---

## 🎯 학습 목표

- 과대적합(Overfitting)과 과소적합(Underfitting)의 개념을 이해한다
- `max_leaf_nodes` 파라미터로 최적의 모델 복잡도를 찾는다

---

## 📖 내용 정리

### 다양한 모델 실험하기

이전 튜토리얼에서 신뢰할 수 있는 모델 평가 방법(검증 데이터)을 배웠습니다. 이제 **다양한 모델을 실험**해볼 수 있습니다.

결정 트리는 **트리의 깊이(depth)** 를 조절하는 여러 옵션이 있습니다.

---

### 과대적합 (Overfitting)

트리가 **너무 깊으면** 어떻게 될까요?

- 데이터가 매우 세밀하게 분류됨 → 각 리프(leaf)에 아주 적은 집만 포함
- 훈련 데이터에서는 거의 완벽한 예측 (리프에 있는 집만 학습했으니까)
- 그러나 **새로운 데이터에서는 형편없는 성능**

이를 **과대적합(Overfitting)** 이라고 합니다:

> 모델이 훈련 데이터를 너무 잘 외워버려서, 새로운 데이터에 일반화되지 못하는 현상

---

### 과소적합 (Underfitting)

트리가 **너무 얕으면** 어떻게 될까요?

- 데이터가 거칠게 분류됨 → 각 그룹에 매우 다양한 집이 포함
- 훈련 데이터에서도 예측이 부정확
- 새로운 데이터에서도 당연히 부정확

이를 **과소적합(Underfitting)** 이라고 합니다:

> 모델이 데이터의 중요한 패턴을 포착하지 못해서, 훈련 데이터에서도 성능이 낮은 현상

---

### 스위트 스팟 찾기 (Sweet Spot)

```
오      │           훈련 오차 (낮을수록 좋음)
차      │  ＼
(MAE)  │   ＼                      검증 오차
        │    ＼              ╱──────────────
        │     ＼           ╱
        │      ＼         ╱
        │       ＼       ╱
        │        ＼_____╱   ← 스위트 스팟! (최적)
        └──────────────────────────────────
             모델 복잡도 (트리 깊이/리프 수)
           낮음 ◄─────────────────────────►높음
          (과소적합)                   (과대적합)
```

우리는 **검증 오차가 가장 낮은 지점**을 찾아야 합니다.

---

### `max_leaf_nodes`로 최적 모델 찾기

`max_leaf_nodes` 파라미터로 트리의 리프 수를 제한하여 복잡도를 조절합니다.

#### MAE 비교 함수 정의

```python
from sklearn.metrics import mean_absolute_error
from sklearn.tree import DecisionTreeRegressor

def get_mae(max_leaf_nodes, train_X, val_X, train_y, val_y):
    model = DecisionTreeRegressor(max_leaf_nodes=max_leaf_nodes, random_state=0)
    model.fit(train_X, train_y)
    preds_val = model.predict(val_X)
    mae = mean_absolute_error(val_y, preds_val)
    return mae
```

#### 여러 값 비교

```python
# 다양한 max_leaf_nodes 값에 대해 MAE 계산
for max_leaf_nodes in [5, 50, 500, 5000]:
    my_mae = get_mae(max_leaf_nodes, train_X, val_X, train_y, val_y)
    print(f"리프 최대 {max_leaf_nodes}개: MAE = {my_mae:,.0f}")
```

예시 결과:

| max_leaf_nodes | MAE          | 상태          |
| -------------- | ------------ | ------------- |
| 5              | ~347,000     | 과소적합      |
| 50             | ~258,000     | 개선됨        |
| 500            | **~243,000** | **최적!**     |
| 5000           | ~254,000     | 과대적합 시작 |

#### 최적 모델로 최종 학습

```python
# 전체 데이터로 최적 파라미터 모델 재학습 (검증 분리 없이)
final_model = DecisionTreeRegressor(max_leaf_nodes=500, random_state=0)
final_model.fit(X, y)
```

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

y = filtered_melbourne_data.Price
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'BuildingArea',
                      'YearBuilt', 'Lattitude', 'Longtitude']
X = filtered_melbourne_data[melbourne_features]

train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=0)

# MAE 비교 함수
def get_mae(max_leaf_nodes, train_X, val_X, train_y, val_y):
    model = DecisionTreeRegressor(max_leaf_nodes=max_leaf_nodes, random_state=0)
    model.fit(train_X, train_y)
    preds_val = model.predict(val_X)
    return mean_absolute_error(val_y, preds_val)

# 최적 max_leaf_nodes 찾기
scores = {leaf_size: get_mae(leaf_size, train_X, val_X, train_y, val_y)
          for leaf_size in [5, 25, 50, 100, 250, 500]}
best_tree_size = min(scores, key=scores.get)
print(f"최적 리프 수: {best_tree_size}")

# 전체 데이터로 최종 모델 학습
final_model = DecisionTreeRegressor(max_leaf_nodes=best_tree_size, random_state=0)
final_model.fit(X, y)
```

---

## 💡 핵심 정리

| 개념         | 증상          | 해결책                   |
| ------------ | ------------- | ------------------------ |
| **과대적합** | 훈련↑ 검증↓   | 트리 깊이/리프 수 줄이기 |
| **과소적합** | 훈련↓ 검증↓   | 트리 깊이/리프 수 늘리기 |
| **최적**     | 검증 MAE 최소 | `max_leaf_nodes` 튜닝    |

---

## ➡️ 다음 단계

- 📝 [실습 4: 과소/과대적합](../exercises/ex4_underfitting_overfitting.ipynb) 완료 후
- [튜토리얼 6: 랜덤 포레스트](06_random_forests.md)로 이동
