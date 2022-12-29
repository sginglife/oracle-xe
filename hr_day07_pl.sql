/*
PL/SQL(Procedural Language extention to SQL)
    SQL을 확장한 절차적 언어입니다.
    여러 SQL을 하나의 블록(block)으로 구성하여 SQL을 제어할 수 있습니다.
*/

/*
익명프로시져 - DB에 저장되지 않습니다.
(기본구조)
    declare - 변수정의
    begin - 처리 로직 시작
    exception - 예외 처리
    exit - 처리 로직 종료
*/

--실행 결과를 출력하도록 설정
set serveroutput on

--스크립트 경과 시간을 출력하도록 설정
set timing on

DECLARE -- 변수를 정의 하는 영역
    V_STRD_DT VARCHAR2(8);
    V_STRD_DEPTNO NUMBER;
    
    V_DEPTNO NUMBER;
    V_DNAME VARCHAR2(50);
    V_LOC VARCHAR2(50);
    
    V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN  -- 작업 영역
    -- 기준일자 -> 내장함수 사용.
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    
    -- 조회 부서번호 변수 설정
    V_STRD_DEPTNO := 10;
    BEGIN
        -- 조회
        SELECT T1.department_id
            , T1.department_name
            , T1.location_id
        INTO V_DEPTNO  --불러온 결과를 변수에 담아줌
            ,V_DNAME
            ,V_LOC
        FROM departments T1
        WHERE T1.department_id = V_STRD_DEPTNO;
    END;
    
    --조회 결과 변수 설정 RESULT > DEPTNO=10, DNAME=Administration, LOC=1700
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    
    -- 조회 결과 출력 -> DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );  --RESULT > DEPTNO=10, DNAME=Administration, LOC=1700

-- 예외처리
EXCEPTION
    WHEN OTHERS THEN
       V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
       DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );

END; -- 작업종료


/*
프로시져

기본구조
CREATE OR REPLACE PROCEDURE  procedure_name (parameter1, parameter2, ...);
    IS [AS]
        declaration part
    BEGIN
        execution part
    [EXCEPTION]
        exception part
END;


*/

--프로시져 : 이름, 매개변수, 반환값 X
CREATE OR REPLACE PROCEDURE print_hello_proc
    IS
        msg VARCHAR2(20) := 'HELLO WORLD';   --변수 초기값 선언
    BEGIN
        DBMS_OUTPUT.PUT_LINE(msg);
    END;

EXEC print_hello_proc;

CREATE TABLE emp2 AS
SELECT * FROM employees;

--IN 매개변수
CREATE OR REPLACE PROCEDURE update_emp2_salary_proc (eno IN NUMBER) IS
    BEGIN
        UPDATE emp2 SET salary = salary*1.1
        WHERE employee_id = eno;
        COMMIT;
    END;

SELECT * FROM emp2
WHERE employee_id = 115;

EXEC update_emp2_salary_proc(115);
--3100 -> 3410

--OUT 매개변수
CREATE OR REPLACE PROCEDURE find_emp2_proc (v_eno IN NUMBER, 
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
    IS
    BEGIN
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal
        FROM emp2 WHERE employee_id = v_eno;
    END;

VARIABLE v_fname NVARCHAR2(25);
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sal number(8, 2);

EXEC find_emp2_proc(115, :v_fname, :v_lname, :v_sal);
PRINT v_fname;

--IN OUT 매개변수
--매개변수로 시작하고 반환변수로 끝난다.

CREATE OR REPLACE PROCEDURE find_emp2_sal (v_eno IN OUT NUMBER)
IS
    BEGIN
        SELECT salary
        INTO v_eno
        FROM emp2 WHERE employees_id = v_eno;
    END;

DECLARE
    v_eno NUMBER := 115;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('eno = '||v_eno);
        find_emp2_sal(v_emo);
        DBMS_OUTPUT.PUT_LINE('eno = '||v_eno);
    END;
    
VAR v_eno NUMBER;
EXEC :v_eno := 115;
PRINT v_eno;
EXEC find_emp2_sal(:v_eno);
PRINT v_eno;

/*
함수(function)
    특정 기능들을 모듈화, 
CREATE OR REPLACE FUNCTION  function_name [(parameter1, parameter2, ...)]
RETURN datatype
    IS [AS]
        declaration part
    BEGIN
        execution part
    [EXCEPTION]
        exception part
    RETURN variable;
END;

*/

CREATE OR REPLACE FUNCTION FN_GET_DEPT_NAME(
    P_DEPT_NO IN NUMBER
) RETURN VARCHAR2
    IS
        V_TEST_NAME VARCHAR(30);
    BEGIN
        SELECT department_name
        INTO V_TEST_NAME
        FROM departments
        WHERE department_id = P_DEPT_NO;
    RETURN V_TEST_NAME;
    END;

SELECT FN_GET_DEPT_NAME(20) FROM dual;

/*
트리거(TRIGGER)
    INSERT, UPDATE, DECLARE 문이 TABLE에 대해 행해질 때 묵시적으로 시행되는 프로시져입니다.

기본구조
CREATE OR REPLACE TRIGGER trigger_name
RETURN datatype
    DECLARE
        declaration part
    BEGIN
        [INSERTING, UPDATING, DELETING]
    [EXCEPTION]
        exception part
END;
*/
CREATE TABLE dept6(
    deptno NUMBER(6) PRIMARY KEY, 
    dname VARCHAR(200), 
    loc VARCHAR2(200), 
    create_date DATE DEFAULT SYSDATE,
    update_date DATE DEFAULT SYSDATE
    );
SELECT 
    deptno, 
    dname, 
    loc, 
    TO_CHAR(create_date, 'YYMMDD HH24:MI:SS'), 
    TO_CHAR(update_date, 'YYMMDD HH24:MI:SS')
FROM dept6;

CREATE OR REPLACE TRIGGER tr_dept6
    BEFORE UPDATE ON dept6
    FOR EACH ROW
    BEGIN
        :new.update_date := SYSDATE;
    END;



INSERT INTO dept6(deptno, dname, loc)
VALUES(1, 'DEV', '서울특별시');
COMMIT;

UPDATE dept6 SET
loc = '강릉시'
WHERE deptno = 1;
COMMIT;


    

    











