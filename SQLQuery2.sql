use payroll_service;

----------UC2------------
CREATE TABLE employee_payroll (
EMPID int NOT NULL identity(1,1) primary key,
EMPName varchar(200) NOT NULL,
EMPSalary float not null,
StartDate date not null
);
select * from employee_payroll;

---------UC3--------------
insert into  employee_payroll VALUES ('VISHAL',60000,'2016-09-18');
insert into  employee_payroll VALUES ('OMPRAKASH',65000,'2017-08-17');
insert into  employee_payroll VALUES ('HIMANSHU',70000,'2015-06-20');
insert into  employee_payroll VALUES ('EKTA',68000,'2016-05-18');

 --------UC4--------------
select * from employee_payroll;

 --------UC5--------------
 select EMPSalary from employee_payroll where EmpName='HIMANSHU';

 select * from employee_payroll where StartDate between cast('2016-01-01' as date) and cast(getdate() as date);

 --------UC6--------------
 ALTER TABLE employee_payroll ADD Gender CHAR(1);

 UPDATE employee_payroll SET Gender = 'M' WHERE EMPName='VISHAL' or EMPName= 'OMPRAKASH' or EMPName='HIMANSHU' ;

UPDATE employee_payroll SET Gender = 'F' WHERE EMPName='EKTA';

----------------UC7------------
------------Finding SUM,AVG,MIN,MAX,COUNT----------

SELECT SUM(EMPSalary) as SumOfEMPSalary FROM employee_payroll;
SELECT SUM(EMPSalary) as SumOfEMPSalary FROM employee_payroll WHERE Gender='M' GROUP BY Gender;
SELECT SUM(EMPSalary) as SumOfEMPSalary FROM employee_payroll WHERE Gender='F' GROUP BY Gender;

SELECT AVG(EMPSalary) as Average FROM employee_payroll WHERE Gender='M' GROUP BY Gender;

SELECT MIN(EMPSalary) as Minimum FROM employee_payroll WHERE Gender='M' GROUP BY Gender;

SELECT MAX(EMPSalary) as Maximum FROM employee_payroll;

SELECT COUNT(EMPID) as Number_of_Emp FROM employee_payroll WHERE Gender='M' GROUP BY Gender;

------------UC8---------------
-----Extending employee_payroll table-----------

ALTER TABLE employee_payroll ADD Phone_Number varchar(10);

------Adding column with DEFAULT value-----
ALTER TABLE employee_payroll ADD Emp_Address varchar(20) DEFAULT 'INDIA';

ALTER TABLE employee_payroll ADD Emp_DEPT varchar(10)DEFAULT 'HR';

INSERT INTO employee_payroll VALUES('ANKITA','75000','2019-04-23','F','MUMBAI','IT','9167650926');
INSERT INTO employee_payroll VALUES('ABHISHEK','66000','2019-03-23','M',DEFAULT,DEFAULT,'9930315160');
Select * from employee_payroll;

-----------------UC9----------------
------Extending employee_payroll table-------

ALTER TABLE employee_payroll ADD Basic_Pay varchar(10), Deduction FLOAT(20), Taxable_Pay FLOAT(20), Income_Tax Float(20), Net_Pay float(20);