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

declare --변수를 정의하는 영역
    v_strd_dt varchar2(8);
    v_strd_deptno number;
    
    v_deptno number;
    v_dname varchar2(50);
    v_loc varchar2(50);
    
    v_result_msg varchar2(500) default 'SUCCESS';
begin --작업 영역
    --기준일자 - 내장함수 사용
    v_strd_by := to_char(sysdate, 'yyyymmdd');
    
    --조회 부서번호 변수 설정
    v_strd_deptno := 10;
    begin
    --조회
        select T1.department_id
            , T1.department_name
            , T1.location_id
        into v_deptno
            , v_dname
            , v_loc
        from departments T1
        where T1.department_id = v_strd_deptno;
    end;
    
    --조회 결과 변수 설정
    v_result_msg := ('RESULT > DEPTNO='||v_deptno||' , DNAME='||v_dname||' , LOC='||v_loc);
    
    -- 조회 결과 출력 -> DBMS_OUTPUT.PUT_LINE( v_result_msg );
    DBMS_OUTPUT.PUT_LINE( v_result_msg );

-- 예외처리
EXCEPTION
    WHEN OTHERS THEN
       v_result_msg := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
       DBMS_OUTPUT.PUT_LINE( v_result_msg );

END; -- 작업종료
    
    
    











