SHOW user;
SELECT * FROM EMPLOYEES;
SELECT employee_id,  last_name FROM employees;
SELECT last_name, salary, salary +1000 FROM employees;
SELECT first_name||' '||last_name FROM EMPLOYEES;  --concatination operator--
SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE FIRST_NAME='Neena';
SELECT FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >'31-DEC-05';
