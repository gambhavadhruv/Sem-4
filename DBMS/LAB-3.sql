--1 => Find all persons with their department name & code.
SELECT
PERSON.PERSONNAME,
DEPARTMENT.DEPARTMENTNAME,
DEPARTMENT.DEPARTMENTCODE
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID

--2 => Give department wise maximum & minimum salary with department name.
SELECT 
MAX(PERSON.SALARY),MIN(PERSON.SALARY),DEPARTMENT.DEPARTMENTNAME
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME

--3 => Find all departments whose total salary is exceeding 100000.
SELECT
SUM(PERSON.SALARY),DEPARTMENT.DEPARTMENTNAME
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME
HAVING SUM(PERSON.SALARY)>100000

--4 => Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT
PERSON.PERSONNAME,PERSON.SALARY,DEPARTMENT.DEPARTMENTNAME
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
WHERE PERSON.CITY='JAMNAGAR'

--5 => Find all persons who does not belongs to any department.
SELECT
PERSON.PERSONNAME
FROM PERSON LEFT OUTER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
WHERE DEPARTMENT.DEPARTMENTNAME IS NULL

--6 =>  Find department wise person counts.
SELECT
DEPARTMENT.DEPARTMENTNAME,COUNT(DEPARTMENT.DEPARTMENTID)
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME

-- => 7. Find average salary of person who belongs to Ahmedabad city.
SELECT
AVG(PERSON.SALARY)
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
WHERE PERSON.CITY='JAMNAGAR'

-- => 8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In single column)
SELECT PERSON.PERSONNAME + ' EARNS' + CAST(PERSON.SALARY AS VARCHAR(20)) + ' FROM DEPARTMENT' + DEPARTMENT.DEPARTMENTNAME + ' MONTHLY'
FROM PERSON LEFT OUTER JOIN DEPARTMENT 
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID

-- => 9. List all departments who have no persons.
SELECT
DEPARTMENT.DEPARTMENTNAME
FROM PERSON FULL OUTER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME
HAVING COUNT(PERSON.PERSONNAME)=0

-- => 10. Find city & department wise total, average & maximum salaries.
SELECT
DEPARTMENT.DEPARTMENTNAME,
SUM(PERSON.SALARY) "TOTAL SALARY",
AVG(PERSON.SALARY) "AVERAGE SALARY",
MAX(PERSON.SALARY) "MAXIMUM SALARY"
FROM PERSON INNER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME

-- => 11. Display Unique city names.
SELECT DISTINCT CITY
FROM PERSON 

-- => 12. List out department names in which more than two persons.
SELECT
DEPARTMENT.DEPARTMENTNAME,COUNT(PERSON.PERSONNAME)
FROM PERSON RIGHT OUTER JOIN DEPARTMENT
ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
GROUP BY DEPARTMENT.DEPARTMENTNAME
HAVING COUNT(PERSON.PERSONNAME)>2

-- => 13. Combine person name�s first three characters with city name�s last three characters in single column.
SELECT LEFT(PERSONNAME,3) + RIGHT(CITY,3) FROM PERSON

-- => 14. Give 10% increment in Computer department employee�s salary.
UPDATE PERSON SET SALARY = SALARY+((SALARY*10)/100)
WHERE DEPARTMENTID=(SELECT DEPARTMENTID FROM DEPARTMENT WHERE DEPARTMENTNAME='COMPUTER')

-- => 15. Display all the person name�s who�s joining dates difference with current date is more than 365 days.
SELECT PERSONNAME FROM PERSON
WHERE DATEDIFF(DAY,JOININGDATE,GETDATE())>365