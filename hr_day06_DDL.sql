/*
DDL(데이터 정의어)
    데이터베이스 내의 객체(테이블, 시퀀스, ... )등을 생성하고 변경하고 삭제하기 위해서
    사용되는 sql
*/

/*
create table문
    데이터를 저장할 테이블을 생성합니다.
*/
create table dept(
    deptno number(6), 
    dname varchar2(200), 
    loc varchar2(200)
    );
    
/*
데이터유형
    varchar2(size) 가변길이 문자 데이터(4000)
    number(p, s) 가변길이 숫자 데이터
    char(size) 고정 길이 문자 데이터 (2000)
    date 날짜 및 시간 값
    long 가변 길이 문자 데이터 (최대 2GB)
    clob 문자 데이터(최대 4GB)
    ram and long raw 원시 이전 데이터
    blob 바이너리 데이터(최대 4GB)
    bfile 외부 파일에 저장된 바이너리 데이터(최대 4GB)
    rowid 테이블에 있는 행의 고유한 주소를 나타내는 base-64
*/
insert into dept
select department_id, department_name, location_id, sysdate
from deaprtments;

commit;

--테이블 복사하기
create table dept2 as select * from dept;

select * from dept2;

--테이블 구조와 배치

create table dept3 as select * from dept where 1=2;

select * from dept3;

/*
alter문
    객체를 변경하는데 사용합니다.
    
*/
create table simple(num number); --테이블 생성

desc simple;
alter table simple add(name varchar2(3));
alter table simple modify(name varchar2(30));
alter table simple drop column name;

alter table simple add(addr varchar2(50));
alter table simple drop(addr);

/*
제약조건(constraint)
    테이블의 해당일정에 원하지 않는 데이터를 입력/수정/삭제 되는 것을 방지하기 위해
    테이블 생성 또는 변경시 설정하는 조건(저장된 데이터의 신뢰성을 높이기 위해 사용)
    
    not null
        null 입력이 되어서는 안되는 컬럼에 부여하는 
        조건으로 일정 레벨에서만 부여할 수 있는 제약조건입니다.
        (null 은 허용된다)
    unique key(유일키)
        저장된 값이 중복되지 않고 오직 유일하게 
        유지되어야 할 때 사용하는 제약조건입니다.
        (NULL은 허용된다)
    primary key(대표키/기본키)
        not null 조건과 unique key 조건을 합친 조건
    order
        조건에 맞는 데이터만 입력되도록 조건을 부여하는 제약조건입니다.
    foreign key(외래키)
        부모 테이블의 primary key를 참조하는 컬럼에 붙이는 제약조건입니다.
    
*/

create table dept4(
    deptno number(2) constraint dept4_deptno_pk primary key
    dname varchar2(15) default '영업부'
    loc char(1) constraint dept4_loc_ck check(loc in('1', '2'))
    );
















