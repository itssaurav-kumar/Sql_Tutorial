USE Gilead_KT
CREATE OR ALTER VIEW CONVERSION AS
SELECT E.EMPLOYEE_ID,
CONCAT(E.FIRST_NAME,' ',E.LAST_NAME) AS FULL_NAME,
CONCAT(E.EMAIL,'@deloitte.com') AS EMAIL,
CONCAT('+91',REPLACE(E.PHONE_NUMBER,'.','')) AS PHONE_NUMBER,
FORMAT(E.HIRE_DATE,'dd-MM-yyyy') AS HIRE_DATE,
E.JOB_ID,
E.SALARY,
ISNULL(E.COMMISSION_PCT,0) AS COMMISSION_PCT,
ISNULL(CAST(E.MANAGER_ID AS VARCHAR),' ') AS MANAGER_ID,
ISNULL(CAST(E.DEPARTMENT_ID AS VARCHAR),' ') AS DEPARTMENT_ID,
D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID

SELECT * FROM CONVERSION
SELECT * FROM EMPLOYEES

CREATE OR ALTER VIEW RECONCILIATION_REPORT AS
SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME,C.FULL_NAME,
CASE WHEN CONCAT(E.FIRST_NAME,' ',E.LAST_NAME)=(C.FULL_NAME) 
THEN 'PASS' ELSE 'FAIL'
END AS FULL_NAME_FLAG,
E.EMAIL AS SRC_EMAIL,C.EMAIL AS TGT_EMAIL,
CASE WHEN CONCAT(E.EMAIL,'@deloitte.com')=(C.EMAIL) 
THEN 'PASS' ELSE 'FAIL'
END AS EMAIL_FLAG,
E.PHONE_NUMBER AS SRC_PHONE_NUMBER,C.PHONE_NUMBER AS TGT_PHONE_NUMBER,
CASE WHEN CONCAT('+91',REPLACE(E.PHONE_NUMBER,'.',''))=C.PHONE_NUMBER AND LEN(C.PHONE_NUMBER)<14
THEN 'PASS' ELSE 'FAIL'
END AS PHONE_NUMBER_FLAG,
E.HIRE_DATE AS SRC_HIRE_DATE,C.HIRE_DATE AS TGT_HIRE_DATE,
CASE WHEN FORMAT(E.HIRE_DATE,'dd-MM-yyyy')=C.HIRE_DATE 
THEN 'PASS' ELSE 'FAIL'
END AS HIRE_DATE_FLAG,
E.JOB_ID AS SRC_JOB_ID,C.JOB_ID AS TGT_JOB_ID,
CASE WHEN E.JOB_ID=C.JOB_ID
THEN 'PASS' ELSE 'FAIL'
END AS JOB_ID_FLAG,
E.SALARY AS SRC_SALARY,C.SALARY AS TGT_SALARY,
CASE WHEN E.SALARY=C.SALARY
THEN 'PASS' ELSE 'FAIL'
END AS SALARY_FLAG,
E.COMMISSION_PCT AS SRC_COMMISSION_PCT,C.COMMISSION_PCT AS TGT_COMMISSION_PCT,
CASE WHEN E.COMMISSION_PCT=C.COMMISSION_PCT
THEN 'PASS' ELSE 'FAIL'
END AS CPMMISSION_PCT_FLAG,
E.MANAGER_ID AS SRC_MANAGER_ID,C.MANAGER_ID AS TGT_MANAGER_ID,
CASE WHEN CAST(E.MANAGER_ID AS VARCHAR)=CAST(C.MANAGER_ID AS VARCHAR)
THEN 'PASS' ELSE 'FAIL'
END AS MANAGER_ID_FLAG,
E.DEPARTMENT_ID AS SRC_DEPARTMENT_ID,C.DEPARTMENT_ID AS TGT_DEPARTMENT_ID,
CASE WHEN CAST(E.DEPARTMENT_ID AS VARCHAR)=CAST(C.DEPARTMENT_ID AS VARCHAR)
THEN 'PASS' ELSE 'FAIL'
END AS DEPARTMENT_ID_FLAG,
D.DEPARTMENT_NAME AS SRC_DEPARTMENT_NAME,C.DEPARTMENT_NAME AS TGT_DEPARTMENT_NAME,
CASE WHEN D.DEPARTMENT_NAME=C.DEPARTMENT_NAME
THEN 'PASS' ELSE 'FAIL'
END AS DEPARTMENT_NAME_FLAG
FROM CONVERSION C
JOIN EMPLOYEES E ON C.EMPLOYEE_ID=E.EMPLOYEE_ID 
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID


SELECT * FROM RECONCILIATION_REPORT



CREATE OR ALTER VIEW SUMMARY AS 
SELECT 
(SELECT COUNT(*) AS TOTAL_RECORDS_EXTRACTION FROM RECONCILIATION_REPORT ) AS TOTAL_RECORDS_EXTRACTION,
(SELECT COUNT(*) AS TOTAL_PASSED_EXTRACTION FROM RECONCILIATION_REPORT
WHERE FULL_NAME_FLAG ='PASS'
AND  EMAIL_FLAG ='PASS'
AND PHONE_NUMBER_FLAG='PASS'
AND  HIRE_DATE_FLAG='PASS'
AND  JOB_ID_FLAG='PASS'
AND  SALARY_FLAG='PASS'
AND  CPMMISSION_PCT_FLAG='PASS'
AND  MANAGER_ID_FLAG='PASS'
AND  DEPARTMENT_ID_FLAG='PASS'
AND  DEPARTMENT_NAME_FLAG='PASS') AS TOTAL_PASS_EXTRACTION,
(SELECT COUNT(*) AS TOTAL_FAILED_EXTRACTION FROM RECONCILIATION_REPORT
WHERE FULL_NAME_FLAG ='FAIL'
OR  EMAIL_FLAG ='FAIL'
OR PHONE_NUMBER_FLAG='FAIL'
OR  HIRE_DATE_FLAG='FAIL'
OR  JOB_ID_FLAG='FAIL'
OR  SALARY_FLAG='FAIL'
OR  CPMMISSION_PCT_FLAG='FAIL'
OR  MANAGER_ID_FLAG='FAIL'
OR  DEPARTMENT_ID_FLAG='FAIL'
OR  DEPARTMENT_NAME_FLAG='FAIL') AS TOTAL_FAIL_EXTRACTION,

(SELECT COUNT  (*) AS FULL_NAME_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE FULL_NAME_FLAG='FAIL') AS FULL_NAME_FLAG_ERROR, 
(SELECT COUNT  (*) AS EMAIL_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE EMAIL_FLAG='FAIL')AS EMAIL_FLAG_ERROR, 
(SELECT COUNT  (*) AS PHONE_NUMBER_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE PHONE_NUMBER_FLAG='FAIL') AS PHONE_NUMBER_FLAG_ERROR,
(SELECT COUNT  (*) AS HIRE_DATE_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE HIRE_DATE_FLAG='FAIL') AS HIRE_DATE_FLAG_ERROR,
(SELECT COUNT  (*) AS JOB_ID_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE JOB_ID_FLAG='FAIL') AS JOB_ID_FLAG_ERROR,
(SELECT COUNT  (*) AS SALARY_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE SALARY_FLAG='FAIL') AS SALARY_FLAG_ERROR,
(SELECT COUNT  (*) AS CPMMISSION_PCT_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE CPMMISSION_PCT_FLAG='FAIL') AS CPMMISSION_PCT_FLAG_ERROR,

(SELECT COUNT  (*) AS MANAGER_ID_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE MANAGER_ID_FLAG='FAIL') AS MANAGER_ID_FLAG_ERROR,
(SELECT COUNT  (*) AS DEPARTMENT_ID_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE DEPARTMENT_ID_FLAG='FAIL') AS DEPARTMENT_ID_FLAG_ERROR,
(SELECT COUNT  (*) AS DEPARTMENT_NAME_FLAG_ERROR FROM RECONCILIATION_REPORT
WHERE DEPARTMENT_NAME_FLAG='FAIL') AS DEPARTMENT_NAME_FLAG_ERROR

SELECT * FROM SUMMARY
SELECT * FROM RECONCILIATION_REPORT

SELECT * FROM SYS.COLUMNS WHERE OBJECT_ID=OBJECT_ID('RECONCILIATION_REPORT')

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='RECONCILIATION_REPORT' AND COLUMN_NAME LIKE '%FLAG'

