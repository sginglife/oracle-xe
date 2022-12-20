/*
조인(join)
    조인은 여러 테이블의 정보를 보는 데 사용합니다.
    테이블을 조인하여 두 개 이상의 테이블에 있는 정보를 볼 수 있습니다.
*/

/*
natural join 생성
두 테이블에서 데이터 유형과 이름이 일치하는 열을 기반으로 자동으로 테이블을 조인할 수 있습니다.
*/

select department_id, department_name, 
    location_id, city, locations.country_id
from departments
natural join locations;

SELECT * FROM departments;
SELECT * FROM locations;

/*
using 절로 조인 생성
    natural join은 이름과 데이터 유형이 대응되는 모둔 열을 사용하여 테이블을 조인합니다.
*/
SELECT employee_id, last_name, location_id, department_id
from employees join departments
using(department_id);

/*
on 절로 조인 생성(주로 사용)
    on 절을 사용하여 조인 조건을 지정합니다.
*/
select e.employee_id, e.last_name, e.department_id, 
    d.department_id, d.location_id
from employees e join departments d
on(e.department_id = d.department_id);

select e.employee_id, e.last_name, e.department_id, 
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id;

--on 절을 이용하여 3-way 조인 생성
SELECT employee_id, city, department_name
from employees e
join departments d
on d.department_id = e.department_id
join locations i
on d.location_id = i.location_id;

--조인에 추가 조건 작성
select e.employee_id, e.last_name, e.department_id, 
    d.department_id, d.location_id
from employees e join departments d
on(e.department_id = d.department_id) and e.manager_id = 149;

/*
테이블 자체 조인
    on절을 사용하는 self join
*/

SELECT worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on (worker.manager_id = manager.employee_id);

/*
nonequijoin
    noneqiujoin 은 등호 연산자 외의 다른 연잔자를 포함하는 조인 조건입니다.
*/

CREATE TABLE job_grades (
grade_level 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);
ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade_level);
INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);
COMMIT;

select e.last_name, e.salary, j.grade_level
from employees e join job_grades j
on e.salary
    BETWEEN j.lowest_sal and j.highest_sal;

/*
inner join 과 outer join
    inner join
        natural join, using 또는 on 절을 사용하여 테이블을 조인
        일치하지 않는 절은 출력에 표시되지 않습니다.
    outer join
         일치하지 않는 절도 반환합니다.
*/
/*
left outer join
    departments 테이블에 대응하는 행이 없어도
    왼쪽 테이블인 employees 테이블의 모든 행을 검색합니다.
*/
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
;

/*
right outer join
    employees 테이블에 대응하는 행이 없어도
    왼쪽 테이블인 departments 테이블의 모든 행을 검색합니다.
*/
select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
;

/*
full outer join
    departmets, employees 대응되는 절이 없어도
    테이블의 모든 행을 검색합니다.
*/
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id
;

/*
cartesian product
    조인 조건이 잘못되거나 완전히 생략된 경우
    결과는 모든 행 조합이 표시되는 cartesian product로 나타냅니다.
*/
/*
cross join 생성
    cross join 절은 두 테이블의 교차 곱을 생성합니다.
*/
select last_name, department_name
from employees
cross join departments;












