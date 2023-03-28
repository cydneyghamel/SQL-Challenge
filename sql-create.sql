DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

COPY titles FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/titles.csv'
WITH (FORMAT 'csv', HEADER TRUE);

COPY employees FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/employees.csv'
WITH (FORMAT 'csv', HEADER TRUE);

COPY departments FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/departments.csv'
WITH (FORMAT 'csv', HEADER TRUE);

COPY dept_manager FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/dept_manager.csv'
WITH (FORMAT 'csv', HEADER TRUE);

COPY dept_emp FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/dept_emp.csv'
WITH (FORMAT 'csv', HEADER TRUE);

COPY salaries FROM '/Users/cydneyhamel/Projects/SQL-Challenge/data/salaries.csv'
WITH (FORMAT 'csv', HEADER TRUE);
