-- Challenge Code
--Deliverable 1
select e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_title
from employees as e
left join titles as ti
on e.emp_no=ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
order by e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC;

-- group by titles
select count(emp_no), title
into retirement_title_count
from unique_titles
group by title
order by count(emp_no) DESC;


-- Deliverable 2

select distinct on(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
into mentorship_eligibility
from employees as e
left join dept_emp as de
on e.emp_no=de.emp_no
left join titles as ti
on e.emp_no=ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and (de.to_date = ('9999-01-01'))
order by e.emp_no;