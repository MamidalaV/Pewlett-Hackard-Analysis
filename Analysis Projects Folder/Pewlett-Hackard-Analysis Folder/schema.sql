--Creating tables for PH-EmployeeDB
Create table departments(dept_no varchar(4) NOT NULL,
						dept_name varchar(40) NOT NULL,
						primary key (dept_no),
						unique (dept_name)
						);
						
create table employees(emp_no int NOT NULL,
                        birth_date date NOT NULL,
                        first_name varchar NOT NULL,
                        last_name varchar NOT NULL,
                        gender varchar NOT NULL,
                        hire_date date NOT NULL,
                        PRIMARY KEY(emp_no));
					  
Create table dept_manager(dept_no varchar(4) NOT NULL,
						  emp_no INT NOT NULL,
						  from_date DATE NOT NULL,
						  to_date DATE NOT NULL,
					  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
					  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
						  PRIMARY KEY (emp_no, dept_no));
						  
CREATE TABLE salaries (emp_no INT NOT NULL,
                        salary INT NOT NULL,
                        from_date DATE NOT NULL,
                        to_date DATE NOT NULL,
                        FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
                        PRIMARY KEY (emp_no)
);

