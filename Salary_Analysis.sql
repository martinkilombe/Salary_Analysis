SELECT * FROM data_scientist_salary.data_scientist_salaries;
#1. Droping the "my unkowncolumn" that came imported with the csv file -- insignificant row
ALTER TABLE data_scientist_salary.data_scientist_salaries
DROP COLUMN MyUnknownColumn;

#2. Adding an ID column that is going to serve as the primary key for the table .ID column will be generated from the job title column
ALTER TABLE data_scientist_salary.data_scientist_salaries
ADD COLUMN ID VARCHAR(32) ;
#Creating a hash(md5) that is goint to be used as the primary key
UPDATE data_scientist_salary.data_scientist_salaries
SET ID = MD5(job_title)
WHERE ID IS NULL;
#Setting the ID as the primary key
ALTER TABLE data_scientist_salary.data_scientist_salaries
ADD PRIMARY KEY (ID);

#3. Basic Analysis
#-Arranging the salaries based on job_titles
SELECT ID,job_title, salary_in_usd FROM data_scientist_salary.data_scientist_salaries
ORDER BY job_title;
#-Getting the average for each job category from the job_titles
SELECT job_title , AVG(salary_in_usd) as average_salary FROM data_scientist_salary.data_scientist_salaries
GROUP BY job_title
ORDER BY average_salary;

#Counting the different types of proffession in each job_title
SELECT job_title , COUNT(job_title) AS number_categories FROM data_scientist_salary.data_scientist_salaries
GROUP BY job_title
ORDER BY number_categories;
