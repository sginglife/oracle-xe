/*
DML(데이터 조작어)
    DML은 다음과 같은 경우에 실행합니다
    - 테이블에 새 행 추가
    - 테이블에 기존 행 수정
    - 테이블에서 기존 행 제거
    
*/

/*

[기본형식]
    insert into 테이블명 (컬럼명1, 컬럼명2, ... )
    values(값1, 값2, ... )
    
    또는
    
    insert into 테이블명 (컬럼명1, 컬럼명2, ...) subquery;

*/

select * from departments;

insert into departments(department_id, department_name, manager_id, location_id)
values (280, 'Pubilc Relations', 100, 1700);

rollback;
commit;

--null값을 가진 행 삽입(행 생략)
insert into departments (department_id, department_name)
values(290, 'Purchasing');

--null 키워드 지정
insert into departments
values(300, 'Finance', null, null)
;
commit;

/*
insert문을 subquery로 작성
*/
create table sales_reps
as (select employee_id id, last_name name, salary, commission_pct
    from employees where 1=2)
;
desc sales_reps;

--insert into sales_reps (id, name, salary, commission_pct)
select employee_id, last_name, salary, commission_pct
from employees
where job_id like '%REP%';

rollback;
commit;

/*
update문
    테이블의 기존 값을 수정합니다.
(기본형식)
    update 테이블명
    set 컬럼명 = 삽입할값
    where 조건
        

create table copy_emp
as select * from employees where 1=2;

insert into copy_rep
select * from employees;


*/

create table copy_emp
as select * from employees where 1=2;

insert into copy_emp 
select * from employees;

update employees
set department_id = 50
where employee_id = 113
;

select * from employees
where employee_id = 113
;

rollback;
commit;

update copy_emp
set department_id = 110;

select * from copy_emp;
commit;

--다음 테이블을 기반으로 행 갱신
update copy_emp
set department_id = (select department_id
                        from employees
                        where employee_id = 100)
where job_id = (select job_id
                from employees
                where employee_id = 200)
;
rollback;
select * from copy_emp;

/*
delete문
    delete문을 사용하여 테이블에서 기존 행을 제거할 수있습니다.
*/
delete from departments
where department_id = 200;

select * from departments
where department_id = 200;

rollback;

/*
truncate문
    테이블은 빈 상태로, 테이블 구조는 그대로 남겨둔 채로 테이블에서 모든 행을 제거합니다
    DML문이 아니라 DDL(데이터 정의어)문이므로 쉽게 되돌릴 수 없습니다.
    알기만 하세요. 코드에 쓰지 마세여.
*/
truncate table copy_emp;    --타노스 핑거스냅


/*
트랜잭션(transaction)
    데이터 처리의 한 단위입니다.
    오라클에서 발생하는 여러 개의 sql 명령문들을 하나의 논리적인 작업 단위로 처리하는데 
    이를 트랜잭션이라고 합니다.
    
    commit: sql문의 결과를 영구적으로 db에 반영
    rollback: sql문의 실행결과를 취소할 때
    savepoint: 트랜잭션의 한 지점에 표시하는 임시 저장점
*/

select * from sales_reps;
delete from sales_reps;

desc sales_reps;
insert into sales_reps values(1, '메타몽', 300, 0.1);
savepoint mypoint;
insert into sales_reps values(2, '잠만보', 400, 0);
insert into sales_reps values(3, '피카츄', 1000, 0.3);
insert into sales_reps values(4, '이상해씨', 1200, 0.2);
select * from sales_reps;
rollback to mypoint;

commit;

/*
select문의 for update절
    employees 테이블에서 job_id가 SA_REP인 행을 잠급니다.
    쓰지마세여 ㅇㅇ.
*/
select employee_id, salary, commission_pct, job_id
from employees
where job_id = 'SA_REP'
for update
order by employee_id













