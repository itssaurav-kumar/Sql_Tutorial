USE Gilead_KT
-----6.2(I)----

SELECT MAX(SALARY) AS MAX,
MIN(SALARY) AS MIN,
SUM(SALARY) AS SUM,
AVG(SALARY) "AVG"
FROM EMPLOYEES;

-----6.2(I)----

-----6.2(II)----
 
SELECT JOB_ID,MAX(SALARY) AS MAX,
MIN(SALARY) AS MIN,
SUM(SALARY) AS SUM,
AVG(SALARY) "AVG"
FROM EMPLOYEES
GROUP BY JOB_ID


-------6.2(II)------

-----6.2(III)------

SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-----6.2(III)------

-----6.2(IV)------


SELECT COUNT(DISTINCT MANAGER_ID)"Number of Managers"
FROM EMPLOYEES;

-----6.2(IV)--------

-------6.2(V)------

SELECT MAX(SALARY)-MIN(SALARY) FROM EMPLOYEES AS DIFFERENCE

--------6.2(V)-----

-------6.2(VI)---------
SELECT MANAGER_ID,MIN(SALARY) FROM EMPLOYEES
GROUP BY MANAGER_ID
HAVING MIN(SALARY)>6000
ORDER BY MIN(SALARY) DESC

-------6.2(VI)---------

-------6.2(VII)---------


SELECT D.DEPARTMENT_NAME "NAME", D.LOCATION_ID "LOCATION",
COUNT(*) "NUMBER OF PEOPLE",
ROUND(AVG(SALARY),2) "SALARY"
FROM EMPLOYEES E
FULL JOIN DEPARTMENTS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID;

-------6.2(VII)---------

--------6.2(VIII)-------

SELECT COUNT(*)TOTAL,DATEPART(YEAR, HIRE_DATE) AS YEAR
FROM EMPLOYEES
WHERE DATEPART(YEAR,HIRE_DATE) > 1994 AND DATEPART(YEAR,HIRE_DATE)<1999
GROUP BY DATEPART(YEAR,HIRE_DATE)

SELECT COUNT(*) total,
SUM(DATEPART(YEAR,HIRE_DATE))"1995",

SUM(DATEPART(YEAR,HIRE_DATE))"1996",

SUM(DATEPART(YEAR,HIRE_DATE))"1997",

SUM(DATEPART(YEAR,HIRE_DATE))"1998"

FROM employees;


SELECT COUNT(*) total,
CASE
WHEN DATEPART(YEAR,HIRE_DATE))=1995 THEN 
WHEN SUM(DATEPART(YEAR,HIRE_DATE))"1996", THEN
WHEN SUM(DATEPART(YEAR,HIRE_DATE))"1997", THEN
WHEN SUM(DATEPART(YEAR,HIRE_DATE))"1998" ,THEN
FROM employees;

---------6.2(VIII)------

-------6.2(IX)--------


 
SELECT JOB_ID, DEPARTMENT_ID, SUM(SALARY) AS TOTAL 
FROM EMPLOYEES 
GROUP BY JOB_ID, DEPARTMENT_ID 
HAVING DEPARTMENT_ID IN (20,50,90); 
 