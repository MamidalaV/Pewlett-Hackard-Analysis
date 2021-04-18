# Pewlett-Hackard-Analysis

# PURPOSE:

## The purpose of this analysis is to query the employee database and identify 2 sets of employees:
    
   1.  The Number of Retiring Employees by Title.
    
   2.  The Employees Eligible for the Mentorship Program.

# RESULTS:

## Data within the employee database has been queried to identify the below:

#### Analysis #1 - Unique Titles. 'employees' table and 'title' table have been queried to filter the list of employees with birthdate between 1952 and 1955.
#### Query:
    SELECT e.emp_no,
        e.first_name, 
        e.last_name, 
        t.title, 
        t.from_date, 
        t.to_date
    INTO retiring_empl
    FROM employees e
    INNER JOIN titles t
      ON e.emp_no = t.emp_no
    WHERE birth_date between '1952-01-01' and '1955-12-31'
    ORDER BY e.emp_no
      
#### Followed by the below query to get distinct values:

    SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
    INTO unique_titles
    FROM retiring_empl
    ORDER BY emp_no, to_date DESC;
    
#### Output:
    
   ![image](https://user-images.githubusercontent.com/74985818/115130866-37e21500-9fc1-11eb-949e-76004428a3e7.png)


#### Followed by the below query to derive the count of each retiring title.
#### Query:
    SELECT count(title), title
    INTO retiring_titles
    FROM unique_titles
    GROUP BY title
    ORDER BY count(title) desc
    
#### Output:

   ![image](https://user-images.githubusercontent.com/74985818/115130973-20eff280-9fc2-11eb-93c0-a1f8c28a069e.png)

#### Analysis #2 - Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965
#### Query:
    SELECT DISTINCT ON (de.emp_no) de.emp_no,
        e.first_name, 
        e.last_name, 
        e.birth_date,
        de.from_date,
        de.to_date,
        t.title
        INTO mentorship_eligibilty
        FROM employees e
        LEFT JOIN dept_emp de
            ON e.emp_no = de.emp_no
        INNER JOIN titles t
            ON e.emp_no = t.emp_no
        WHERE de.to_date = '9999-01-01'
          and e.birth_date between '1965-01-01' and '1965-12-31'
        ORDER BY de.emp_no
    
#### Output:
   ![image](https://user-images.githubusercontent.com/74985818/115135538-3297c100-9fe7-11eb-801a-ca652ca39586.png)


### Result:
   1. Total employees with birth date between 1952 and 1955 are 133,776.
   2. Of which 90,398 employee IDs are unique.
   3. Of which, Senior Engineers are 29,414 (highest) and 28,254 Senior Staff (second highest).
   4. Of these, employees who are active and eligibile for Mentorship are 1,549.


# SUMMARY:
   1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
      - 90,398 roles are in urgent need to be filled out as soon as the workforce starts retiring at any given time.
   3. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 
      - No, we have 1,940 employees who are eligible to participate in a mentorship program.
