show databases;
create database demo;
use demo;

-------Create two tables: EmployeeDetails and EmployeeSalary.-----------
---------Columns for EmployeeDetails: EmpId FullName ManagerId DateOfJoining City && Columns for EmployeeSalary: : EmpId Project Salary Variable.--------------
create table EmployeeDetails(EmpId int primary key not null auto_increment, FullName varchar(255), ManagerId int, DateOfJoining datetime, city varchar(100));
create table EmployeeSalary(EmpId int not null, Project varchar(100), Salary int,Variable int);
select * from EmployeeDetails;
select * from EmployeeSalary;
ALTER TABLE EmployeeDetails MODIFY COLUMN DateOfJoining date;
insert into EmployeeDetails(FullName,ManagerId,DateOfJoining,city)values('Manasi Kundu',01,'2020-09-01','Bhubaneswar');
insert into EmployeeDetails(FullName,ManagerId,DateOfJoining,city)values('Sagarika Sahoo',02,'2020-09-01','Bhubaneswar');
insert into EmployeeDetails(FullName,ManagerId,DateOfJoining,city)values('Bebikrishna Dash',02,'2021-09-01','Bhubaneswar');
insert into EmployeeSalary(EmpId,Project,Salary,Variable)values(1,'Ecosphere HRMS',30000,10000);


-------------SQL Query to fetch records that are present in one table but not in another table.-------------
select EmpId,FullName,ManagerId,DateOfJoining,city from EmployeeDetails where EmpId not in (select EmpId from EmployeeSalary);

-----------SQL query to fetch all the employees who are not working on any project.----------------
select EmpId,FullName,ManagerId,DateOfJoining,city from EmployeeDetails where EmpId  not in (select EmpId from EmployeeSalary where Project is not null);


--------------SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.--------------- 	
SELECT * FROM EmployeeDetails WHERE YEAR(DateOfJoining) = 2020;

---------------Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary----------------------
select * from EmployeeDetails where EmpId in(select EmpId from EmployeeSalary where Salary is not null);

------------Write an SQL query to fetch a project-wise count of employees.------------------
select Project,count(EmpId) from EmployeeSalary group by Project;

------------------------Fetch employee names and salaries even if the salary value is not present for the employee.----------------
select e.FullName,s.Salary from EmployeeDetails e inner join EmployeeSalary s where e.EmpId=s.EmpId ;

------------Write an SQL query to fetch all the Employees who are also managers.-------------------------
select * from EmployeeDetails where EmpId=ManagerId;


--------------Write an SQL query to fetch duplicate records from EmployeeDetails.------------------------
SELECT EmpId, COUNT(*) AS DuplicateEmployee FROM EmployeeDetails GROUP BY EmpId HAVING COUNT(*) > 1;

-------------------Write an SQL query to fetch only odd rows from the table.--------------------
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum FROM EmployeeDetails) AS Subquery WHERE RowNum % 2 = 1;

--------------Write a query to find the 3rd highest salary from a table without top or limit keyword.---------------
SELECT Salary FROM (SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum FROM EmployeeSalary) AS subquery WHERE RowNum = 3;


