-- 코드를 입력하세요
SELECT B.HOUR, 
NVL(A.COUNT, 0) COUNT
FROM (
        SELECT TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS HOUR,
        COUNT(*) AS COUNT
        FROM ANIMAL_OUTS 
        GROUP BY TO_CHAR(DATETIME, 'HH24')
        ) A,
        (
        SELECT LEVEL - 1 AS HOUR
        FROM DUAL
        CONNECT BY LEVEL < 25
        ) B
WHERE A.HOUR (+) = B.HOUR
ORDER BY B.HOUR