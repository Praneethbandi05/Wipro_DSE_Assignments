-- SQL Practical - Questions and Queries


/*
Question 1:
Write a query to display the current date. Label the column Date.
*/
select sysdate as "Date";


/*
Question 2:
The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.
*/
select EMPLOYEE_ID, LAST_NAME, SALARY ,SALARY+(SALARY*15.5/100) AS"New Salary" FROM HR.EMPLOYEES


/*
Question 3:
Modify the previous query to add a column alias that subtracts the old salary from the new salary. Label the column Increase.
*/
select EMPLOYEE_ID, LAST_NAME, SALARY ,SALARY+(SALARY*15.5/100) AS"New Salary", (SALARY*1.155)-SALARY AS"INCREASE" FROM HR.EMPLOYEES


/*
Question 4:
Write a query that displays the ename (first letter uppercase, remaining lowercase) and the length of the ename for employees whose name starts with J, A, or M. Sort by ename.
*/
SELECT INITCAP(FIRST_NAME) AS"NAME" , length(FIRST_NAME) AS"LENGTH" FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE 'J%' or FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%' ORDER BY FIRST_NAME;


/*
Question 5:
Rewrite the query so the user is prompted to enter a letter that starts the last name.
*/
SELECT * from HR.EMPLOYEES
WHERE LAST_NAME LIKE '&LAST_NAME%';


/*
Question 6:
The HR department wants the length of employment in months for each employee. Label MONTHS_WORKED.
*/
SELECT FIRST_NAME, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS"MONTHS_WORKED" FROM HR.EMPLOYEES ORDER BY MONTHS_WORKED;


/*
Question 7:
Create a report that produces: earns monthly but wants <3 times salary>. Label Dream Salaries.
*/
SELECT last_name || ' earns $' || salary || ' monthly but wants $' || salary * 3 AS "Dream Salaries"
FROM HR.EMPLOYEES;


/*
Question 8:
Display last name and salary formatted to 15 characters left-padded with $. Label SALARY.
*/
SELECT LAST_NAME, LPAD(SALARY,15,'$') AS"SALARY" FROM HR.EMPLOYEES;


/*
Question 9:
Display last name, hire date and salary review date. Label REVIEW.
*/
SELECT last_name, 
       hire_date, 
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'), 
               'fmDay, "the" Ddspth "of" Month, YYYY') AS REVIEW
FROM   hr.employees;


/*
Question 10:
Display last name, hire date and day of week employee started. Label DAY.
*/
SELECT last_name, hire_date, 
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'), 'Day, "the" Ddspth "of" Month, YYYY') AS REVIEW
FROM HR.employees;


/*
Question 11:
Display last names and commission amounts. If no commission show 'No Commission'. Label COMM.
*/
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM hr.employees
ORDER BY TO_CHAR(hire_date - 1, 'D');


/*
Question 12:
Display first 8 characters of last names and indicate salary with asterisks. Label EMPLOYEES_AND_THEIR_SALARIES.
*/
SELECT 
    RPAD(last_name, 8) || ' ' || RPAD('*', salary / 1000, '*') AS EMPLOYEES_AND_THEIR_SALARIES
FROM 
    hr.employees
ORDER BY 
    salary DESC;


/*
Question 13:
Using DECODE display grade based on JOB_ID.
*/
SELECT employee_id, 
       first_name, 
       last_name, 
       job_id, 
       DECODE(job_id, 
              'PRESIDENT', 'A', 
              'MANAGER',   'B', 
              'SALESMAN',  'C', 
              'CLERK',     'D', 
              '0') AS GRADE
FROM employees;


/*
Question 14:
Rewrite previous exercise using CASE syntax.
*/
SELECT first_name, job_id,
  DECODE(job_id, 'ST_CLERK', 'E', 'SA_REP', 'D', 'None') AS grade
FROM hr.employees;
