-- ============================================================
-- YouTube Music 스타일 음악 스트리밍 서비스 DB 스키마
-- Database: PostgreSQL
-- ============================================================

-- 장르
CREATE TABLE genres (
    genre_id    SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE
);

-- 아티스트
CREATE TABLE artists (
    artist_id         SERIAL PRIMARY KEY,
    name              VARCHAR(200) NOT NULL,
    profile_image_url VARCHAR(500),
    description       TEXT,
    debut_date        DATE,
    created_at        TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 앨범
CREATE TABLE albums (
    album_id        SERIAL PRIMARY KEY,
    artist_id       INTEGER NOT NULL REFERENCES artists(artist_id),
    title           VARCHAR(300) NOT NULL,
    cover_image_url VARCHAR(500),
    release_date    DATE,
    album_type      VARCHAR(20) NOT NULL CHECK (album_type IN ('single', 'EP', 'album')),
    created_at      TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 곡
CREATE TABLE songs (
    song_id          SERIAL PRIMARY KEY,
    album_id         INTEGER REFERENCES albums(album_id),
    title            VARCHAR(300) NOT NULL,
    duration_seconds INTEGER NOT NULL CHECK (duration_seconds > 0),
    track_number     INTEGER,
    lyrics           TEXT,
    file_url         VARCHAR(500) NOT NULL,
    created_at       TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 곡-아티스트 매핑 (피처링, 콜라보)
CREATE TABLE song_artists (
    song_id   INTEGER NOT NULL REFERENCES songs(song_id),
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id),
    role      VARCHAR(20) NOT NULL CHECK (role IN ('main', 'featuring', 'producer')),
    PRIMARY KEY (song_id, artist_id, role)
);

-- 곡-장르 매핑
CREATE TABLE song_genres (
    song_id  INTEGER NOT NULL REFERENCES songs(song_id),
    genre_id INTEGER NOT NULL REFERENCES genres(genre_id),
    PRIMARY KEY (song_id, genre_id)
);

-- 사용자
CREATE TABLE users (
    user_id           SERIAL PRIMARY KEY,
    email             VARCHAR(255) NOT NULL UNIQUE,
    username          VARCHAR(100) NOT NULL,
    password_hash     VARCHAR(255) NOT NULL,
    profile_image_url VARCHAR(500),
    country           VARCHAR(2),
    created_at        TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 재생목록
CREATE TABLE playlists (
    playlist_id     SERIAL PRIMARY KEY,
    user_id         INTEGER NOT NULL REFERENCES users(user_id),
    title           VARCHAR(200) NOT NULL,
    description     TEXT,
    is_public       BOOLEAN NOT NULL DEFAULT TRUE,
    cover_image_url VARCHAR(500),
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 재생목록-곡 매핑
CREATE TABLE playlist_songs (
    playlist_id INTEGER NOT NULL REFERENCES playlists(playlist_id) ON DELETE CASCADE,
    song_id     INTEGER NOT NULL REFERENCES songs(song_id),
    position    INTEGER NOT NULL,
    added_at    TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (playlist_id, song_id)
);

-- 재생 기록
CREATE TABLE play_history (
    history_id            SERIAL PRIMARY KEY,
    user_id               INTEGER NOT NULL REFERENCES users(user_id),
    song_id               INTEGER NOT NULL REFERENCES songs(song_id),
    played_at             TIMESTAMP NOT NULL DEFAULT NOW(),
    play_duration_seconds INTEGER NOT NULL CHECK (play_duration_seconds >= 0)
);

-- 좋아요 (다형성 관계: song, album, playlist, artist)
CREATE TABLE likes (
    like_id     SERIAL PRIMARY KEY,
    user_id     INTEGER NOT NULL REFERENCES users(user_id),
    target_type VARCHAR(20) NOT NULL CHECK (target_type IN ('song', 'album', 'playlist', 'artist')),
    target_id   INTEGER NOT NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE (user_id, target_type, target_id)
);

-- 구독 플랜
CREATE TABLE subscription_plans (
    plan_id     SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE,
    price       NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    max_members INTEGER NOT NULL DEFAULT 1,
    features    JSONB
);

-- 사용자 구독
CREATE TABLE user_subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id         INTEGER NOT NULL REFERENCES users(user_id),
    plan_id         INTEGER NOT NULL REFERENCES subscription_plans(plan_id),
    status          VARCHAR(20) NOT NULL CHECK (status IN ('active', 'cancelled', 'expired')),
    start_date      DATE NOT NULL,
    end_date        DATE
);

-- 결제 내역
CREATE TABLE payments (
    payment_id      SERIAL PRIMARY KEY,
    subscription_id INTEGER NOT NULL REFERENCES user_subscriptions(subscription_id),
    amount          NUMERIC(10, 2) NOT NULL CHECK (amount > 0),
    payment_method  VARCHAR(50) NOT NULL,
    payment_date    TIMESTAMP NOT NULL DEFAULT NOW(),
    status          VARCHAR(20) NOT NULL CHECK (status IN ('success', 'failed', 'refunded'))
);

-- ============================================================
-- 인덱스
-- ============================================================

CREATE INDEX idx_albums_artist     ON albums(artist_id);
CREATE INDEX idx_songs_album       ON songs(album_id);
CREATE INDEX idx_playlists_user    ON playlists(user_id);
CREATE INDEX idx_play_history_user ON play_history(user_id);
CREATE INDEX idx_play_history_song ON play_history(song_id);
CREATE INDEX idx_likes_user        ON likes(user_id);
CREATE INDEX idx_likes_target      ON likes(target_type, target_id);
CREATE INDEX idx_user_subs_user    ON user_subscriptions(user_id);
CREATE INDEX idx_payments_sub      ON payments(subscription_id);
