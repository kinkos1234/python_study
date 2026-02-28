# YouTube Music 스타일 음악 스트리밍 서비스 DB 모델링

YouTube Music과 유사한 음악 스트리밍 서비스의 데이터베이스를 설계하고 ERD를 작성하는 프로젝트입니다.

## 기술 스택

| 항목 | 선택 | 이유 |
|------|------|------|
| **DB** | PostgreSQL | 관계형 모델에 적합, JSONB 지원, 실무 활용도 높음 |
| **ERD 도구** | Excalidraw (MCP) | 차별화된 시각화, `.excalidraw` 파일로 버전 관리 가능 |

## 모델링 범위

- **사용자 정보**: 회원 가입, 프로필 관리
- **곡 정보**: 아티스트, 앨범, 곡, 장르
- **재생목록**: 생성, 곡 추가/정렬, 공개/비공개
- **사용자 활동**: 재생 기록, 좋아요
- **구독/결제**: 구독 플랜, 결제 내역

## 테이블 명세 (14개)

### 핵심 엔티티

| 테이블 | 설명 | 주요 컬럼 |
|--------|------|-----------|
| `users` | 사용자 | email, username, country |
| `artists` | 아티스트 | name, description, debut_date |
| `albums` | 앨범 | title, release_date, album_type(single/EP/album) |
| `songs` | 곡 | title, duration_seconds, track_number, lyrics |
| `genres` | 장르 | name |

### 관계 테이블 (다대다)

| 테이블 | 설명 | 관계 |
|--------|------|------|
| `song_artists` | 곡-아티스트 매핑 | songs ↔ artists (role: main/featuring/producer) |
| `song_genres` | 곡-장르 매핑 | songs ↔ genres |
| `playlist_songs` | 재생목록-곡 매핑 | playlists ↔ songs (position 정렬) |

### 사용자 활동

| 테이블 | 설명 | 비고 |
|--------|------|------|
| `playlists` | 재생목록 | 공개/비공개 설정 가능 |
| `play_history` | 재생 기록 | 재생 시각, 실제 재생 시간 기록 |
| `likes` | 좋아요 | 다형성 관계 (song/album/playlist/artist) |

### 구독 & 결제

| 테이블 | 설명 | 비고 |
|--------|------|------|
| `subscription_plans` | 구독 플랜 | Free/Individual/Family/Student, JSONB features |
| `user_subscriptions` | 사용자 구독 | status: active/cancelled/expired |
| `payments` | 결제 내역 | status: success/failed/refunded |

## 설계 의도

### likes 테이블 — 다형성(Polymorphic) 관계

```sql
target_type VARCHAR(20) CHECK (target_type IN ('song', 'album', 'playlist', 'artist'))
target_id   INTEGER
```

- 좋아요 대상이 곡, 앨범, 재생목록, 아티스트 4가지로 다양함
- 대상마다 별도 테이블(`song_likes`, `album_likes`, ...)을 만들면 테이블이 과도하게 늘어남
- `target_type` + `target_id` 조합으로 하나의 테이블에서 모든 좋아요를 관리
- 복합 인덱스 `(target_type, target_id)`로 조회 성능 확보

### subscription_plans.features — JSONB 활용

```sql
features JSONB  -- 예: {"offline": true, "ad_free": true, "max_quality": "lossless"}
```

- 구독 플랜별 기능(오프라인 재생, 광고 제거, 음질 등)은 플랜마다 항목이 다를 수 있음
- 정규화된 컬럼으로 관리하면 플랜 추가 시마다 스키마 변경 필요
- JSONB로 유연하게 저장하되, PostgreSQL의 JSONB 인덱싱/쿼리 기능 활용 가능

### album_type — CHECK 제약 조건

```sql
album_type VARCHAR(20) CHECK (album_type IN ('single', 'EP', 'album'))
```

- 음악 업계 표준 분류(싱글/EP/정규앨범)를 DB 레벨에서 강제
- 애플리케이션 로직이 아닌 DB 제약으로 데이터 무결성 보장

## 인덱스 전략

| 인덱스 | 대상 | 용도 |
|--------|------|------|
| `idx_albums_artist` | albums(artist_id) | 아티스트별 앨범 조회 |
| `idx_songs_album` | songs(album_id) | 앨범별 곡 목록 조회 |
| `idx_playlists_user` | playlists(user_id) | 사용자별 재생목록 조회 |
| `idx_play_history_user` | play_history(user_id) | 사용자별 재생 기록 조회 |
| `idx_play_history_song` | play_history(song_id) | 곡별 재생 통계 |
| `idx_likes_user` | likes(user_id) | 사용자별 좋아요 목록 |
| `idx_likes_target` | likes(target_type, target_id) | 특정 대상의 좋아요 수 집계 |
| `idx_user_subs_user` | user_subscriptions(user_id) | 사용자 구독 상태 확인 |
| `idx_payments_sub` | payments(subscription_id) | 구독별 결제 내역 조회 |

## ERD 관계 요약

ERD는 Crow's foot 표기법으로 작성되었습니다.

| 표기 | 의미 |
|------|------|
| `\|\|` (bar) | 정확히 하나 (Exactly One) |
| `>\|` (crow's foot) | 하나 이상 (One or Many) |

```
artists ──1:N──→ albums
albums  ──1:N──→ songs
songs   ──N:M──→ artists   (via song_artists)
songs   ──N:M──→ genres    (via song_genres)
users   ──1:N──→ playlists
playlists──N:M──→ songs    (via playlist_songs)
users   ──1:N──→ play_history ←──N:1── songs
users   ──1:N──→ likes
users   ──1:N──→ user_subscriptions ──N:1──→ subscription_plans
user_subscriptions ──1:N──→ payments
```

## 프로젝트 구조

```
DBModeling/
├── README.md          # 프로젝트 설명
├── schema.sql         # PostgreSQL DDL (테이블 + 인덱스)
└── ERD.excalidraw     # ERD 다이어그램 (Crow's foot 표기법)
```
