# 🤖 Kaggle - 머신러닝 입문 (한국어 정리)

> **원본 강의**: [Kaggle - Intro to Machine Learning](https://www.kaggle.com/learn/intro-to-machine-learning)  
> **번역/정리**: 한국어 학습용 요약본

머신러닝의 핵심 개념을 배우고, 첫 번째 모델을 직접 만들어보는 Kaggle 공식 입문 강좌입니다.

---

## 🚀 로컬 실행 방법

### 1단계: 데이터 다운로드

아래 링크에서 CSV 파일을 다운로드하여 `data/` 폴더에 넣어주세요.

| 다운로드 링크                                                                                       | 저장 위치                                       |
| --------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| [🏠 Iowa 주택 데이터 (train.csv)](https://www.kaggle.com/competitions/home-data-for-ml-course/data) | `data/home-data-for-ml-course/train.csv`        |
| [🏠 Iowa 주택 데이터 (test.csv)](https://www.kaggle.com/competitions/home-data-for-ml-course/data)  | `data/home-data-for-ml-course/test.csv`         |
| [🏡 Melbourne 주택 데이터](https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot)   | `data/melbourne-housing-snapshot/melb_data.csv` |

> 💡 Kaggle 로그인 후 다운로드 가능합니다.

최종 폴더 구조:

```
KaggleTutorial/
├── data/
│   ├── home-data-for-ml-course/
│   │   ├── train.csv          ← Iowa 훈련 데이터
│   │   └── test.csv           ← Iowa 테스트 데이터
│   └── melbourne-housing-snapshot/
│       └── melb_data.csv      ← Melbourne 데이터 (튜토리얼 예시용)
├── tutorials/
└── exercises/
```

### 2단계: Jupyter 실행

```bash
bash start_jupyter.sh
```

브라우저에서 `http://localhost:8888` 이 자동으로 열립니다.

### 3단계: 노트북 열기

Jupyter에서 `exercises/` 폴더를 열고, 실습 노트북을 선택하세요.  
커널은 **"Python (KaggleTutorial)"** 을 선택합니다.

---

## 📚 강의 목차

### 튜토리얼 (Tutorial)

| #   | 주제                  | 파일                                                | 원본 링크                                                                        |
| --- | --------------------- | --------------------------------------------------- | -------------------------------------------------------------------------------- |
| 1   | 모델의 작동 원리      | [📖 보기](tutorials/01_how_models_work.md)          | [원본](https://www.kaggle.com/code/dansbecker/how-models-work)                   |
| 2   | 기본 데이터 탐색      | [📖 보기](tutorials/02_basic_data_exploration.md)   | [원본](https://www.kaggle.com/code/dansbecker/basic-data-exploration)            |
| 3   | 첫 번째 머신러닝 모델 | [📖 보기](tutorials/03_first_ml_model.md)           | [원본](https://www.kaggle.com/code/dansbecker/your-first-machine-learning-model) |
| 4   | 모델 검증             | [📖 보기](tutorials/04_model_validation.md)         | [원본](https://www.kaggle.com/code/dansbecker/model-validation)                  |
| 5   | 과소적합과 과대적합   | [📖 보기](tutorials/05_underfitting_overfitting.md) | [원본](https://www.kaggle.com/code/dansbecker/underfitting-and-overfitting)      |
| 6   | 랜덤 포레스트         | [📖 보기](tutorials/06_random_forests.md)           | [원본](https://www.kaggle.com/code/dansbecker/random-forests)                    |
| 7   | 머신러닝 대회         | [📖 보기](tutorials/07_ml_competitions.md)          | [원본](https://www.kaggle.com/code/alexisbcook/machine-learning-competitions)    |

### 실습 과제 (Exercise)

| #   | 주제                 | 파일                                                    |
| --- | -------------------- | ------------------------------------------------------- |
| 1   | 데이터 탐색 실습     | [📝 실습](exercises/ex1_explore_your_data.ipynb)        |
| 2   | 첫 번째 ML 모델 실습 | [📝 실습](exercises/ex2_first_ml_model.ipynb)           |
| 3   | 모델 검증 실습       | [📝 실습](exercises/ex3_model_validation.ipynb)         |
| 4   | 과소/과대적합 실습   | [📝 실습](exercises/ex4_underfitting_overfitting.ipynb) |
| 5   | 랜덤 포레스트 실습   | [📝 실습](exercises/ex5_random_forests.ipynb)           |
| 6   | 머신러닝 대회 실습   | [📝 실습](exercises/ex6_ml_competitions.ipynb)          |

---

## 🗂️ 프로젝트 구조

```
KaggleTutorial/
├── README.md                  ← 이 파일
├── start_jupyter.sh           ← Jupyter 실행 스크립트
├── fix_paths.py               ← 경로 수정 유틸리티
├── data/                      ← CSV 데이터 (직접 다운로드 필요)
├── tutorials/                 ← 한국어 튜토리얼 정리 (마크다운)
└── exercises/                 ← 실습 과제 노트북 (.ipynb)
```

---

## 🎯 학습 흐름

```
튜토리얼 1 읽기
    ↓
튜토리얼 2 읽기 → 실습 1
    ↓
튜토리얼 3 읽기 → 실습 2
    ↓
튜토리얼 4 읽기 → 실습 3
    ↓
튜토리얼 5 읽기 → 실습 4
    ↓
튜토리얼 6 읽기 → 실습 5
    ↓
튜토리얼 7 읽기 → 실습 6 (대회 제출!)
```

---

## 📦 사용 데이터셋

| 데이터                         | 튜토리얼 설명 | 실습                  |
| ------------------------------ | ------------- | --------------------- |
| Melbourne (`melb_data.csv`)    | 강의 내 예시  | -                     |
| Iowa (`train.csv`, `test.csv`) | -             | 모든 실습 + 대회 제출 |

---

## 🛠️ 환경 정보

- Python 3.14 (가상환경 `.venv/`)
- 패키지: `pandas`, `scikit-learn`, `matplotlib`, `seaborn`, `jupyter`
- Jupyter 커널: `Python (KaggleTutorial)`
