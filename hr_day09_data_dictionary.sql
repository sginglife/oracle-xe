/*
데이터 딕셔너리
    오라클 데이터 딕셔너리는 데이터베이스에 대한 메타 데이터이며
    모든 객체의 이름과 속성을 포함합니다.

*/

SELECT * FROM dictionary;

/*
DBA_ : DBA 권한 QUERY 가능 / 모든 항목 / DBA 전용
ALL_ : 모두 QUERY 가능 / 유저의 고유 객체와 유저에게 보기 권한이 부여된 기타 객체
USER_ : 유저가 소유하는 모든 항목 / 누락된 OWNER 열은 제외하고 일반적으로 ALL_과 같음
*/

SELECT table_name, tablespace_name
FROM all_tables;

SELECT * FROM all_tables;

--스키마에 생성된 해당 테이블
SELECT table_name, tablespace_name
FROM user_tables;

--시퀀스 정보
SELECT sequence_name, min_value, max_value, increment_by
FROM all_sequences;

--로그인 할 수있는 유저
SELECT username, account_status
FROM dba_resources
WHERE account_status = 'OPEN';

--인덱스 정보를 볼 수 있는 뷰
DESC dba_indexes;

/*
성능뷰(DYNAMIC PERFORMANCE VIEW)
    오라클 인스턴스의 작업 및 성능에 대한 모니터링, 감시 등을 위한 뷰입니다.
v$instance
    해당 인스턴스 정부 출력(SID, 인스턴스 동작 상태 등)
v$session

v$sysstat

v$process

v$lock
    락 요청, 응답 정보들을 보여준다.
v$event_name
    대기중인 이벤트들의 정보를 보여준다.
v$open_cursor
    연결된 세션의 커서를 보여준다.
v$system_parameter
*/

--CPU 시간이 200,000마이크로초 이상 소비되는 SQL문
SELECT sql_text, executions
FROM v$sql
WHERE cpu_time > 200000;

--전날 컴퓨터에서 로그인한 현재 세션은 어느 것입니까?
SELECT * FROM v$session
WHERE 1=1
AND machine = 'DESKTOP-61RQHUM'
AND logon_time > SYSDATE - 1;

SELECT sid, ctime FROM v$lock
WHERE block > 0;

--악성쿼리 조회
SELECT
    a.sid, 
    a.serial#, 
    a.process, 
    a.username, 
    a.osuser, 
    b.sql_text, 
    c.program
FROM 
    v$session a, 
    v$sqlarea b, 
    v$process c
WHERE 1=1
    AND a.sql_hash_value = b.hash_value
    AND a.sql_address = b.address
    AND a.paddr = c.addr
    AND a.status = 'ACTIVE'
;

--유저 세션 kill
ALTER SYSTEM KILL SESSION 'SID, 시리얼번호';






















