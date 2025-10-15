CREATE TABLE DEPT (
deptno NUMBER PRIMARY KEY,
dept_name VARCHAR2(30) NOT NULL,
Loc VARCHAR2(30) NOT NULL
);
CREATE TABLE Emp(
  empno NUMBER PRIMARY KEY,
  emp_name VARCHAR2(30) NOT NULL,
  Job VARCHAR2(30) NOT NULL,
  Salary NUMBER NOT NULL,
  deptno NUMBER NOT NULL,
  CONSTRAINT fk_Dept FOREIGN KEY (deptno) REFERENCES DEPT(deptno)
);

INSERT INTO DEPT (deptno, dept_name, Loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT (deptno, dept_name, Loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT (deptno, dept_name, Loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT (deptno, dept_name, Loc) VALUES (40, 'OPERATIONS', 'BOSTON');


INSERT INTO EMP (empno, emp_name, Job, salary, deptno) VALUES (1001, 'ALICE', 'MANAGER', 45000, 20);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1002, 'JOHN', 'CLERK', 20000, 10);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1003, 'BOB', 'ANALYST', 40000, 20);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1004, 'CAROL', 'SALESMAN', 60000, 40);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1005, 'EMILY', 'SALESMAN', 28000, 30);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1006, 'DAVID', 'OPERATOR', 55000, 40);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1007, 'EMILY', 'SALESMAN', 28000, 20);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1008, 'EMILY', 'MANAGER', 28000, 20);
INSERT INTO EMP (empno, emp_name, job, salary, deptno) VALUES (1009, 'POLA', 'CLERK', 28000, 20);


SELECT * FROM DEPT;
SELECT * FROM EMP;

--1. Display employee names along with their departments names
SELECT e.emp_name , d.dept_name 
FROM Emp e JOIN DEPT d ON e.deptno = d.deptno;

---2. List all employees with their job titles and the location of teir department
SELECT e.emp_name, e.Job, d.Loc
FROM Emp e JOIN DEPT d ON e.deptno = d.deptno

-----3 Display employees who work in the SALES department
SELECT e.emp_name, d.dept_name, e.Job
FROM Emp e LEFT JOIN DEPT d ON e.deptno = d.deptno
WHERE dept_name = 'SALES';

------4 List all employess along with their department name and location, including departments that have no employees.
SELECT e.emp_name, d.dept_name, d.Loc,e.job
FROM DEPT d LEFT JOIN Emp e ON d.deptno = e.deptno
 
 

--6 Show each department name and total  salary paid to its employees
SELECT d.dept_name, SUM(e.salary) as Total_Salary from dept d
JOIN emp e on d.deptno=e.deptno
Group by d.dept_name;

--7 Find departments that have more than 3 employees. Display dname and number of employees.
SELECT d.dept_name, COUNT(e.empno) AS num_employees
FROM DEPT d
JOIN EMP e ON d.deptno = e.deptno
GROUP BY d.dept_name
HAVING COUNT(e.empno) >= 3;

--8 Display employees who work in the same location as the ACCOUNTING Department
SELECT emp_name FROM emp 
WHERE deptno IN(
SELECT deptno FROM dept WHERE loc =(SELECT LOC FROM dept where dept_name='ACCOUNTING'));
                                                    
--9 For each depart, display the employee who has the highest salary
SELECT d.dept_name, e.emp_name, e.salary
FROM EMP e
JOIN DEPT d ON e.deptno = d.deptno
WHERE (e.deptno, e.salary) IN (
SELECT deptno, MAX(salary)
FROM EMP
GROUP BY deptno
);

--10 List employees whose salary is greater than the average salary of their department.
SELECT e.emp_name, e.salary, d.dept_name
FROM EMP e
JOIN DEPT d ON e.deptno = d.deptno
WHERE e.salary > (
SELECT AVG(salary)
FROM EMP
WHERE deptno = e.deptno
);
