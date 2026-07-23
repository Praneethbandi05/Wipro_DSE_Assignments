-- ==========================================
-- SQL Practical
-- Date: 07/07/2026
-- ==========================================

/*
Question 1:
Determine the Structure of DEPT Table and its Contents.
*/
DESC DEPT;

SELECT *
FROM DEPT;

/*
Question 2:
Determine the Structure of EMP Table and its Contents.
*/
DESC EMP;

SELECT *
FROM EMP;

/*
Question 3:
Display the ENAME and DEPTNO from EMP table whose EMPNO is 7788.
*/
SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7788;