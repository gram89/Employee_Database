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
drop table retirement_info;

-- new retirement info table
select emp_no,first_name,last_name
into retirement_info
from employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and
(hire_date between '1985-01-01' and '1988-12-31');

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement info and dept_emp tables and adding a filter
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
ON ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

-- employee count by department number
select count(ce.emp_no), de.dept_no
into dept_count_retirement
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

--creating the additional lists
select * from salaries
order by to_date DESC;

-- pulling data
select e.emp_no, e.first_name, e.last_name, e.gender,
s.salary,de.to_date
into emp_info
from employees as e 
inner join salaries as s
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no=de.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
and (e.hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

--list of managers per department
select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join current_emp as ce
		on (dm.emp_no = ce.emp_no);
		
-- adding departments to the current emp table

select ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
into dept_info
from current_emp as ce
inner join dept_emp as de
on (ce.emp_no = de.emp_no)
inner join departments d
on (de.dept_no = d.dept_no);


--new sales request
select * from dept_info;
select emp_no,
first_name,
last_name,
dept_name
into sales_info
from dept_info
where dept_name = 'Sales';

--sales plus develeopment
select emp_no,
first_name,
last_name,
dept_name
into sales_dev_info
from dept_info
where dept_name in ('Sales', 'Development');



