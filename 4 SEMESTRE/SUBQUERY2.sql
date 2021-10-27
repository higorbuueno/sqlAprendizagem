select FIRST_NAME, LAST_NAME FROM employees
WHERE MANAGER_ID in (
select EMPLOYEE_ID FROM employees WHERE DEPARTMENT_ID
in (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID
IN (SELECT LOCATION_ID FROM locations where COUNTRY_ID = 'US')));


select * from employees;
select FIRST_NAME, LAST_NAME from employees
where EMPLOYEE_ID in
(select MANAGER_ID from employees);



select AVG(SALARY) from employees;
select FIRST_NAME, LAST_NAME from employees where SALARY > (select AVG(SALARY) from employees);