select SALARY from employees where LAST_NAME = 'Bull';

select
FIRST_NAME,
LAST_NAME,
SALARY
from employees
where SALARY > (select SALARY from employees where LAST_NAME = 'Bull');

-- --------------------------------------------------------------------

select * from departments where DEPARTMENT_NAME = 'IT';

select FIRST_NAME, LAST_NAME, d.DEPARTMENT_NAME from employees as e
inner join departments as d where d.DEPARTMENT_NAME = 'IT';

select FIRST_NAME,
LAST_NAME,
SALARY
from employees
where DEPARTMENT_ID IN (select DEPARTMENT_ID from departments where DEPARTMENT_NAME = 'IT');
