/*
UNION 연산자
    중복 행이 제거된 두 query의 행
*/
SELECT employee_id, job_id
from employees
union
SELECT employee_id, job_id
from job_history;


/*SELECT employee_id, job_id
from employees;
where employee_id in (select employee_id 
                                from job_history)
;
버그남
*/

--중복행까지 출력
select employee_id, job_id, department_id
from employees
union all
select employee_id, job_id, department_id
from job_history
order by employee_id
;

/*
intersect 연산자
    두 query의 공통적인 행 (교집합)
*/
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history
;

/*
주의) 컬럼(열)간 데이터 유형을 일치시켜야 합니다.
*/

select location_id, department_name "DEPARTMENT", 
        to_char(null) "WAREHOUSE LOCATION"
from departments
union
select location_id, to_char(null) "DEPARTMENT", 
        state_province
from locations
;


/*
[기본형식]
    select 컬럼명1, 컬럼명2, ...              5
    from 테이블명                           1
    where 조건절                           2
    group by 컬럼명                        3
    having 조건절                          4
    order by 컬럼명[ASC/DEC]               6
*/

select t.employee_id, t.name
from(
    select employee_id, first_name as name
    from employees
    where first_name like '%a%'
    order by name
) t
--where first_name like '%a%' 가 여기에 삽입되면 오류 발생.
;













