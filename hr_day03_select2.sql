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
select employees_id, last_name, job_id, department_id
from employees
where department_id = 90;

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
    in (set)                값 리스트 중 일치하는 값 검색
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
where manager_id in (100, 101, 201);

/*
like 연산자를 사용하여 패턴 일치
    like 연산자를 사용하여 유효한 검색 문자열 값의 대체 문자 검색을 수행합니다.
    검색조건에는 리터럴 문자나 숫자가 포함될 수 있습니다.
    -%는 0개 이상의 문자를 나타냅니다.
    -_은 문자를 나타냅니다.
*/

select first_name
from employees
where first_name like '%a%';

--대체 문자 결합
select last_name
from employees
where last_name like '_o%';

--escape 식별자
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\';
--escape를 통해 이스케이프 표시 문자 지정, 이스케이프 문자 뒤 %와 _는 문자 취급

/*
null 조건 사용
    is null 연산자로 null을 테스트합니다.
*/
select last_name, manager_id
from employees
where manager_id is null;

/*
논리 연산자를 사용하여 조건정의
    and : 구성 요소 조건 모두 참인 경우 TRUE 반환
    or  : 구성 요소 조건 중 하나가 참인 경우 TRUE 반환
    not : 조건이 거짓인 경우 TRUE를 반환
*/

--and 연산자 사용
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 and job_id like '%MAN%';

--or 연산자 사용
select employee_id, last_name, job_id, salary
from employees
where salary >= 1000 or job_id like '%MAN%';

--not 연산자 사용
select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_MAN');

/*
order by 절
    order by 절을 사용하여 검색된 절을 정렬합니다.
    - asc  : 오름차순, 기본값
    - desc : 내림차순
    select문의 맨 마지막에 씁니다
*/
select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

--내림차순 정렬
select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

--열 alias 기준으로 정렬
select employee_id, last_name, salary*12 annsal
from employees
order by annsal;

--열 숫자 위치를 사용하여 정렬
select last_name, job_id, department_id, hire_date
from employees
order by 3;

--여러 열 기준으로 정렬
select last_name, job_id, department_id, hire_date
from employees
order by department_id, salary desc;
    
    