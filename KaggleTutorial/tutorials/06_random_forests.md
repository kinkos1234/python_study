# 튜토리얼 6: 랜덤 포레스트 (Random Forests)

> 원본: [Kaggle - Random Forests](https://www.kaggle.com/code/dansbecker/random-forests)  
> 실습: [Ex 5: 랜덤 포레스트](../exercises/ex5_random_forests.ipynb)

---

## 🎯 학습 목표

- 랜덤 포레스트가 결정 트리보다 나은 이유를 이해한다
- scikit-learn으로 랜덤 포레스트 모델을 구현하고 결과를 비교한다

---

## 📖 내용 정리

### 결정 트리의 근본적 딜레마

결정 트리는 어려운 선택을 강요합니다:

- **깊은 트리** → 과대적합 (각 예측이 소수 집의 과거 데이터에만 의존)
- **얕은 트리** → 과소적합 (데이터의 중요한 차이를 포착 못함)

이 **과소적합 vs 과대적합 긴장관계**는 현대의 정교한 모델도 직면하는 문제입니다.

---

### 랜덤 포레스트란?

**랜덤 포레스트(Random Forest)** 는 이 문제를 영리하게 해결합니다:

> 여러 개의 결정 트리를 만들고, 각 트리의 예측을 **평균**내어 최종 예측을 만듭니다.

```
데이터
  ↓
┌────────────────────────────────────┐
│  결정 트리 1 → $220,000           │
│  결정 트리 2 → $195,000    평균   │ → $204,000
│  결정 트리 3 → $215,000           │   (최종 예측)
│  결정 트리 4 → $190,000           │
└────────────────────────────────────┘
        랜덤 포레스트
```

**장점:**

- 단일 결정 트리보다 훨씬 나은 예측 정확도
- **기본 파라미터**로도 잘 작동함
- 개별 트리들이 각각 과적합되더라도, 평균을 내면 효과가 상쇄됨

---

### 구현하기

결정 트리 대신 `RandomForestRegressor`를 사용합니다.

```python
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error

# 랜덤 포레스트 모델 생성 및 학습
forest_model = RandomForestRegressor(random_state=1)
forest_model.fit(train_X, train_y)

# 예측 및 평가
melb_preds = forest_model.predict(val_X)
print(mean_absolute_error(val_y, melb_preds))
```

---

### 결과 비교

| 모델                       | MAE           |
| -------------------------- | ------------- |
| 결정 트리 (최적 튜닝)      | ~$250,000     |
| **랜덤 포레스트 (기본값)** | **~$202,000** |

> 파라미터 조정 없이 랜덤 포레스트가 훨씬 좋은 성능을 보입니다! 약 20% 성능 향상.

---

### 왜 랜덤인가? (심화)

랜덤 포레스트가 "랜덤"한 이유:

1. **부트스트랩 샘플링**: 각 트리는 전체 데이터에서 무작위로 표본을 뽑아 학습
2. **랜덤 특성 선택**: 각 분기점에서 일부 특성만 무작위로 고려

이 랜덤성이 각 트리를 다양하게 만들고, 평균을 내면 더 안정적인 예측을 얻을 수 있습니다.

---

## 💻 전체 코드

```python
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split

# 데이터 로드
melbourne_file_path = '../input/melbourne-housing-snapshot/melb_data.csv'
melbourne_data = pd.read_csv(melbourne_file_path)
melbourne_data = melbourne_data.dropna(axis=0)

y = melbourne_data.Price
melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'BuildingArea',
                      'YearBuilt', 'Lattitude', 'Longtitude']
X = melbourne_data[melbourne_features]

# 훈련/검증 분리
train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=0)

# 랜덤 포레스트 모델
forest_model = RandomForestRegressor(random_state=1)
forest_model.fit(train_X, train_y)

melb_preds = forest_model.predict(val_X)
print(f"랜덤 포레스트 MAE: {mean_absolute_error(val_y, melb_preds):,.0f}")
```

---

## 💡 핵심 정리

- **랜덤 포레스트** = 여러 결정 트리의 예측을 **평균**내는 앙상블 모델
- 단일 결정 트리보다 **더 안정적**이고 **더 정확**함
- 기본 파라미터(`n_estimators=100`)로도 충분히 좋은 성능
- `from sklearn.ensemble import RandomForestRegressor`

---

## ➡️ 다음 단계

- 📝 [실습 5: 랜덤 포레스트](../exercises/ex5_random_forests.ipynb) 완료 후
- [튜토리얼 7: 머신러닝 대회](07_ml_competitions.md)로 이동
