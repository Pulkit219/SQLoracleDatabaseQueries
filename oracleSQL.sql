SHOW user;

SELECT * FROM EMPLOYEES;

SELECT employee_id,  last_name FROM employees;

SELECT last_name, salary, salary +1000 FROM employees;

SELECT first_name||' '||last_name FROM EMPLOYEES;  --concatination operator--

SELECT DISTINCT JOB_ID FROM JOB_HISTORY;

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE FIRST_NAME='Neena';

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >'31-DEC-05';

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE SALARY BETWEEN 15000 AND 50000;

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1-JAN-98' AND '31-DEC-05'; --BETWEEN/AND OPERATOR--

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'C';

SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (80,90,100 );   --IN OPERATOR--

SELECT FIRST_NAME,LAST_NAME SALARY, HIRE_DATE FROM EMPLOYEES
WHERE LAST_NAME IN 'King';

SELECT FIRST_NAME,LAST_NAME SALARY, HIRE_DATE FROM EMPLOYEES
WHERE LAST_NAME IN 'King';

SELECT FIRST_NAME,LAST_NAME SALARY, HIRE_DATE FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_ia%';  ---LIKE OPERATOR USING PATTERN---

SELECT FIRST_NAME,LAST_NAME SALARY, HIRE_DATE FROM EMPLOYEES
WHERE DEPARTMENT_ID IS null; --IS USER FOR NULL

--------------SNIPPETS AND FUNCTIONS------------------------------------------------
SELECT UPPER('HELLO') FROM DUAL; 

SELECT INITCAP('HEllLO') FROM DUAL;

SELECT FIRST_NAME,LAST_NAME, LENGTH(FIRST_NAME)  FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 2, 1) FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, LAST_NAME) FROM EMPLOYEES;

SELECT RPAD('HELLO', 12, '?') FROM DUAL;

SELECT LTRIM('HELLO WORLD', 'H') FROM DUAL;

SELECT TRIM('H' FROM 'HHHELOHHH') FROM DUAL;

SELECT ROUND(29.8878, 2) FROM DUAL;

SELECT TRUNC(29.8878) FROM DUAL;

SELECT ABS(-5.66) FROM DUAL;

SELECT MOD(11,4) FROM DUAL;

--------------TIME AND DATE FUNCTIONS----------------------

SELECT TO_DATE('12-MARCH-17') + 3 FROM DUAL;

SELECT SYSTIMESTAMP FROM DUAL;

SELECT  ADD_MONTHS('2-MAY-10', 4)FROM DUAL;

SELECT  ADD_MONTHS('2-MAY-10', 4)FROM DUAL;

-----------------NVL FUNCTION-----------------------

SELECT  FIRST_NAME, NVL(TO_CHAR(COMMISSION_PCT),'NA') FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'SA_MAN');

SELECT  FIRST_NAME,JOB_ID, NVL2(COMMISSION_PCT,'COMMSIONS','NO COMM') FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'SA_MAN');

------------------GROUP FUNCTIONS---------------
SELECT SUM(SALARY) FROM EMPLOYEES;

SELECT MAX(SALARY) FROM EMPLOYEES;

SELECT MAX(SALARY), DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT COUNT(*) FROM EMPLOYEES;

SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;

SELECT SUM(SALARY) FROM EMPLOYEES;

--------TOTAL SALARIES FROM EACH DEPT------
SELECT JOB_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING SUM(SALARY) >25000;

--------------CREATE TABLE----------------


CREATE TABLE student

(
	first_name VARCHAR(30) NOT NULL,

	last_name VARCHAR(30) NOT NULL,

	email VARCHAR(60) NULL,

	street VARCHAR(50) NOT NULL,

	city VARCHAR(40) NOT NULL,

	state CHAR(2) NOT NULL ,

	zip INT  NOT NULL,

	phone VARCHAR(20) NOT NULL,

	birth_date DATE NOT NULL,

	date_entered TIMESTAMP,

	lunch_cost FLOAT NULL,

	student_id INT  NOT NULL PRIMARY KEY

	);


-------------ALTER TABLE----------


CREATE TABLE DEMO(
col1 VARCHAR(30)
);

DESC DEMO;

ALTER TABLE DEMO ADD testing NUMBER(4);

ALTER TABLE DEMO RENAME COLUMN col1 TO col2;

ALTER TABLE DEMO MODIFY COLUMN col2 VARCHAR(30);




---------SQL JOINS---------------
--------OUTER JOIN, INNER JOIN, CROSS JOIN, SELF JOIN---------
--------OUTER JOIN=> LEFT OUTER, RIGHT OUTER, FULL OUTER JOIN -------

SELECT DEPARTMENT_NAME,MANAGER_ID, STREET_ADDRESS FROM DEPARTMENTS NATURAL JOIN LOCATIONS;

SELECT DEPARTMENT_NAME,MANAGER_ID, STREET_ADDRESS FROM DEPARTMENTS NATURAL JOIN LOCATIONS;

-------------CREATING TEMP TABLES------------------------

CREATE TABLE emp

(
emp_id NUMBER(2) CONSTRAINT emp_col1_pk PRIMARY KEY,
emp_name VARCHAR2(20),
emp_salary NUMBER(5)
);

CREATE TABLE dept
(
dept_id NUMBER(2) CONSTRAINT dept_col1_pk PRIMARY KEY,
dept_name VARCHAR2(20),
emp_id CONSTRAINT dept_col2_fk REFERENCES emp(emp_id)
);

INSERT INTO "HR"."EMP" (EMP_ID, EMP_NAME,EMP_SALARY) VALUES('1','Steve','20000');
INSERT INTO "HR"."EMP" (EMP_ID, EMP_NAME,EMP_SALARY) VALUES('2','Pulkit','50000');
INSERT INTO "HR"."EMP" (EMP_ID, EMP_NAME,EMP_SALARY) VALUES('3','Rob','40000');
INSERT INTO "HR"."EMP" (EMP_ID, EMP_NAME,EMP_SALARY) VALUES('4','James','30000');
INSERT INTO "HR"."EMP" (EMP_ID, EMP_NAME,EMP_SALARY) VALUES('5','Warner','70000');

SELECT * FROM emp;

INSERT INTO "HR"."DEPT" (DEPT_ID,DEPT_NAME,EMP_ID) VALUES('1','Sales','1');
INSERT INTO "HR"."DEPT" (DEPT_ID,DEPT_NAME,EMP_ID) VALUES('2','Accounts','2');
INSERT INTO "HR"."DEPT" (DEPT_ID,DEPT_NAME,EMP_ID) VALUES('3','Finance','3');
INSERT INTO "HR"."DEPT" (DEPT_ID,DEPT_NAME) VALUES('4','IT');
INSERT INTO "HR"."DEPT" (DEPT_ID,DEPT_NAME) VALUES('5','Marketing');

SELECT * FROM dept;

---------RIGHT OUTER JOIN WITH ON CLAUSE---
SELECT emp_name,dept_name FROM dept RIGHT OUTER JOIN emp ON(emp.emp_id = dept.emp_id);

--------------QUERY2-----------RIGHT OUTER JOIN WITH USING  CLAUSE----------
SELECT emp_name,dept_name FROM dept RIGHT OUTER JOIN emp USING(emp_id);

--------------QUERY3-----------RIGHT OUTER JOIN WITH WHERE CLAUSE----------
SELECT emp_name,dept_name FROM dept RIGHT OUTER JOIN emp USING(emp_id) WHERE emp.EMP_SALARY>30000;

------------------------LEFT OUTER JOIN---------------------
SELECT emp_name,dept_name FROM dept LEFT OUTER JOIN emp USING(emp_id);

-----------------FULL OUTER JOIN-----------------------------

SELECT emp_name,dept_name FROM dept FULL OUTER JOIN emp USING(emp_id);

---------------------INNER JOIN----------------
SELECT emp_name,dept_name FROM dept INNER JOIN emp ON(emp.emp_id = dept.emp_id);

----------USING CLAUSE--------
SELECT emp_name,dept_name FROM dept INNER JOIN emp USING(EMP_ID);

-----------------CROSS JOIN---------------
SELECT emp_name,dept_name FROM dept CROSS JOIN emp;


--------------COPY THE ENTIRE TABLE INTO NEW ONE-----
INSERT INTO tableName
SELECT * FROM tableName2;







































