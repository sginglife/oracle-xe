

/*연결 연산자
글이나 문자열을 다른 열에 연결합니다.
두 개의 세로선(||)으로 나타냅니다.
*/
select last_name || job_id as "employees", last_name, job_id
from employees;

/*리터럴 문자열
    리터럴은 select 문에 포함된 문자, 숫자, 또는 날짜입니다.
    날짜 및 문자 리터럴 같은 작은 따옴표로 묶어야 합니다.
    각 문자열은 반환되는 각 행에 한 번 출력합니다.
*/

select last_name || ' is a '|| job_id as "employee details"
from employees;

/*
대체 인용 연산자(q) 연산자
    자신의 따옴표 구분자를 지정합니다
    구분자를 임의로 선택합니다
    가독성 및 사용성이 증가합니다
*/

select department_name || q'[department's manage id: ]' || manager_id
as "department and manager"
from departments;

/*
중복행
    기본적으로 query 결과에는 중복 행을 포함한 모든 행이 표시됩니다.
    
distinct
    결과에서 중복행 제거
*/
--중복행
select department_id
from employees;

--중복행 제거
select distinct department_id
from employees;

/*
테이블 구조표시
    describe 명령어를 사용하여 테이블 구조를 표시합니다.
*/
describe employees;



