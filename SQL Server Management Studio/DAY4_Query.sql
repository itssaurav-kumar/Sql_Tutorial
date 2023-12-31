USE Databse_name

------4.2(I)-------

SELECT LAST_NAME,EMPLOYEE_ID,SALARY,
CAST(ROUND(SALARY+SALARY*0.15,2)AS INT) AS NEW_SALARY,CAST(ROUND(SALARY+SALARY*0.15,0) - SALARY AS INT) AS INCREASE FROM EMPLOYEES;

------4.2(I)------

------4.2(II)-------

SELECT LAST_NAME,LEN(LAST_NAME) FROM EMPLOYEES

WHERE LAST_NAME LIKE 'J%'

OR LAST_NAME LIKE 'M%'

OR LAST_NAME LIKE 'A%'

ORDER BY LAST_NAME;

------4.2(II)-------

------4.2(III)-------

SELECT LAST_NAME,ROUND(DATEDIFF(MONTH,HIRE_DATE,GETDATE()),0) AS MONTHS_WORKED FROM EMPLOYEES

ORDER BY MONTHS_WORKED;

------4.2(III)-------

------4.2(IV)-------

SELECT CONCAT(LAST_NAME,' Earns $',CAST(SALARY AS VARCHAR),' Monthly but wants $' ,CAST(3*SALARY AS VARCHAR))FROM EMPLOYEES

------4.2(IV)-------

------4.2(V)----

SELECT LAST_NAME, HIRE_DATE,
CASE
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 1 THEN DATEADD(DAY, 1, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 2 THEN DATEADD(DAY, 0, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 3 THEN DATEADD(DAY, 6, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 4 THEN DATEADD(DAY, 5, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 5 THEN DATEADD(DAY, 4, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 6 THEN DATEADD(DAY, 3, DATEADD(MONTH, 6,HIRE_DATE))
WHEN DATEPART(WEEKDAY, DATEADD(MONTH, 6,HIRE_DATE)) = 7 THEN DATEADD(DAY, 2, DATEADD(MONTH, 6,HIRE_DATE))
END
AS REVIEW FROM EMPLOYEES;




------4.2(VI)------

SELECT LAST_NAME, HIRE_DATE, DATENAME(WEEKDAY, HIRE_DATE) AS DAY FROM EMPLOYEES ORDER BY DAY;

-------4.2(VII)-----

SELECT LAST_NAME,COMMISSION_PCT,
CASE WHEN COMMISSION_PCT IS NULL THEN 'No Commission'
ELSE CAST(COMMISSION_PCT AS VARCHAR)
END AS COMM
FROM EMPLOYEES;

---------4.2(VII)--------

----4.2(VIII)------

SELECT LAST_NAME,SALARY,
REPLICATE('*',ROUND(SALARY/1000,0)) AS EMPLOYEES_AND_THEIR_SALARIES
FROM EMPLOYEES

----4.2(VIII)------



------4.2(IX)-----
SELECT JOB_ID,
CASE WHEN JOB_ID = 'AD_PRES' THEN 'A'
WHEN JOB_ID = 'ST_MAN' THEN 'B'
WHEN JOB_ID = 'IT_PROG' THEN 'C'
WHEN JOB_ID = 'SA_REP' THEN 'D'
WHEN JOB_ID = 'ST_CLERK' THEN 'E'
ELSE '0'
END AS COMM
FROM EMPLOYEES;




-----------------------------5-------------------------------------------
SELECT E.LAST_NAME,J.JOB_ID,J.START_DATE FROM EMPLOYEES E
INNER JOIN JOB_HISTORY J ON E.EMPLOYEE_ID=J.EMPLOYEE_ID
WHERE HIRE_DATE >= '1998-02-20' AND HIRE_DATE <= '1998-05-01'
ORDER BY START_DATE;
-------5.1---------
SELECT E.LAST_NAME,D.DEPARTMENT_ID,D.DEPARTMENT_NAME FROM DEPARTMENTS D
FULL JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID

---------5.2-----
SELECT E.LAST_NAME,D.DEPARTMENT_ID,D.DEPARTMENT_NAME FROM DEPARTMENTS D
FULL JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID=80
-----5.2----------

SELECT DISTINCT E.JOB_ID,D.LOCATION_ID FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
AND E.DEPARTMENT_ID = 80;


---------5.3-----

SELECT E.COMMISSION_PCT,E.LAST_NAME,E.JOB_ID,D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.LOCATION_ID,L.CITY FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
INNER JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL;

---------5.3-----


SELECT * FROM JOB_GRADES

---------5.4-----

SELECT E.LAST_NAME,J.JOB_TITLE,D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.CITY FROM EMPLOYEES E
INNER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
INNER JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
WHERE L.CITY='Toronto';


------5.4-------
---------5.5-----



SELECT E.LAST_NAME,E.EMPLOYEE_ID,E.MANAGER_ID,F.LAST_NAME AS MANAGER_NAME FROM EMPLOYEES E
INNER JOIN EMPLOYEES F ON E.MANAGER_ID = F.EMPLOYEE_ID;

---------5.5-----

-------5.6------

SELECT E.LAST_NAME AS EMPLOYEE_NAME,E.DEPARTMENT_ID,F.LAST_NAME AS COLLEAGUE_NAME FROM EMPLOYEES E
INNER JOIN EMPLOYEES F ON F.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID!=F.EMPLOYEE_ID;

-------5.6------

-------5.7------

SELECT E.LAST_NAME,J.JOB_TITLE,D.DEPARTMENT_NAME,E.SALARY,
CASE WHEN SALARY BETWEEN 1000 AND 2999 THEN 'A'
WHEN SALARY BETWEEN 3000 AND 5999 THEN 'B'
WHEN SALARY BETWEEN 6000 AND 9999 THEN 'C'
WHEN SALARY BETWEEN 10000 AND 14999 THEN 'D'
WHEN SALARY BETWEEN 15000 AND 24999 THEN 'E'
WHEN SALARY BETWEEN 25000 AND 40000 THEN 'F'
END AS GRADE_LEVEL
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
INNER JOIN JOBS J ON E.JOB_ID=J.JOB_ID;


-----5.7-----

------5.8-------
SELECT LAST_NAME,HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies');


-------5.8-------
-------5.9------
SELECT E.LAST_NAME,E.HIRE_DATE,F.LAST_NAME AS MANAGER,F.HIRE_DATE FROM EMPLOYEES E
INNER JOIN EMPLOYEES F ON E.MANAGER_ID=F.EMPLOYEE_ID
WHERE F.HIRE_DATE > E.HIRE_DATE;

-----5.9-------
SELECT * FROM EMPLOYEES
