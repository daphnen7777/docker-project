CREATE DATABASE video_database;

USE video_database;

CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL
);

-- 예시 데이터 삽입
INSERT INTO videos (file_name) VALUES ('example.mp4');