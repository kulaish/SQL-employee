create database employementtables;
use employementtables;
show databases;

-- creating a table
create table employementtables
(empno int,
ename varchar(50),
job varchar(15),
mgr int,
hiredate date,
salary int,
comm int,
deptno int);

-- inserting values into table
insert into employementtables
values(7369,'smith','clerk',7902,'1980-12-17',800,null,20);
insert into employementtables
values(7499,'Allen','salesman',7688,'1981-02-20',1600,300,30);
insert into employementtables
values(7521,'Ward','salesman',7698,'1981-02-22',1250,500,30);
insert into employementtables
values(7566,'Jones','Manager',7839,'1981-04-02',2975,null,20);
insert into employementtables
values(7654,'Martin','salesman',7688,'1981-09-22',1250,1400,30);
insert into employementtables
values(7698,'Blake','Manager',7839,'1981-05-01',2850,null,30);
insert into employementtables
values(7782,'Clark','Manager',7839,'1981-06-09',2450,null,10);
insert into employementtables
values(7788,'Scott','Analyst',7566,'1982-12-09',3000,null,20);
insert into employementtables
values(7839,'king','president',null,'1981-11-17',5000,null,10);
insert into employementtables
values(7844,'Turner','salesman',7698,'1981-09-08',1500,0,30);
insert into employementtables
values(7876,'Admas','clerk',7788,'1983-01-12',1100,null,20);
insert into employementtables
values(7900,'James','clerk',7698,'1981-12-03',950,null,30);
insert into employementtables
values(7902,'Ford','Analyst',7566,'1981-12-03',3000,null,20);
insert into employementtables
values(7934,'Miller','clerk',7782,'1982-01-23',1300,null,10);

select * from employementtables;

create table depttable
(deptno int,
deptname varchar(20),
location varchar(20)
);

insert into depttable
values(10,'accounting','new york');
insert into depttable
values(20,'research','dallas');
insert into depttable
values(
30,'sales','chicago');
insert into depttable
values(
40,'opeartions','boston');

select * from depttable;

-- 1.Display all the information of the EMP table
select * from employementtables;

-- 2.Display unique Jobs from EMP table
select distinct(job)
from employementtables;

-- 3.List the emps in the asc order of their Salaries
select *
from employementtables
order by salary asc;

-- 4.List the details of the emps in asc order of the Dptnos and desc of Jobs
select *
from employementtables
order by deptno asc ,job desc;

-- 5.Display all the unique job groups in the descending order
select distinct (job)
from employementtables
order by job desc;

-- 6.Display all the details of all ‘Mgrs’
select * 
from employementtables
where empno in (select mgr from employementtables);

-- 7.List the emps who joined before 1981
select *
from employementtables
where hiredate > '1981-01-01';

-- 8.List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select empno,ename,salary,salary/30,12*salary as annual_sal
from employementtables
order by annual_sal;


-- 9.Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select empno,ename,job,hiredate,mgr
from employementtables
where empno in (select mgr from employementtables);

-- 10.List the Empno, Ename, Sal, Exp of all emps working for Mgr 7688
select empno,ename,salary
from employementtables 
where mgr = 7688;

-- 11.Display all the details of the emps whose Comm. Is more than their Sal.
select *
from employementtables
where comm>salary;

-- 12.List the emps in the asc order of Designations of those joined after the second half of 1981.
select * 
from employementtables 
where month(hiredate)=6
order by job asc;

-- 13.List the emps along with their Exp and Daily Sal is more than Rs.200.
select *
from employementtables
where salary/12>200;

-- 14.List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * 
from employementtables
where job='clerk' or job='analyst'
order by job desc;

-- 15.List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
select *
from employementtables
where hiredate in('1981-05-01','1981-12-03','1981-09-22','1982-01-23')
order by hiredate;

-- 16.List the emp who are working for the Deptno 10 or20.
select * 
from employementtables
where deptno=10 or deptno=20;

-- 17.List the emps who are joined in the year 81.
select *
from employementtables
where hiredate between '1981-01-01' and '1981-12-01';

-- 18.List the emps who are joined in the month of feb 1980.
select * 
from employementtables
where hiredate between '1980-02-01' and '1980-02-29';

-- 19.List the emps Who Annual sal ranging from 22000 and 45000
select * 
from employementtables
where 12*salary between 22000 and 45000;

-- 20.List the Enames those are having five characters in their Names
select * 
from employementtables
where length(ename)=5;

-- 21.List the Enames those are starting with ‘S’ and with five characters.
select *
from employementtables
where ename like 's%' and length(ename)=5;

-- 22.List the emps those are having four chars and third character must be ‘r’.
select *
from employementtables
where ename like '__r%' and length(ename)=4;

-- 23.List the Five character names starting with ‘S’ and ending with ‘H’.
select * 
from employementtables
where length(ename)=5 and ename like 's%h';

-- 24.List the emps who joined in January.
select *
from employementtables
where month(hiredate)=1;

-- 25.List the emps who joined in the month of which second character is ‘a’.
select *
from employementtables
where month(hiredate) like '_a%';

-- 26.List the emps whose Sal is four digit number ending with Zero.
select *
from employementtables
where salary like '%0' and length(ename)=4;

-- 27.List the emps whose names having a character set ‘ll’ together.
select *
from employementtables
where ename like '%ll%';

-- 28.List the emps those who joined in 80’s.
select *
from employementtables
where year(hiredate) like '__8%';

-- 29.List the emps who does not belong to Deptno 20.
select *
from employementtables
where deptno <>20;

-- 30.List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
select empno,ename,salary,job
from employementtables
where job not in ('president','manager')
order by salary;

select * from employementtables;

-- 31.List all the emps who joined before or after 1981.
select *
from employementtables
where year(hiredate) not in ('1980');

-- 32.List the emps whose Empno not starting with digit78.
select *
from employementtables
where empno not like '78%';

-- 33.List the emps who are working under ‘MGR’.
select *
from employementtables 
where job='manager';

-- 34.List the emps who joined in any year but not belongs to the month of March.
select * 
from employementtables
where month(hiredate)<>3;

-- 35.List all the Clerks of Deptno 20.
select *
from employementtables
where job='clerk' and deptno=20;

-- 36.List the emps of Deptno 30 or 10 joined in the year 1981.
select *
from employementtables
where (deptno=30 or deptno=10) and year(hiredate)='1981';

-- 37.Display the details of SMITH.
select *
from employementtables
where ename='smith';

-- 38.Display the location of SMITH.
select e.empno,e.ename,
d.location
from employementtables e
join depttable d
on e.deptno=d.deptno
where e.ename='smith';

-- 39.List the total information of EMP table along with DNAME and Loc of all the 
-- emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the ascDeptno.
select e.deptno,e.empno,e.ename,e.salary,e.job,e.hiredate,
d.deptname,d.location
from employementtables e
left join depttable d
on e.deptno=d.deptno
where d.deptname in ('accounting','research')
order by e.deptno;

-- 40.List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’
-- working in New York, Dallas with an exp more than 7 years without receiving
--  the Comm asc order of Loc.
select e.deptno,e.empno,e.ename,e.salary,e.job,e.hiredate,
d.deptname,d.location
from employementtables e
join depttable d
on e.deptno=d.deptno
where e.job in ('manager','analyst') and d.location in('new york','dallas') 
and e.comm is null
order by d.location;
select * from employementtables;

-- 41.Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps
-- working at CJICAGO or working for ACCOUNTING dept with Ann
-- Sal>2800, but the Sal should not be=3000 or 2800 who doesn’t belongs to the
-- Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of
-- Deptno and desc order of job.
select e.ename,e.empno,e.salary,e.deptno,e.job,
d.location,d.deptname
from employementtables e
join depttable d
on e.deptno=d.deptno 
where location='chicago' and  deptname ='accounting'
in
(select  e.empno 
from employementtables e
where salary not in (2800,3000) and e.salary>2800 and  deptname ='accounting'
and e.Mgr not IN (SELECT Empno FROM employementtables where empno like '__7%' or empno like '__8')
order by e.deptno,e.job desc);

 -- 42.Display the total information of the emps along with Grades in the asc
-- order
select *,
case 
when salary > 2500 then ' high grade'
when salary >1200 and salary <=2500 then 'medium grade'
else 'low grade'
end as salarygrade
from employementtables;

-- 43.List the Empno, Ename, Sal, Dname, and Ann Sal of emps
-- working for Dept10 or20.
select e.empno,e.ename,e.salary,d.deptname,(e.salary/12) as annsal,d.deptno
from employementtables e
join depttable d on e.deptno=d.deptno
where d.deptno in (10,20);

-- 44.List all the information of emp with Loc and the Grade of all the emps
-- belong to the Grade range from 2 to 4 working at the Dept those are not starting
-- with char set ‘OP’ and not ending with ‘S’ with the designation having a char ‘a’
-- any where joined in the year 1981 but not in the month of Mar or Sep and Sal
-- not end with ‘00’ in the asc order of Grades
select e.empno,e.ename,e.salary,e.hiredate,
d.deptname,d.location
from employementtables e
join depttable d
on e.deptno=d.deptno
where deptname not like 'op%' and deptname not like '%s' and job like '%a%' and
year(hiredate) =1981 and month(hiredate) not in (3,9) and salary not like '%00';

-- 45.List the details of the Depts along with Empno, Ename or without the emps
select e.ename,e.empno,
d.deptname,d.deptno
from depttable d
right join employementtables e
on e.deptno=d.deptno;

-- 46.List the details of the emps whose Salaries more than the employee BLAKE.
select empno,ename,salary
from employementtables
where salary>(select salary from employementtables where ename='Blake');

-- 47.List the emps whose Jobs are same as ALLEN
select *
from employementtables
where job = (select job from employementtables where ename='allen');

-- 48.List the emps who are senior to King.
select empno,ename
from employementtables
where hiredate > (select hiredate from employementtables where ename='king');

-- 49.List the Emps who are senior to their own MGRS
select *
from employementtables w,
employementtables m where w.empno= m.mgr and
w.hiredate> m.hiredate;


-- 50.List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select * from employementtables e ,depttable d 
where d.deptno = 20 and e.deptno = d.deptno and
e.job in ( select e.job from employementtables e,depttable d 
                where e.deptno = d.deptno and d.deptno=10);
    -- or
select *
from employementtables e
join depttable m
on e.deptno=m.deptno
where e.deptno= '20' and e.job in (select e.job from employementtables e where e.deptno='10'); 

-- 51.List the Emps whose Sal is same as FORD or SMITH in desc order of Sal
select *
from employementtables
where salary in (select salary from employementtables where (ename='ford' or ename='smith'))
order by salary desc;

-- 52.List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select ename,empno,job
from employementtables
where job = (select job from employementtables where ename='miller')
or salary > (select salary from employementtables where ename='allen');

-- 53.List the Emps whose Sal is > the total remuneration of the SALESMAN.
select empno,ename,salary
from employementtables
where salary>(select sum(salary) from employementtables where job='salesman');

-- 54.ist the emps who are senior to BLAKE working at CHICAGO & BOSTON.
select *
from employementtables e
inner join depttable d on e.deptno=d.deptno
where d.location in ('boston','chicago')  and
e.hiredate<(select e.hiredate from employementtables where e.ename='blake');

select * from employementtables e ,depttable d where d.location in ('CHICAGO','BOSTON') and
e.deptno = d.deptno and e.hiredate <(select e.hiredate from employementtables e where e.ename
= 'BLAKE') ;

-- 55.List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and
-- RESEARCH whose Sal is more than ALLEN and exp more than SMITH in the
-- asc order of EXP.
select *
from employementtables e
join depttable d on e.deptno=d.deptno
where deptname in ('accounting','research') and 
salary > (select salary from employementtables e where e.ename='allen') and
e.hiredate> (select hiredate from employementtables e where e.ename='smith')
order by e.hiredate;

-- 56.List the emps whose jobs same as SMITH or ALLEN.
select *
from employementtables
where job in (select job from employementtables where ename ='smith'or ename='allen');

-- 57.Any jobs of deptno 10 those that are not found in deptno 20.
select job
from employementtables
where deptno=10 and job not in (select job from employementtables where deptno=20);


-- 58.List of emps of emp1 who are not found in emp2.
select *
from employementtables e
left join employementtables m
on e.empno=m.empno
where m.empno is null ;

SELECT e1.*
FROM employementtables e1
WHERE NOT EXISTS (
    SELECT 1
    FROM employementtables e2
    WHERE e1.empno = e2.empno
);

-- 59.Find the highest sal of EMP table.
select max(salary)
from employementtables;

-- 60.Find details of highest paid employee.
select ename,max(salary)
from employementtables
where salary in (select max(salary) from employementtables)
group by ename;

-- 61.Find the highest paid employee of sales department.
select *
from employementtables e
join depttable d on e.deptno=d.deptno
where d.deptname in (select max(salary) from employementtables where d.deptname='sales');


-- 62.List the most recently hired emp of grade3 belongs to location CHICAGO.
select *
from employementtables e
join depttable d on e.deptno=d.deptno
where location='chicago'
order by hiredate desc
limit 1;

-- 63.List the employees who are senior to most recently hired employee
-- working under king.
select *
from employementtables
where hiredate < (select max(hiredate) from employementtables
where mgr in (select empno from employementtables where ename = 'KING'));

-- 64.List the details of the employee belongs to newyork with grade 3 to 5
-- except ‘PRESIDENT’ whose sal> the highest paid employee of Chicago in a
-- group where there is manager and salesman not working under king
select *
from employementtables e
join depttable d on e.deptno=d.deptno
where d.location='new york' and e.job not like 'president'
and e.salary > (select max(salary) from employementtables e where d.location='chicago'and
e.deptno in (select job from employementtables e where e.job in ('manager','salesman') 
and e.mgr not in (select empno from employementtables where e.ename='king');


select * from employementtables where deptno in (select deptno from depttable where dept.location
='NEW YORK')
and empno in (select empno from employementtables e,salgrade s where e.salary between s.losal
and s.hisal and
s.grade in (3,4,5) ) and job != 'PRESIDENT' and sal >(select max(salary) from emp
where deptno in
(select deptno from dept where dept.loc = 'CHICAGO') and job in
('MANAGER','SALESMAN') and
mgr not in (select empno from emp where ename = 'KING'));


-- 65.List the details of the senior employee belongs to 1981.
select *
from employementtables
where hiredate= (select max(hiredate) from employementtables where year(hiredate)='1981');

-- 66.List the employees who joined in 1981 with the job same as the most
-- senior person of the year 1981.
select *
from employementtables
where job in  (select job from employementtables where hiredate=(select max(hiredate) 
from employementtables where year(hiredate)='1981'));


-- 67.List the most senior empl working under the king .
select * 
from employementtables
where hiredate = (select max(hiredate) from employementtables where mgr in (select
empno from employementtables where ename='king'));

-- 68.Find the total sal given to the MGR.
Select sum(salary)
from employementtables
where empno in (select mgr from employementtables);

--  69.Find the total annual sal to distribute job wise in the year 81.
select job,sum(salary*12)
from employementtables
where year(hiredate)='1981'
group by job;


-- 70.Display total sal employee belonging to exp
select sum(salary)
from employementtables
where  DATEDIFF((CURRENT_DATE(), hiredate) / 365.25 AS experience_in_years);

-- 71.Display the average salaries of all the clerks.
select job,avg(salary)
from employementtables
where job='clerk';

-- 72. List the employeein dept 20 whose sal is >the average sal 0f dept 10 emps.
select *
from employementtables
where deptno=20 and salary>(select avg(salary) from employementtables where deptno=10);

-- 73.Display the number of employee for each job group deptno wise.
select deptno,job,count(*) 
from employementtables
group by deptno,job;


-- 74.List the manage rno and the number of employees working for those
-- mgrs in the ascending Mgrno.
select w.mgr ,count(*) 
from employementtables w 
join employementtables m
on w.mgr = m.empno
group by w.mgr
order by w.mgr asc;

-- 75.List the department,details where at least two emps are working
select deptno,count(*)
from employementtables
group by deptno
having count(*)>=2;

-- 76.Display the Grade, Number of emps, and max sal 
select count(*),max(salary)
from employementtables;

-- 77.Display dname, grade, No. of emps where at least two emps are clerks.
select e.job,d.deptname,count(*)
from employementtables e
join depttable d on e.deptno=d.deptno
where e.job='clerk'
group by d.deptname
having count(*)>=2; 


-- 78.List the details of the department where maximum number of emps are working.
select e.empno,d.deptname,d.deptno
from employementtables e
join depttable d on e.deptno=d.deptno
where d.deptno in (select max(count(*)) from employementtables e );


-- 79.Display the emps whose manager name is jones.
select * 
from employementtables
where mgr in (select empno from employementtables where ename='jones');


-- 80.List the employees whose salary is more than 3000 after giving 20% increment.
select * 
from employementtables
where (salary*1.2)>3000;

-- 81.List the emps with dept names
select e.empno,e.ename,d.deptname,d.deptno
from employementtables e
join depttable d on e.deptno=d.deptno;

-- 82.List the emps who are not working in sales dept.
select e.empno,e.ename,d.deptname,d.deptno
from employementtables e
join depttable d
where d.deptno not in (select d.deptno from employementtables where d.deptname='sales');

-- 83.List the emps name ,dept, sal and comm. For those whose salary is
-- between 2000 and 5000 while loc is Chicago.
select e.empno,e.ename,e.salary,e.comm,
d.deptname,d.deptno
from employementtables e
join depttable d
where salary between 2000 and 5000 and location='chicago';

-- 84.List the emps whose sal is greater than his managers salary
select e.empno,e.ename,e.salary
from employementtables e
join employementtables m
on e.empno=m.mgr
where e.salary>m.salary; 

-- 85.List the  EMP name for the deptno 10 or deptno 30  
-- while they joined the company before ’31-dec-82’.
select ename,empno,deptno,hiredate
from employementtables
where deptno in (10,30) and hiredate<'1982-12-31';

-- 86.List the name ,job, dname, location for those who are working as MGRS
select e.empno,e.ename,e.job,e.mgr,
e.deptno,d.deptname,d.location
from employementtables e
join depttable d on e.deptno=d.deptno
where e.empno in (select mgr from employementtables);

-- 87.List the emps whose mgr name is jones and also list their manager name
select * 
from employementtables e
join employementtables m
on e.empno=m.mgr
where e.ename='jones';

-- 88.List the name and salary of ford find his salary is equal to salary of any employee
select e.ename,e.salary
from employementtables e
join employementtables m  
where e.ename='ford' and e.salary=m.salary
and e.empno!=m.empno;

-- 89. List the emp name, job, sal, grade and dname except clerks and sort on the
--  basis of highest sal.
select e.ename,job,e.salary,
d.deptname
from employementtables e
join depttable d
on e.deptno=d.deptno
order by e.salary desc;

-- 90. List the emps name, job who are with out manager.
select ename,empno,job,mgr
from employementtables
where mgr is null;

-- 91.List the names of the emps who are getting the highest sal dept wise.
select e.ename,e.empno,e.salary,
d.deptno,d.deptname
from employementtables e
join depttable d on e.deptno=d.deptno
where e.salary in (select max(salary) from employementtables) ;

-- 92. List the emps whose sal is equal to the average of max and minimum
with salary_status as (
select ename,salary,
max(salary) over () as high_sal,
min(salary) over () as Low_sal,
(min(salary) over()+max(salary) over()/2.0) as avg_sal
from employementtables
)
select ename,salary
from employementtables
where salary in (select avg_sal from salary_status);


-- 93.List the no. of emps in each department where the no. is more than 3.
select deptno,count(*)
from employementtables 
group by deptno
having count(*)>3;

--  94.List the names of depts. Where atleast 3 are working in that department.
select d.deptname,e.ename,count(*)
from employementtables e
join depttable d on e.deptno=d.deptno
group by d.deptname
having count(*)>=3;

