--UC1
Create DataBase payRoll_service;
Use payRoll_service;

--UC2
Create table employee_payroll
(
id int primary key identity(1,1),
Name Varchar(30),
Salary Bigint,
StartDate Date
);

--UC3
insert into employee_payroll(Name,Salary,StartDate) values('Vaibhav',40000,'2020-05-4');
insert into employee_payroll(Name,Salary,StartDate) values('Raman',10000,'2020-05-10');
insert into employee_payroll(Name,Salary,StartDate) values('Shantanu',30000,'2020-05-25');
insert into employee_payroll(Name,Salary,StartDate) values('Rahul',25000,'2021-06-17');
insert into employee_payroll(Name,Salary,StartDate) values('Arjun',20000,'2020-08-2');
insert into employee_payroll(Name,Salary,StartDate) values('Riya',40000,'2020-06-4');


--UC4
Select*from employee_payroll;

--UC5
Select*from employee_payroll where StartDate between cast('2020-05-10' as Date) and CURRENT_TIMESTAMP;

--UC6
Alter table employee_payroll Add Gender varchar(1);

update employee_payroll set Gender = 'M' where Name='Vaibhav';
update employee_payroll set Gender = 'M' where Name='Raman';
update employee_payroll set Gender = 'M' where Name='Shantanu';
update employee_payroll set Gender = 'M' where Name='Rahul';
update employee_payroll set Gender = 'M' where Name='Arjun';
update employee_payroll set Gender = 'F' where Name='Riya';

--UC7
Select SUM(Salary) from employee_payroll where Gender = 'M' group by Gender;

Select Gender,Avg(Salary) from employee_payroll group by Gender;

Select MIN(Salary) from employee_payroll where Gender='M';

Select MAX(Salary) from employee_payroll where Gender='M';

Select COUNT(*) from employee_payroll group by Gender;

--UC8
Alter table employee_payroll Add Phone Varchar(10), Address Varchar(100), Department Varchar(20);

update employee_payroll set Phone = '9340596362', Address = 'Indore', Department = 'Lead' where Name='Vaibhav';
update employee_payroll set Phone = '9978485654', Address = 'Delhi', Department = 'Engineer' where Name='Raman';
update employee_payroll set Phone = '7474859497', Address = 'Gujrat', Department = 'Co-ordinator' where Name='Shantanu';
update employee_payroll set Phone = '8989474595', Address = 'Kolkata', Department = 'Analyst' where Name='Rahul';
update employee_payroll set Phone = '9475749613', Address = 'Mumbai', Department = 'Developer' where Name='Arjun';
update employee_payroll set Phone = '9494764815', Address = 'Indore', Department = 'Lead' where Name='Riya';

--UC9
Alter table employee_payroll Add BasicPay Bigint, TaxablePay Bigint, IncomeTax Bigint, NetPay Bigint;

Alter table employee_payroll Drop column Decuctions;
ALter table employee_payroll Add Deductions Bigint;

update employee_payroll set BasicPay = 700000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Vaibhav';
update employee_payroll set BasicPay = 400000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Raman';
update employee_payroll set BasicPay = 600000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Shantanu';
update employee_payroll set BasicPay = 400000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Rahul';
update employee_payroll set BasicPay = 400000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Rahul';
update employee_payroll set BasicPay = 350000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Arjun';
update employee_payroll set BasicPay = 650000, Deductions = 0, TaxablePay = 0, IncomeTax = 0, NetPay = 0 where Name='Riya';

--UC10
insert into employee_payroll(Name,Salary,StartDate, Gender, Phone, Address, Department, BasicPay, TaxablePay, IncomeTax, NetPay, Deductions) values('Terissa',40000,'2020-06-4','F', '7845968427', 'Florida', 'Manager', 2000000, 0, 0, 0, 0);

insert into employee_payroll(Name,Salary,StartDate, Gender, Phone, Address, Department, BasicPay, TaxablePay, IncomeTax, NetPay, Deductions) values('Terissa',40000,'2020-06-4','F', '7845968427', 'Florida', 'Marketing', 2000000, 0, 0, 0, 0);

--UC10 - Refactor
Alter table employee_payroll drop column Department;

Create table Department
(
ID int primary key identity(1,1),
DepartmentName Varchar(20),
EmployeeID int foreign key references employee_payroll(id)
);

select*from Department

insert into Department(DepartmentName, EmployeeID) values('Sales',1);
insert into Department(DepartmentName, EmployeeID) values('Marketing',1);
