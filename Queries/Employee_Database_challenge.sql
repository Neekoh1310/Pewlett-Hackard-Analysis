-- Begin Challenge

Drop table retirement_titles;

SELECT e.emp_no,
    e.first_name,
    e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (t.to_date = '9999-01-01');

Select * from retirement_titles;

Drop table unique_titles;

SELECT Distinct ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
From retirement_titles
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC
;

Select * from unique_titles

-- Employee count from unique titles to retrieve number of employees by their most recent job who are about to retire
SELECT count(u.title), rt.title
FROM unique_titles as u
Inner join  retirement_titles as rt
ON u.title=rt.title
Group by rt.title
Order by rt.title DESC;

select * from retiring_titles;