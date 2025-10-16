 ----------------------------------------------------------------------------Assignment 1--------------------------------------------------------------------
DECLARE
P NUMBER:=5000;
T NUMBER:=3;
R NUMBER:=11;
SI NUMBER;
BEGIN
SI:=(PTR)/100;
DBMS_OUTPUT.PUT_LINE("SI = "||SI);
END;



 ----------------------------------------------------------------------------Assignment 2--------------------------------------------------------------------
DECLARE
EMP_NAME VARCHAR2(50):='Harsha';
SALARY NUMBER:=70000;
BONUS NUMBER;
BEGIN
IF SALARY>50000 THEN
BONUS:=0.10SALARY;
DBMS_OUTPUT.PUT_LINE(EMP_NAME||' '||SALARY||' '|| BONUS);
ELSE
BONUS:=0.15SALARY;
DBMS_OUTPUT.PUT_LINE(EMP_NAME||' '|| SALARY|| ' ' || BONUS);
END IF;
END;



 ----------------------------------------------------------------------------Assignment 3--------------------------------------------------------------------
DECLARE
V_DEPT DEPARTMENTS%ROWTYPE;
BEGIN
SELECT * INTO V_DEPT FROM DEPARTMENTS WHERE DEPT_NO=101;
DBMS_OUTPUT.PUT_LINE('DEPARTMENT NAME: '||V_DEPT.DNAME||'LOCATION : '||V_DEPT.LOC);
END;



 ----------------------------------------------------------------------------Assignment 4--------------------------------------------------------------------
DECLARE
TYPE MARKS_TABLE IS TABLE OF NUMBER INDEX BY VARCHAR2(30);
STUDENT_MARKS MARKS_TABLE;
TOTAL_MARKS NUMBER:=0;
AVG_MARKS NUMBER :=0;
STUDENT_NAME VARCHAR(20);
COUNTER NUMBER:=0;
BEGIN
STUDENT_MARKS('HARSHA'):=95;
STUDENT_MARKS('Smruthika'):=85;
STUDENT_MARKS('RAM'):=75;
STUDENT_MARKS('Ranjitha'):=80;
STUDENT_MARKS('Pavithra'):=65;
DBMS_OUTPUT.PUT_LINE('STUDENT MARKS LIST:');
STUDENT_NAME :=STUDENT_MARKS.FIRST;
WHILE STUDENT_NAME IS NOT NULL LOOP
DBMS_OUTPUT.PUT_LINE(STUDENT_NAME||':'||STUDENT_MARKS(STUDENT_NAME));
TOTAL_MARKS:=TOTAL_MARKS+STUDENT_MARKS(STUDENT_NAME);
COUNTER:=COUNTER+1;
STUDENT_NAME:=STUDENT_MARKS.NEXT(STUDENT_NAME);
END LOOP;
AVG_MARKS:=TOTAL_MARKS/COUNTER;
DBMS_OUTPUT.PUT_LINE('TOTAL MARKS: '||TOTAL_MARKS);
DBMS_OUTPUT.PUT_LINE('AVG MARKS : '||ROUND(AVG_MARKS,2));
END;



 ----------------------------------------------------------------------------Assignment 5--------------------------------------------------------------------
DECLARE
TYPE country_capital_table IS TABLE OF VARCHAR2(50) INDEX BY VARCHAR2(50);
country_capital country_capital_table;
v_country VARCHAR2(50);
BEGIN
country_capital('USA'):='WASHINGTON';
country_capital('FRANCE'):='PARIS';
country_capital('AUSTRALIA'):='CANBERRA';
country_capital('INDIA'):='NEW DELHI';
country_capital('GERMANY'):='BERLIN';
v_country:='&enter_country_name';
IF country_capital.EXISTS(v_country) THEN
DBMS_OUTPUT.PUT_LINE('THE CAPITAL OF'||v_country||' is '||country_capital(v_country));
ELSE
DBMS_OUTPUT.PUT_LINE('COUNTRY NOT IN LIST');
END IF;
END;
