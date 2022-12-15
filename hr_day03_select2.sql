/*
선택을 사용하여 행 제한
    where행을 사용하여 반환되는 행을 제한합니다.
    
where
    조건을 충족하는 행으로 query를 제한합니다.
    
    세가지 요소:
        -열 이름
        -비교 조건
        -열 이름, 상수 또는 값 리스트
*/

--where절 사용
/*select employees_id, last_name, job_id, department_id
from employees
where department_id = 90;*/

/*
문자열 및 날짜
    문자열 및 날짜 값은 작은 따옴표로 묶습니다.
    문자 값은 대소문자를 구분하고 날짜 같은 형식을 구분합니다.
    기본 날짜 표시 형식은 dd-mon-rr 입니다.
*/


select last_name, job_id, department_id
from employees
where last_name = 'Whalen';

select last_name, hire_date
from employees;



/*
비교 연산자
    특정 표현식을 다른 값이나 표현식과 비교하는 조건에서 사용됩니다.
    
    =  같음
    >  보다 큼
    >= 크거나 같음
    <  보다 작음
    <= 보다 작거나 같음
    <> 같지 않음
    between ... and ...     두 값 사이(경계값 포함)
    in(set)                 값 리스트 중 일치하는 값 검색
    like                    일치하는 문자 패턴 검색
    is null                 null값인지 여부
    
*/

--비교 연산자 사용
select last_name, salary
from employees
where salary <= 3000;

--between 연산자를 사용하는 범위 조건
select last_name, salary
from employees
where salary between 2500 and 3500;

--in 연산자를 사용하는 범위조건
select employee_id, last_name, salary, manager_id
from employees
where management_id in (100, 101, 201);

    
    