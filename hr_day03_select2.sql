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
where management_id in (100, 101, 201);

    
    