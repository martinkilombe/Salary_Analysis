SELECT * FROM data_scientist_salary.data_scientist_salaries;
#Droping the "my unkowncolumn" that came imported with the csv file.
ALTER TABLE data_scientist_salary.data_scientist_salaries
DROP COLUMN MyUnknownColumn;

#Adding an id column that is going to serve as the primary key for the table .ID column will be generated from the job title column
