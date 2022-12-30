/*
DCL(Data Control Language) 데이터 제의어
    DCL은 테이블을 조작할 때 필요한 권한을 조작하는 행의로 
    GRANT, REVOKE가 있습니다.


*/

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--사용자 생성하기
--CREATE USER id_name IDENTIFIED BY password
CREATE USER sginglife IDENTIFIED BY kim;

--GRANT 권한 주기
GRANT CREATE SESSION TO sginglife;
REVOKE CREATE SESSION FROM sginglife;

GRANT CREATE DATABASE LINK TO sginglife;
GRANT CREATE SEQUENCE TO sginglife;
GRANT CREATE SYNONYM TO sginglife;
GRANT CREATE TABLE TO sginglife;
GRANT DROP ANY TABLE TO sginglife;
GRANT CREATE TRIGGER TO sginglife;
GRANT CREATE VIEW TO sginglife;

/*
role - 권한 그룹

*/

--모든 권한 추가
GRANT CONNECT, DBA, RESOURCE TO sginglife;

--롤 권한 조회
SELECT * FROM dba_sys_privs WHERE grantee = 'DBA';
SELECT * FROM dba_sys_privs WHERE grantee = 'RESOURCE';

--롤 해제하기
REVOKE CONNECT, DBA, RESOURCE FROM sginglife;

--role 생성하기
CREATE ROLE role01;

--role 권한 할당
GRANT CREATE TABLE, CREATE SESSION, INSERT ANY TABLE TO role01;

--ROLE 부여
GRANT role01 TO sginglife;
--ROLE 회수
REVOKE role01 FROM sginglife;

--사용자 비밀번호 바꾸기
ALTER USER sginglife IDENTIFIED BY park;

--사용자 삭제하기
DROP USER sginglife;
DROP USER sginglife CASCADE;















