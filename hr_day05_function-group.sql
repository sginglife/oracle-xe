/*그룹 함수
	그룹 함수는 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출합니다.
	-avg() 그룹의 평균값. null은 무시
	-count() 행 개수. null값 무시
	-max()/min() 최대/최소값. null은 무시
	-stddev() 표준편차. null은 무시
	-sum() 합계. null은 무시
	-variance() 분산. null은 무시
*/

select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_rep like '%REP%';

select count(*)
from employees
where department_id = 50;

select count(commision_pct)
from employees
where department_id = 80;

select count(commision_pct)
from employees;

--count(distinct expr)은 expr의 null값이 아닌 구분 값의 수를 반환합니다.

select count(nvl(department_id, 0))
from employees;

select count(distinct department_id)
from employees;

--nvl() 함수는 강제로 그룹에 null값이 포함되도록 합니다.


/*
group by 절 사용(distinct보다 성능이 좋음)
	테이블의 행을 그룹으로 나눌 수 있습니다.
*/

select department_id, avg(salary)
from employees
group by department_id;

--여러 열에서 group by 절 사용
select department_id, job_id, sum(salary)
from employees
where deprtment_id > 40
group by department_id, job_id
order by department_id;

/*
having 절
	having 절을 사용할 경우 oracle 서버는 다음과 같이 그룹을 제한합니다.
	1. 행을 그룹화합니다.
	2. 그룹 함수가 적용됩니다.
	3. having 절과 일치하는 그룹이 표시됩니다.
*/

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000
;

select job_id, sum(salary) PAYROLL
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary)
;

--그룹 함수 중첩
select max(avg(salary))
from employees
group by department_id;

select max(salary)
from employees
group by department_id;