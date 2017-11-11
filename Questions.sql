#Section I. Create Database and Tables

#Create a database called JS09_MessagesBy_YOURNAME
#CREATE DATABASE JS09_MessagesBy_YOURNAME;
#USE JS09_MessagesBy_YOURNAME;

#Table Users
#CREATE TABLE Users(
	#User_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    #Username VARCHAR(50) NOT NULL,
    #Password CHAR(41) NOT NULL
    #);


#Section II. Basic Operations.

#Table Messages
#CREATE TABLE Messages(
	#Message_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    #User_Id INT,
    #FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
    #Content TEXT NOT NULL,
	#Created_At TIMESTAMP DEFAULT NOW()
    #);


#Insert two users: User 1. Username: tapeface Password: tapeface.
#User 2: Username: butterface Password: butterface.

#INSERT INTO Users (Username, Password)
#VALUES ('tapeface', PASSWORD('tapeface'));

#INSERT INTO Users (Username, Password)
#VALUES ('butterface', PASSWORD('butterface'));


#Save Messages

#INSERT INTO Messages (User_Id, Content, Created_At)
#VALUES (1, 'How is it going my friend!?', 20170910234512);

#INSERT INTO Messages (User_Id, Content, Created_At)
#VALUES (1, 'Are u there?', 20170910235525);

#INSERT INTO Messages (User_Id, Content, Created_At)
#VALUES (2, 'I’m here! Really cool. How about you man? Tell me something.', 20170911002033);


Section III. Get information

#Write a query to get the department name (Departments.DEPARTMENT_NAME) and number of employees (COUNT) in each department.

SELECT
	D.DEPARTMENT_NAME,
    COUNT(*) AS CountEmployees
    FROM Departments D
INNER JOIN Employees E
ON D.DEPARTMENT_Id = E.DEPARTMENT_Id  GROUP BY E.DEPARTMENT_ID;

#Write a query to display the department name (Departments.DEPARTMENT_NAME), manager name (Employees.FIRST_NAME), and city (Locations.CITY).

SELECT
	E.EMPLOYEE_ID,
    J.JOB_TITLE,
    DATEDIFF(END_DATE, START_DATE)
FROM Employees E
INNER JOIN Jobs J
	ON E.JOB_ID = J.JOB_ID
INNER JOIN JobHistory JH
	ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
WHERE JH.DEPARTMENT_ID = 90;

#Write a query to display the department name (Departments.DEPARTMENT_NAME), manager name (Employees.FIRST_NAME), and city (Locations.CITY).

SELECT
	D.DEPARTMENT_NAME,
    E.FIRST_NAME,
    L.CITY
from Departments D
INNER JOIN Employees E
ON D.MANAGER_ID = E.MANAGER_ID
INNER JOIN Locations L
ON D.LOCATION_ID = L.LOCATION_ID;

#Write a query to display the job title (Jobs.JOBS_TITLE) and average salary (Employees.SALARY) of employees.

SELECT
	J.JOB_TITLE,
    AVG(SALARY) AS Average
FROM Jobs J
INNER JOIN Employees E
ON J.JOB_ID = E.JOB_ID GROUP BY E.JOB_ID;

#Write a query to display the job history (JobsHistory) that were done by any employee (Employees) who is currently earning more than 10000 of salary (Employees.SALARY).

SELECT * FROM JobHistory
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM Employees WHERE SALARY > 10000);
