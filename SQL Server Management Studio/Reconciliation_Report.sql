USE Databse_name
GO

/****** Object:  View [dbo].[RECONCILIATION_REPORT]    Script Date: 2/15/2023 8:00:31 PM ******/
DROP VIEW [dbo].[RECONCILIATION_REPORT]
GO

/****** Object:  View [dbo].[RECONCILIATION_REPORT]    Script Date: 2/15/2023 8:00:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[RECONCILIATION_REPORT] AS
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
GO


