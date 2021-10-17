# Employee_Database_Challenge_Analysis
## Overview of the analysis
### Resources
1. Data files
  - employees.csv
  - dept_emp.csv
  - departments.csv
  - dept_manager.csv
  - titles.csv
  - salaries.csv
2. Software: pgAdmin 14, postgreSQL
### Purpose of the project
Pewlett Hackard is being hit with a silver tsunami and the company is upgrading from using excel sheets to manage their employees to a Relational Database.  
The project is to analyse and provide insight to management about the current status of the workforce across the following parameters
- How many employees are close to retirement?
  - Looking at employees who were born between 1952 and 1955
- Which positions will need to be filled in the near future?
  - Split by department
  - Split by job title

## Results
### Deliverable 1: Employees split by title
As part of the initial analysis the key question is **What job titles need to be filled in the near future?**  
To answer this question, we looked at the employees table and the titles table using a join and removed duplicates by using DISTINCT ON.  
From the result we can see that
- Most employees who are due for retirement are Senior Engineers
  - In general senior engineers do majority of the work and are also involved in training and mentoring junior engineers this has major implications for the future of the company  
 
![deliverable 1](deliverable1.png)

### Deliverable 2: Employees who can be mentored to take on these roles
As part of the second deliverable we looked at employees who were born in 1965 who are currently employed with the company and created a list which the teams can then use for mentorship eligibility.  
**Key finding: The number of employees who can be mentored are too few compared to the total employees leaving the company**  
Result below  
![deliverable 2](deliverable2.png)  
![deliverable 3](deliverable3.png)
