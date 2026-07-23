-- =====================================================
-- SQL Practical - 08/07/2026
-- Questions and Queries
-- =====================================================

/*
Question 1:
Display the ENAME, SAL, COMM from EMP table who earn commission and sort
the records in descending order of Salary and Comm.
Use column's numeric position in the ORDER BY clause.
*/
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

/*
Question 2:
The HR department needs a query to display all unique job codes from the EMP table.
*/
SELECT DISTINCT JOB
FROM EMP;

/*
Question 3:
The HR department wants more descriptive column headings for its report on employees.
Name the column headings Emp #, Employee, Job, and Hire Date respectively.
*/
SELECT EMPNO AS "Emp #",
       ENAME AS "Employee",
       JOB AS "Job",
       HIREDATE AS "Hire Date"
FROM EMP;

/*
Question 4:
Display the last name concatenated with the job ID (separated by a comma and space)
and name the column Employee and Title.
*/
SELECT ENAME || ', ' || JOB AS "Employee and Title"
FROM EMP;

/*
Question 5:
Display ENAME, JOB, HIREDATE, and MGR separated by commas.
Name the column THE_OUTPUT.
*/
SELECT ENAME || ',' || JOB || ',' || HIREDATE || ',' || MGR AS THE_OUTPUT
FROM EMP;

/*
Question 6:
Display the ENAME, JOB and HIREDATE for employees SCOTT or TURNER.
Order by HIREDATE in ascending order.
*/
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE ENAME IN ('SCOTT','TURNER')
ORDER BY HIREDATE;

/*
Question 7:
Display the ENAME and DEPTNO of all employees in departments 20 or 30
in ascending alphabetical order by ENAME.
*/
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30)
ORDER BY ENAME;

/*
Question 8:
Display the last name and salary of employees who earn between 2000 and 3000
and are in department 20 or 30. Label the columns Employee and Monthly Salary.
*/
SELECT ENAME AS Employee,
       SAL AS "Monthly Salary"
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000
  AND DEPTNO IN (20,30)
ORDER BY ENAME;

/*
Question 9:
Display the last name and hire date of all employees who were hired in 1981.
*/
SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY')='1981';

/*
Question 10:
Display the ENAME and SAL of employees who earn more than an amount specified by the user.
*/
ACCEPT P_SAL NUMBER PROMPT 'Enter Salary: '
SELECT ENAME, SAL
FROM EMP
WHERE SAL > &P_SAL;

/*
Question 11:
Display the last name and job title of all employees who do not have a manager.
*/
SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL;

/*
Question 12:
Prompt the user for Manager ID and display EMPNO, ENAME, SAL and DEPTNO.
The user should have the ability to sort the records on a selected column.
*/
ACCEPT P_MGR NUMBER PROMPT 'Enter Manager ID: '
ACCEPT P_COL CHAR PROMPT 'Enter column to sort by: '
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE MGR = &P_MGR
ORDER BY &P_COL;

/*
Question 13:
Prompt the user for a Manager ID and generate EMPNO, ENAME, SALARY and DEPTNO.
Allow sorting on a selected column.
*/
ACCEPT P_MANAGER NUMBER PROMPT 'Enter Manager ID: '
ACCEPT P_SORT CHAR PROMPT 'Enter column to sort by: '
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE MGR = &P_MANAGER
ORDER BY &P_SORT;

/*
Question 14:
Display all employee last names in which the third letter is A.
*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';

/*
Question 15:
Display the last name of all employees who have both an A and an S in their ENAME.
*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%'
  AND ENAME LIKE '%S%';

/*
Question 16:
Display the ENAME, JOB, SAL for all employees whose jobs are CLERK
and whose salary is 800 or 950 or 1300.
*/
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB='CLERK'
AND SAL IN (800,950,1300);
