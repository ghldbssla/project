CREATE TABLE MOVIE_USER(
   userid         VARCHAR2(100),      -- 아이디 (PK)
   userpw         VARCHAR2(500),      -- 비밀번호
   username      VARCHAR2(100),      -- 별명
   useremail      VARCHAR2(500),      -- 이메일
   userphone      VARCHAR2(11),      -- 폰 번호
   useraddr      VARCHAR2(300),      -- 주소
   userbday      VARCHAR2(100),      -- 생년월일
   usercoupon      NUMBER(5),      -- 쿠폰
   usermoney      NUMBER(38),      -- 돈
   CONSTRAINT USERS_PK PRIMARY KEY(USERID)
);

CREATE TABLE TBL_MOVIE_TICKET(
   userid         VARCHAR2(100),    -- USERID (FK)
   m_name         VARCHAR2(100),    -- MOVIE_LIST (FK)
   T_NAME         VARCHAR2(100),    -- THEATER (FK)
   ticket_price      VARCHAR2(100),
   S_SCHEDULE_TIME    VARCHAR2(100),   -- SCREEN_THEATER(FK)
   CONSTRAINT MOVIE_USER_FK FOREIGN KEY(USERID)
   REFERENCES MOVIE_USER(USERID) ON DELETE CASCADE,   -- MOVIE_USER의 FK
   CONSTRAINT MOVIE_LIST_FK FOREIGN KEY(M_NAME)
   REFERENCES MOVIE_LIST(M_NAME) ON DELETE CASCADE,   -- MOVIE_LIST의 FK
   CONSTRAINT THEATER_FK FOREIGN KEY(T_NAME)
   REFERENCES THEATER(T_NAME) ON DELETE CASCADE,   -- THEATER의 FK
   CONSTRAINT SCREEN_THEATER_FK FOREIGN KEY(S_SCHEDULE_TIME)
   REFERENCES SCREEN_THEATER(S_SCHEDULE_TIME) ON DELETE CASCADE   -- SCREEN_THEATER(FK)
);
SELECT*FROM TBL_MOVIE_TICKET;

CREATE TABLE FAV_USER(
   userid VARCHAR2(100),
   M_TITLE VARCHAR2(100)
);
SELECT * FROM FAV_USER;

CREATE TABLE THEATER(
   T_SERIAL      VARCHAR2(100),   -- 영화관 고유 번호   EX)123 OR ABC
   T_NAME         VARCHAR2(100),   -- 영화관 이름      EX)CGV '강남'
   T_CITY         VARCHAR2(100),   -- 영화관 위치      EX)경기, 서울, 인천
   CONSTRAINT THEATER_PK PRIMARY KEY(T_NAME)
);
SELECT*FROM THEATER;
INSERT INTO THEATER(T_SERIAL,T_NAME)
 VALUES('a','B');
DELETE FROM THEATER WHERE T_CITY IS NULL;
CREATE TABLE MOVIE_LIST(
   M_NAME      VARCHAR2(100),   -- 영화 제목      EX)소울
   M_DIRECTOR   VARCHAR2(100),   -- 영화 감독      EX)피트 닥터
   M_ACTOR      VARCHAR2(100),   -- 영화 배우      EX)제이미 폭스
   M_GENRE      VARCHAR2(100),   -- 영화 장르      EX)애니메이션
   M_RATE      VARCHAR2(100),   -- 영화 평점      EX)9.37
   CONSTRAINT MOVIE_PK PRIMARY KEY(M_NAME)
);

CREATE TABLE MOVIE_LIST_SOON(
   M_NAME      VARCHAR2(100),   -- 영화 제목      EX)소울
   M_DIRECTOR   VARCHAR2(100),   -- 영화 감독      EX)피트 닥터
   M_ACTOR      VARCHAR2(100),   -- 영화 배우      EX)제이미 폭스
   M_GENRE   VARCHAR2(100),   -- 영화 장르      EX)애니메이션
   CONSTRAINT MOVIE_SOON_PK PRIMARY KEY(M_NAME)
);

CREATE TABLE SCREEN_THEATER(        
   S_SCHEDULE_TIME  VARCHAR2(100),      -- 상영 시작 시간   EX)6시~11시 (조조) | 11시~23시 (일반) | 23시~6시 (야간)
   S_SEAT_CNT      VARCHAR2(100),   -- 총 좌석 수      EX)   총 좌석 230석
   m_name         VARCHAR2(100),    -- MOVIE_LIST (FK)  영화제목 
   T_NAME         VARCHAR2(100)    -- THEATER (FK)
);
SELECT * FROM SCREEN_THEATER;
INSERT INTO SCREEN_THEATER
VALUES('A','B','C','B');