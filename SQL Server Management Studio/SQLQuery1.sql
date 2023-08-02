CREATE TABLE Employee (

id INT PRIMARY KEY,

Name VARCHAR(15),

Department VARCHAR(10),

Salary DECIMAL(8, 2),

Gender VARCHAR(10),

Age INT,

City VARCHAR(10)
)

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1001, 'John', 'IT', 35000, 'Male', 25, 'London');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1002, 'Smith', 'HR', 45000, 'Female', 27, 'Mumbai');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1003, 'James','Finance', 50000, 'Male', 28, 'Delhi');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike', 'Finance', 50000, 'Male', 28, 'London');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda','HR', 75000, 'Female', 26, 'Mumbai');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag', 'IT', 35000, 'Male', 25, 'London');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyania','HR', 45000, 'Female', 27,'Mumbai');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit','IT', 50000, 'Male', 28, 'London');

INSERT INTO Employee (id, Name, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya','IT',50000,'Male',26,'Mumbai');
INSERT INTO Employee (id) values(1111)
INSERT INTO Employee (id) values('')
SELECT * FROM Employee where id = ''


CREATE TABLE EMP
(
EMPNO DECIMAL(4) PRIMARY KEY,

ENAME VARCHAR(10),

JOB VARCHAR(9), 

MGR DECIMAL(4), 

HIREDATE DATE, 

SAL DECIMAL(7, 2), 

COMM DECIMAL(7, 2), 

DEPTNO DECIMAL(2)
)

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('1980-DEC-17', 'YYYY-MM-DD'), 800, NULL, 20);
INSERT INTO emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7369, 'SMITH', 'CLERK', 7902, CONVERT(DATETIME,'17-DEC-2021'), 800, 'NULL', 20) 
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, CONVERT(DATETIME, '2012-07-18'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('2-APR-1981', 'DD-MON-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('1-MAY-1981', 'DD-MON-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7839, 'CLARK', 'MANAGER', 7782, TO_DATE('9-JUN-1981', 'DD-MON-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7788, TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('8-SEP-1981', 'DD-MON-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

DROP TABLE EMP
Use Practice
SELECT * FROM EMP
