

/*���� ������
���̳� ���ڿ��� �ٸ� ���� �����մϴ�.
�� ���� ���μ�(||)���� ��Ÿ���ϴ�.
*/
select last_name || job_id as "employees", last_name, job_id
from employees;

/*���ͷ� ���ڿ�
    ���ͷ��� select ���� ���Ե� ����, ����, �Ǵ� ��¥�Դϴ�.
    ��¥ �� ���� ���ͷ� ���� ���� ����ǥ�� ����� �մϴ�.
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �� �� ����մϴ�.
*/

select last_name || ' is a '|| job_id as "employee details"
from employees;

/*
��ü �ο� ������(q) ������
    �ڽ��� ����ǥ �����ڸ� �����մϴ�
    �����ڸ� ���Ƿ� �����մϴ�
    ������ �� ��뼺�� �����մϴ�
*/

select department_name || q'[department's manage id: ]' || manager_id
as "department and manager"
from departments;