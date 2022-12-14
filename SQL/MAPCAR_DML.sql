-- CAR_INFO_TABLE 중복행 제거
DELETE FROM CAR_INFO_TABLE T3
    WHERE T3.ROWID IN (
    SELECT T2.RID
    FROM ( 
        SELECT T1.CAR_MODEL, COUNT(*) OVER(PARTITION BY CAR_MODEL) AS OVERLAP,
            T1.ROWID AS RID,
            ROW_NUMBER() OVER(PARTITION BY T1.CAR_MODEL ORDER BY T1.ROWID DESC) AS RN
        FROM CAR_INFO_TABLE T1) T2
    WHERE T2.RN > 1
    )
;
INSERT INTO USER_INFO (ID,PWD,NAME,EMAIL,HND_NO,POST_CODE,ADD1,ADD2,AGREE1,AGREE2,AGREE3,CAR_MODEL)
VALUES ('user11','Xy5ai0CDi6ZqYI5WtDbDFr58AJOXe+Bk+ladBh57JzM1PBZX34DKluX6aT5ejX+TIzQROvWSMfq68WrYQzVNfg==','홍길동','AAA@NAVER.COM','01011112222','12345','서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩','4F','Y','Y','Y','마세라티 르반떼 GT')
;
COMMIT;