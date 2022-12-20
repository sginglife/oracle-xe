/*
함수(function)
    매개변수를 받아 특정 작업을 수행하고 결과를 반환하는 구조로 되어 었습니다.
    
함수 유형
    -단일행 함수: 단일행 매개변수를 받아 결과값 반환
    -여러행 함수: 여러행 매개변수를 받아 결과값 반환
*/

--대소문자 변환 함수

--lower() 함수 - 소문자로 반환
select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'HIGGINS';

--upper() 함수 - 대문자로 변환
select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

select employee_id, last_name, department_id
from employees
where upper(last_name) = 'HIGGINS';

--initcap() 함수 - 첫글자만 대문자로 변환
select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

select employee_id, last_name, department_id
from employees
where last_name = initcap('higgins');

/*
문자 조작 함수
*/
--concat() 함수 - 두개 파라미터 값을 연결합니다.
select 'Hello'||'World' from dual;
select concat('Hello', 'World') from dual;

--substr() 함수 - 지정된 길이의 문자열을 추출합니다.
--sql은 첫번째 문자를 1번째로 지정합니다.
select substr('HelloWorld', 1, 5) from dual;

--length() - 문자열 길이를 숫자로 표시합니다.
select length('HelloWorld') from dual;

--instr() - 이름이 지정된 문자의 숫자 위치를 찾습니다.
select instr('HelloWorld', 'W') from dual;

--lpad() - 길이가 n이 되도록 왼쪽문터 문자로 채운 문자열을 반환합니다.
select lpad('HelloWorld', 15, '*') from dual;

--rpad() - 길이가 n이 되도록 오른쪽문터 문자로 채운 문자열을 반환합니다.
select rpad('HelloWorld', 15, '*') from dual;

--replace() - 문자열 치환
select replace('JACK AND JUE', 'J', 'BL') from dual;

--trim() - 문자열에서 선행문자나 후행문자를 자릅니다.
select trim('H' from 'HelloWorld') from dual;

/*
숫자 함수
*/

--round() - 지정된 소수를 자릿수로 값을 반올림합니다.
select round(45.926, 2) from dual;

--trunc() - 지정된 소수를 자릿수로 값을 버림(truncuate)합니다.
select trunc(45.926, 2) from dual;

--mod() - 남은 나머지를 반환합니다.
select mod(1600, 300) from dual;

/*
날짜 함수
*/
/*
structuate()함수
    반환값 - 날짜, 시간
*/
select sysdate from dual;

/*
날짜 연산
    - 날짜에 숫자를 더하거나 빼서 결과 날과 값을 구합니다.
    - 두 날짜 사이의 일수를 알아내기 위해 빼기 연산을 합니다.
    - 시간 수를 24로 나눠 날짜에 시간을 더합니다.
*/

select last_name, (sysdate - hire_date)/7 as weeks
from employees
where department_id = 90;

/*
날짜 조작 함수

months_between() - 두 날짜 사이의 월수
add_months() - 날짜에 월 추가
next_day() - 지정된 날짜 다음의 지정된 요일 출력
last_day() - 월의 마지막날
round() - 날짜 반올림
trunc() - 날짜 버림
*/

select months_between('22-12-16', '21-12-16') from dual;
select add_months('22-12-16', 1) from dual;
select next_day('22-12-16', 6) from dual;
select last_day('22-12-16') from dual;
select round(sysdate, 'month') from dual;
select trunc(sysdate, 'month') from dual;

/*
변환함수
*/
/*
to_char() 함수
    YYYY        숫자로 된 전체 연도
    YEAR        영어 철자로 표기된 연도
    MM          월의 두자리 값
    MONTH       전체 월 이름
    MON         월의 세자리 약어
    DY          세 문자로 된 요일 약어
    DAY         요일 전체 이름
    DD          숫자 형식의 월간 일
    AM 또는 PM   자오선 표시
    A.M. 또는 P.M.   마침표가 있는 자오선 표시
    MI          분(0-59)
    SS          초(0-59)
    TIMESTAMP   타입
    FF          밀리세컨드
*/
--to_char() 함수
select last_name, to_char(hire_date, 'YYYY-MM-DD HH24:MI:SS') as hiredate
from employees;

/*
to_char() 숫자에 사용
    9 - 숫자로 나타냄
    0 - 0이 표시되도록 강제 적용
    $ - 부동 달러 기호 배치
    L - 부동 로컬 화폐 기호 배치
    . - 소수점 출력
    , - 천단위 표시자로 쉼표 출력
    
*/
select to_char(salary, '$99,999.00') salary
from employees
where last_name = 'Earnst';

select last_name, to_char(hire_date, 'YYYY-MM-DD')
from employees
where hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD');

/*
함수 중첩
    단일 열 함수는 어떠한 레벨로도 중첩할 수 있습니다.
    중첩된 함수는 가장 깊은 레벨에서 가장 낮은 레벨로 올라갑니다.
*/
SELECT last_name UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US'))
FROM employees
WHERE department_id = 60;

/*
NVL 함수
    null값을 실제값으로 반환합니다.
*/
select last_name, salary, NVL(commission_pct, 0),
    (salary*12) * (salary*12*NVL(commission_pct, 0)) AN_SAL
from employees;

/*
NVL2() 함수
    첫번째 표현식을 검사합니다. 첫번째 표현식이 null이 아니면 NVL2() 함수는 두번째 표현식을 
    반환합니다.
    첫번째 표현식이 null이면 세번째 표현식을 반환합니다.
*/

select last_name, salary, commission_pct, 
    NVL2(commission_pct, 'SAL + COMM', 'SAL') SALARY_TYPE
from employees;

/*
nullif() 함수
     두 표현식을 비교 같으면 null, 다르면 expr1을 반환합니다.
     그러나 expr1에 대해 리터럴 null을 지정할 수 없습니다.
*/

select first_name, length(first_name) "expr1",
    last_name, length(last_name) "expr2",
    nullif(length(first_name), length(last_name)) result
from employees;

--coalesce() 함수
	리스트에서 null이 아닌 첫번째 표현식을 반환합니다.

select last_name, employee_id, 
	coalesce(to_char(commision_pct), to_char(manager_id), 'no commision and no manager')
from employees;


/*조건부 표현식
	sql에서 if-then-else 논리를 사용할 수 있습니다.
	-case 식
	-decode() 함수
*/
--case 식

select last_name, job_id, salary, 
	case job_id when 'IT_PROG' then 1.10*salary
		when 'ST_CLERK' then 1.15*salary
		when 'SA_REP' then 1.20*salary
	else salary end 'REVISED_SALARY'
from employees;








