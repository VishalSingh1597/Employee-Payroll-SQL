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

----------UC10-----------------
UPDATE employee_payroll SET Phone_Number='9178933440',Emp_DEPT=DEFAULT;
UPDATE employee_payroll SET Emp_Address = 'Mumbai', Emp_DEPT='Developer', Phone_Number='9874778679', Basic_Pay=12000,Deduction=5000,Taxable_Pay=2300,Income_Tax = 2564,Net_Pay=18000 WHERE EMPName='VISHAL';
UPDATE employee_payroll SET Emp_Address = 'Mysore', Emp_DEPT='Developer', Phone_Number='9475175570', Basic_Pay=12000,Deduction=5000,Taxable_Pay=2300,Income_Tax = 2564,Net_Pay=10000 WHERE EMPName='OMPRAKASH';
UPDATE employee_payroll SET Emp_Address = 'Mangalore', Emp_DEPT='PL', Phone_Number='9874227670', Basic_Pay=22000,Deduction=16000,Taxable_Pay=5300,Income_Tax = 5564,Net_Pay=22000 WHERE EMPName='HIMANSHU';
UPDATE employee_payroll SET Emp_Address = 'Mumbai', Emp_DEPT='Accountant', Phone_Number='9874834556', Basic_Pay=13000,Deduction=5450,Taxable_Pay=2500,Income_Tax = 2564,Net_Pay=10000 WHERE EMPName='EKTA';
UPDATE employee_payroll SET Emp_Address = 'Noida', Emp_DEPT='HR', Phone_Number='9930315660', Basic_Pay=14000,Deduction=5660,Taxable_Pay=2700,Income_Tax = 3564,Net_Pay=11000 WHERE EMPName='ANKITA';
UPDATE employee_payroll SET Emp_Address = DEFAULT, Emp_DEPT='Engineer', Phone_Number='9167690926', Basic_Pay=16000,Deduction=5660,Taxable_Pay=2800,Income_Tax = 5564,Net_Pay=14000 WHERE EMPName='ABHISHEK';

----------------------
INSERT INTO employee_payroll VALUES('Terissa','48548','2020-01-20','F','Kashmir','8758989541','Sales','54767',4875,4555,54767,376734);
INSERT INTO employee_payroll VALUES('Terissa','48548','2020-12-12','F','Kashmir','8758989345','Marketing','54767',4875,4555,54767,376734);

select * from employee_payroll where EMPName='Terissa';