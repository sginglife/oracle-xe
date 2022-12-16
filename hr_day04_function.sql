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
next_day() - 지정된 날짜에 다음날 추가
last_day() - 월의 마지막날
round() - 날짜 반올림
trunc() - 날짜 버림
*/

select months_between('22-12-16', '21-12-16') from dual;
select add_months('22-12-16', 1) from dual;
select next_day('22-12-16', 6) from dual;
select last_day('22-12-16') from dual;
select round(sysdate, 'month') from dual;







