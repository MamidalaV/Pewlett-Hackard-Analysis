SELECT e.emp_no, 
        e.first_name, 
        e.last_name, 
        t.title, 
        t.from_date, 
        t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE birth_date between '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retiring_empl
ORDER BY emp_no, to_date DESC;

--Retrieve the number of employees by their most recent job title who are about to retire.
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) desc

--create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
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
