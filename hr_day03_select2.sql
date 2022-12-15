/*
������ ����Ͽ� �� ����
    where���� ����Ͽ� ��ȯ�Ǵ� ���� �����մϴ�.
    
where
    ������ �����ϴ� ������ query�� �����մϴ�.
    
    ������ ���:
        -�� �̸�
        -�� ����
        -�� �̸�, ��� �Ǵ� �� ����Ʈ
*/

--where�� ���
/*select employees_id, last_name, job_id, department_id
from employees
where department_id = 90;*/

/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥ ���� ���� ����ǥ�� �����ϴ�.
    ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ �����մϴ�.
    �⺻ ��¥ ǥ�� ������ dd-mon-rr �Դϴ�.
*/


select last_name, job_id, department_id
from employees
where last_name = 'Whalen';

select last_name, hire_date
from employees;



/*
�� ������
    Ư�� ǥ������ �ٸ� ���̳� ǥ���İ� ���ϴ� ���ǿ��� ���˴ϴ�.
    
    =  ����
    >  ���� ŭ
    >= ũ�ų� ����
    <  ���� ����
    <= ���� �۰ų� ����
    <> ���� ����
    between ... and ...     �� �� ����(��谪 ����)
    in(set)                 �� ����Ʈ �� ��ġ�ϴ� �� �˻�
    like                    ��ġ�ϴ� ���� ���� �˻�
    is null                 null������ ����
    
*/

--�� ������ ���
select last_name, salary
from employees
where salary <= 3000;

--between �����ڸ� ����ϴ� ���� ����
select last_name, salary
from employees
where salary between 2500 and 3500;

--in �����ڸ� ����ϴ� ��������
select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);

/*
like �����ڸ� ����Ͽ� ���� ��ġ
    like �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� �����մϴ�.
    �˻����ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ֽ��ϴ�.
    -%�� 0�� �̻��� ���ڸ� ��Ÿ���ϴ�.
    -_�� ���ڸ� ��Ÿ���ϴ�.
*/

select first_name
from employees
where first_name like '%a%';

--��ü ���� ����
select last_name
from employees
where last_name like '_o%';

--escape �ĺ���
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\';

/*
null ���� ���
    is null �����ڷ� null�� �׽�Ʈ�մϴ�.
*/
select last_name, manager_id
from employees
where manager_id is null;

/*
�� �����ڸ� ����Ͽ� ��������
    and : ���� ��� ���� ��� ���� ��� TRUE ��ȯ
    or  : ���� ��� ���� �� �ϳ��� ���� ��� TRUE ��ȯ
    not : ������ ������ ��� TRUE�� ��ȯ
*/

--and ������ ���
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 and job_id like '%MAN%';

--or ������ ���
select employee_id, last_name, job_id, salary
from employees
where salary >= 1000 or job_id like '%MAN%';

--not ������ ���
select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_MAN');

/*
order by ��
    order by ���� ����Ͽ� �˻��� ���� �����մϴ�.
    - asc  : ��������, �⺻��
    - desc : ��������
    select���� �� �������� ���ϴ�
*/
select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

--�������� ����
select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

--�� alias �������� ����
select employee_id, last_name, salary*12 annsal
from employees
order by annsal;

--�� ���� ��ġ�� ����Ͽ� ����
select last_name, job_id, department_id, hire_date
from employees
order by 3;

--���� �� �������� ����
select last_name, job_id, department_id, hire_date
from employees
order by department_id, salary desc;
    
    