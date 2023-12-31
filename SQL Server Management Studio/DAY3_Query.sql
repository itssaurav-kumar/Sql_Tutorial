
use Database/Schema_name


SELECT * FROM EMPLOYEES
-----3.2(VI)-----

SELECT LAST_NAME,SALARY,COMMISSION_PCT FROM EMPLOYEES
ORDER BY SALARY,COMMISSION_PCT DESC

------3.2(VII)-----

SELECT LAST_NAME FROM EMPLOYEES
WHERE LAST_NAME LIKE '__a%';


------3.2(VIII)-----

SELECT LAST_NAME FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%s%';
-----3.2(IX)------

SELECT LAST_NAME,J.JOB_TITLE,ROUND(SALARY,1) FROM EMPLOYEES E
INNER JOIN JOBS J ON J.JOB_ID=E.JOB_ID
WHERE JOB_TITLE IN ('Sales Representative', 'Stock Clerk')
AND salary NOT IN (2500,3500, 7000)
ORDER BY SALARY;

SELECT ROUND(SALARY,-2) AS SALARY FROM EMPLOYEES;
SELECT ROUND(100.495,-2)
SELECT ROUND(188.355,1)
SELECT TRUNCATE TABLE(12.34,1)
-----3.2(X)------

SELECT LAST_NAME,SALARY,COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT < ;



SELECT LOWER(LAST_NAME) FROM EMPLOYEES
SELECT UPPER(LAST_NAME) FROM EMPLOYEES
SELECT CONCAT(FIRST_NAME,LAST_NAME)AS FULL_NAME FROM EMPLOYEES
SELECT LAST_NAME,LEN(LAST_NAME) FROM EMPLOYEES
SELECT TRIM(LAST_NAME) FROM EMPLOYEES 
SELECT REPLACE('ROHIT','T','NI') 

-------

DECLARE @S VARCHAR(10);
SET @S='   ram  ';
select trim(@S)

---------


SELECT SUBSTRING (FIRST_NAME,1,2),CHARINDEX('a',LAST_NAME),LAST_NAME
FROM EMPLOYEES

SELECT NULLIF(FIRST_NAME,LAST_NAME) AS FIRST_EXPRESSION FROM EMPLOYEES
SELECT NULLIF('RAM','RAM')

SELECT COALESCE(MANAGER_ID,NULL) FROM EMPLOYEES;

-------CASE-------

SELECT MANAGER_ID,FIRST_NAME,
CASE WHEN MANAGER_ID > 120 THEN 'GREATER TRHAN'
WHEN MANAGER_ID=100 THEN 'EQUAL TO'
ELSE 'BELOW'
END AS PERFORMANCE
FROM EMPLOYEES;

-------CASE------

----TO_CHAR AND TO_NUMBER------

SELECT CONVERT(VARCHAR(10),START_DATE)FROM JOB_HISTORY;
SELECT CAST(START_DATE AS VARCHAR)FROM JOB_HISTORY;

----TO_CHAR AND TO_NUMBER------

---MONTHS_BETWEEN AND ADD_MONTHS ADD NEXT DAY ADD LAST DAY---

SELECT DATEDIFF(DAY,'2013-02-28','2013-04-01');
SELECT ROUND(DATEADD(DAY,3,'04-12-2022'));
SELECT DATEADD(DAY,-1,'08-10-2022');
SELECT DATEADD(DAY,3,'2015-01-01');

---MONTHS_BETWEEN AND ADD_MONTHS---






SELECT TRUNCATE
SELECT TRUNC(30.95, 1)
SELECT TRUNC(3095,1>);
SELECT employee_id, MONTH(hire_date) 
SELECT *FROM EMPLOYEES
SELECT *FROM LOCATIONS

---Query the list of city names from locations table that do not start with vowelss and do not end with vowels.
--your result can not contain duplicates-----

SELECT DISTINCT CITY FROM LOCATIONS
WHERE SUBSTRING(CITY,1,1) 
NOT IN('a','e','i','o','u','A','E','I','O','U')
AND SUBSTRING(CITY,-1,1) 
NOT IN('a','e','i','o','u')

SELECT DISTINCT CITY FROM LOCATIONS
WHERE CITY NOT LIKE ('%a') AND city not like ('%e') and city not like('%o')

--How to create a empty table structure from existing table

SELECT * INTO NEWTABLE
FROM OLDTABLE
WHERE 1=0;

--Sql query to find all duplicates name in a city--
SELECT CITY FROM LOCATIONS
GROUP BY CITY HAVING COUNT(CITY)>1;

SELECT * FROM DEPARTMENTS
SELECT * FROM EMPLOYEES

--Fetch N Records--

SELECT TOP 3 * FROM EMPLOYEES
ORDER BY SALARY DESC

---Remove Duplicates--
DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(SELECT EMPLOYEE_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID HAVING COUNT(*) >1)
----Remove Duplicates--

----Fetch only the first name from full name column---

SELECT SUBSTRING(FULLNAME,0,CHARINDEX(' ',FULLNAME)) FROM EMPLOYEES

SELECT CASE WHEN 
(LEN (FullName) - LEN (REPLACE (FullName, ' ', '')) + 1) > 0 
THEN Substring (FullName, 1, Charindex (' ', FullName) - 1)

---Fetch common records between 2 tables
SELECT * FROM TABLE1
INTERSECTSELECT 
SELECT * FROM TABLE2

SELECT TOP 1 SALARY FROM EMPLOYEES


---Query the name of students who scored higher than 75 marks.order your output by the last three 
--characters of each name.if two or more students both have name ending in the same last three 
--characters (i.e Kavya,Navya,etc),Secondary sort them by ascending ID.

SELECT NAME FROM STUDENTS
WHERE MARKS>75
ORDER BY SUBSTR(NAME,-3,3)

--Query an alphabetically ordered list of all names,immediately followed by the first letter
--of each profession enclosed in parenthesis.

SELECT CONCAT(NAME,"(",SUBSTR(OCCUPATION,1,1),")",) FROM OCCUPATION5

SELECT SUBSTR(COLUMN NAME,START,LENGTH)

--Query to find Nth highest Salary--

SELECT TOP 1 SALARY FROM(SELECT TOP 3 SALARY FROM EMPLOYEES ORDER BY SALARY DESC)

