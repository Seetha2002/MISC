--Example 1:
CREATE INDEX inde ON
    emp (
        ename
    );

SELECT
    deptno,
    MAX(sal),
    MIN(sal),
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;


--Example 2:
CREATE VIEW aggregate AS
    SELECT
        deptno,
        MAX(sal) "MAXSAL",
        MIN(sal) "MINSAL",
        AVG(sal) "AVGSAL"
    FROM
        emp
    GROUP BY
        deptno;

SELECT
    *
FROM
    aggregate;

--Example 3:
CREATE OR REPLACE VIEW emp_view AS
    SELECT
        empno,
        ename,
        sal,
        deptno,
        hiredate
    FROM
        emp;

SELECT
    *
FROM
    emp_view;

INSERT INTO emp_view VALUES (
    1234,
    'SEETHA',
    1220,
    20
);

SELECT
    *
FROM
    emp;
    
--Example 4:
CREATE VIEW emp_dep AS
    SELECT
        e.empno,
        e.ename,
        e.deptno,
        d.dept_loc
    FROM
        emp       e,
        department d;

INSERT INTO emp_dep VALUES (
    123,
    'SRI',
    20,
    'HYD'
);

desc department;

--Example 5:
CREATE VIEW my_emp AS
    SELECT
        *
    FROM
        emp
    WHERE
        deptno = 10;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    my_emp;

--Example 6:
CREATE SEQUENCE dept_s INCREMENT BY 1 START WITH 12 MINVALUE 10 MAXVALUE 20 NOCYCLE NOCACHE;

TRUNCATE TABLE department;

desc department

INSERT INTO department VALUES (
    dept_s.NEXTVAL,
    'SALES',
    'HYDERABAD'
);

INSERT INTO department VALUES (
    dept_s.NEXTVAL,
    'REVENUE',
    'HYDERABAD'
);

SELECT
    *
FROM
    department;

ALTER SEQUENCE dept_s CYCLE;

--Example 7:
CREATE SEQUENCE roll INCREMENT BY 01 START WITH 0401 MINVALUE 01 MAXVALUE 20 NOCYCLE;

CREATE TABLE student_data (
    rollno VARCHAR2(10)
);

ALTER TABLE student_data MODIFY
    rollno VARCHAR(10);

TRUNCATE TABLE student_data

INSERT INTO student_data VALUES ( concat('19K61A', roll.NEXTVAL) );
select* from student_data
