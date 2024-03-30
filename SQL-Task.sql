SHOW DATABASES;

CREATE  DATABASE cis;

SHOW DATABASES;
USE cis;

CREATE TABLE department(id INT PRIMARY KEY NOT NULL,
						name VARCHAR(50));

SHOW TABLES;
DESC department;

INSERT INTO department(id, name)
				VALUES(1, 'HR'),
					  (2, 'Marketing'),
                      (3, 'Finance');
                      
SELECT * FROM department;

CREATE TABLE employee(
					  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                      name VARCHAR(50),
                      salary INT,
                      department_id INT,
                      FOREIGN KEY (department_id) REFERENCES department(id));
                      
Desc employee;

SHOW TABLES;

INSERT INTO employee(id, name, salary, department_id)
			VALUES(1, 'John Smith',60000,1),
(2, 'Jane Doe',70000,2),
(3, 'Bob Johnson',55000, 1),
(4, 'Mary White',75000,3),
(5, 'Mark Lee', 80000, 2),
(6, 'Emily Brown', 60000, 3),
(7, 'David Chen', 90000, 1),
(8, 'Sarah Wang', 65000,2),
(9, 'Michael Kim', 70000, 3),
(10, 'Linda Davis', 75000, 1),
(11, 'Kevin Lee', 85000, 2),
(12, 'Angela Wu', 60000, 3),
(13, 'Brian Hall', 70000, 1),
(14, 'Jessica Tan', 80000, 2),
(15, 'Alex Chen', 60000, 3),
(16, 'Grace Wang', 75000, 1),
(17, 'Peter Kim', 90000, 2),
(18, 'Fiona Liu', 65000,3),
(19, 'Jason Li', 70000,1),
(20,'Megan Wong',80000,2),
(21,'Tony Chen',60000,3),
(22,'Cindy Wu',75000,1),
(23,'Tom Wang',90000,2),
(24,'Wendy Lin',65000,3),
(25,'Richard Kim',70000,1),
(26,'Alice Zhang',80000,2),
(27,'Daniel Chen',60000,3),
(28,'Lily Wang',75000,1),
(29,'James Kim',90000,2),
(30,'Nicole Wu',65000,3),
(31,'Eric Tan',70000,1),
(32,'Sophia Lee',80000,2),
(33,'Gary Zhang',60000,3),
(34,'Olivia Wu',75000,1),
(35,'Patrick Li',90000,2),
(36,'Emma Chen',65000,3),
(37,'Ryan Kim',70000,1),
(38,'Ava Wang',80000,2),
(39,'Ethan Chen',60000,3),
(40,'Zoe Lee',75000,1),
(41,'Jackson Wu',90000,2),
(42,'Lily Wang',65000,3),
(43,'Brian Kim',70000,1),
(44,'Ella Chen',80000,2),
(45,'Dylan Li',60000,3),
(46,'Chloe Tan',75000,1),
(47,'Oliver Lee',90000,2),
(48,'Grace Zhang',65000,3),
(49,'Justin Wu',70000,1),
(50,'Mia Wang',80000,2);

SELECT * FROM employee;

SELECT department_id, MAX(salary) FROM employee GROUP BY 1;

SELECT * FROM employee
INNER JOIN department
ON department.id = employee.department_id;

CREATE TABLE max_table AS
SELECT department.id, department.name, MAX(salary) AS max_salary FROM employee
INNER JOIN department
ON department.id = employee.department_id
GROUP BY 1;



SELECT * FROM max_table;

SELECT department_id, employee.name,  salary FROM employee
INNER JOIN max_table ON max_table.max_salary = employee.salary AND max_table.id = employee.department_id
ORDER BY 1,3;