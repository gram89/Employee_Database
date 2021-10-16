-- selecting all employees who are eligible for retirement
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
--born in 1953
select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';
--born in 1954
select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';
--born in 1955
select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';
--narrowing down by adding hire date
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and
(hire_date between '1985-01-01' and '1988-12-31');
--counts by adding hire date
SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and
(hire_date between '1985-01-01' and '1988-12-31');
--final code for retirement_info
SELECT first_name, last_name
into retirement_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and
(hire_date between '1985-01-01' and '1988-12-31');
