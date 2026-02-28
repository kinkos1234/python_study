# 튜토리얼 7: 머신러닝 대회 (Machine Learning Competitions)

> 원본: [Kaggle - Machine Learning Competitions](https://www.kaggle.com/code/alexisbcook/machine-learning-competitions)  
> 실습: [Ex 6: ML 대회](../exercises/ex6_ml_competitions.ipynb)

---

## 🎯 학습 목표

- Kaggle 머신러닝 대회 참여 방법을 이해한다
- 제출용 CSV 파일을 만드는 방법을 배운다

---

## 📖 내용 정리

### Kaggle 대회란?

**Kaggle 머신러닝 대회**는 데이터 과학 실력을 키우고 진전을 측정하는 훌륭한 방법입니다.

이번 실습에서는 **House Prices Competition for Kaggle Learn Users** 에 실제로 제출해봅니다.

---

### 대회 참여 프로세스

```
1. 대회 데이터 다운로드 (train.csv, test.csv)
        ↓
2. train.csv로 모델 학습
        ↓
3. test.csv로 예측
        ↓
4. submission.csv 생성
        ↓
5. Kaggle에 제출 → 점수 확인
```

---

### 데이터 구조

| 파일             | 설명                                           |
| ---------------- | ---------------------------------------------- |
| `train.csv`      | 실제 가격(SalePrice)을 포함 → 모델 학습에 사용 |
| `test.csv`       | 가격 정보 없음 → 이 집들의 가격 예측           |
| `submission.csv` | 예측 결과 → Kaggle에 제출                      |

---

### 제출 파일 만들기

```python
import pandas as pd
from sklearn.ensemble import RandomForestRegressor

# 데이터 로드
train_data = pd.read_csv('../input/home-data-for-ml-course/train.csv')
test_data = pd.read_csv('../input/home-data-for-ml-course/test.csv')

# 사용할 특성 선택
features = ['LotArea', 'YearBuilt', '1stFlrSF', '2ndFlrSF',
            'FullBath', 'BedroomAbvGr', 'TotRmsAbvGrd']

# 훈련 데이터 준비
X_train = train_data[features]
y_train = train_data['SalePrice']

# 테스트 데이터 준비
X_test = test_data[features]

# 모델 학습
model = RandomForestRegressor(n_estimators=100, random_state=0)
model.fit(X_train, y_train)

# 테스트 데이터 예측
test_preds = model.predict(X_test)

# 제출 파일 생성
output = pd.DataFrame({'Id': test_data['Id'], 'SalePrice': test_preds})
output.to_csv('submission.csv', index=False)
print("submission.csv 파일이 생성되었습니다!")
```

---

### 제출 파일 형식

`submission.csv`는 반드시 다음 형식이어야 합니다:

```
Id,SalePrice
1461,169000.1
1462,187724.1
1463,154085.3
...
```

- `Id`: 각 집의 고유 번호 (test.csv의 Id 열과 동일)
- `SalePrice`: 예측한 집 가격

---

### 점수 향상 방법

| 방법                | 설명                       |
| ------------------- | -------------------------- |
| 더 많은 특성 사용   | 중요한 열 추가             |
| 결측값 처리         | imputation 사용            |
| 하이퍼파라미터 튜닝 | n_estimators, max_depth 등 |
| 고급 모델           | XGBoost, LightGBM 등       |

---

## 🏆 이 강좌에서 배운 것 요약

| 튜토리얼            | 배운 내용                      |
| ------------------- | ------------------------------ |
| 1. 모델의 작동 원리 | 결정 트리, fitting, prediction |
| 2. 기본 데이터 탐색 | pandas, DataFrame, describe()  |
| 3. 첫 번째 ML 모델  | X/y 선택, sklearn 학습 4단계   |
| 4. 모델 검증        | MAE, train/val split           |
| 5. 과소/과대적합    | 최적 복잡도, max_leaf_nodes    |
| 6. 랜덤 포레스트    | 앙상블, 다수 트리의 평균       |
| 7. 머신러닝 대회    | 제출 파일 생성, 대회 참여      |

---

## 💡 핵심 정리

- `train.csv` → 모델 학습 / `test.csv` → 예측 대상
- 제출 파일은 반드시 `Id`와 `SalePrice` 두 열
- `output.to_csv('submission.csv', index=False)` 로 파일 저장

---

## ➡️ 다음 단계

- 📝 [실습 6: ML 대회](../exercises/ex6_ml_competitions.ipynb)를 완료하고 실제 Kaggle에 제출해보세요!
- 더 공부하려면: [Intermediate Machine Learning](https://www.kaggle.com/learn/intermediate-machine-learning) 강좌를 추천합니다.
