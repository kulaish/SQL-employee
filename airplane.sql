create database airplanecrash;
use airplanecrash;

create table airplanecrash
(Date date,
Time time,
Location varchar(100),
Operator varchar(500),
Flight varchar(200),	
Route varchar(250),	
Type varchar(300),	
Registration varchar(20),
cnIn varchar(20),
Aboard int,
Fatalities int,
Ground int,
Summary varchar(1000)
);

select * from airplanecrash;

-- 1. Retrieve crashes where fatalities were greater than 100
select * 
from airplanecrash
where fatalities>100;

--  2.count no of crashes by year
select year(date),count(date) as year
from airplanecrash
group by year(date)
order by year;

-- 3.retrieve crashes where the aircraft type contains a keyword "Boeing"
select * from airplanecrash
where type like "%Boeing%";

-- 4.retrieve crashes where the operator is "American airline"
select * from airplanecrash
where operator =  "American airlines";

-- 5.retrieve crashes occured in a country "germany"
select * from airplanecrash
where location like  "%germany%";

-- .6.retrieve crashes occurred between 2000-01-01 and 2010-12-31
select * from airplanecrash
where date between '1/1/2000' and '31/12/2010';


-- 7.retrieve crashes where no of fatalities equal to the no of people aboard
select * from airplanecrash
where fatalities="aboard";

-- 8.retrieve crashes where there were no survivors
select * from airplanecrash
where aboard= "fatalities";

-- 9.retrieve maximum fatalities
 select * from airplanecrash
 where fatalities=(select max(fatalities) from airplanecrash);
 
 --  10.find top 10 operators with highest no crashes
 select Operator,count(Operator) as countop
 from airplanecrash
 group by Operator
 order by countop desc
 limit 10;
 
-- 11.calculate average no of fatalities per crashes
select avg(fatalities) as avgfat
from airplanecrash;

-- 12.retrieve crashes when no of fatalities is greate than twice the average no of fatalities
select * from airplanecrash
where fatalities> 2*(select avg(fatalities) as avgfat from airplanecrash);

-- 13.find the total no crashes by month and year
select year(date) year, month(date) as month,count(date) as countdate
from airplanecrash
group by month
order by month;

-- 14.identify the 5 most common aircraft types involved in crashes
select type,count(type) as counttype
from airplanecrash
group by type 
order by counttype desc
limit 5; 

-- 15.calculate the percentage of crashes that occured during nighttime



-- 16.calculate the average survival rate (percentage of survival) for all crashes 
select avg ((aboard-fatalities)/ aboard) *100 as avgsurvrate
from airplanecrash;

-- 17. retrieve crashes where the aircraft was operated by military opeartor and the no of fatalities was greater than 50
select * from airplanecrash
where Operator like "%military%" and fatalities>50;

-- 18.rank airline by no of crshes they have been involved
select operator, count(*) as num_crashes,
RANK() OVER (order by count(*) desc) as air_rank
from airplanecrash
group by operator;

-- 19.calculate cumilative no of fatalities over each date
select date,
sum(fatalities) over(order by date) as cum_fatalities
from airplanecrash;

-- 20. find the percentage of total fatalities each  has contributed,relative to all crashes
select operator,
sum(fatalities) * 100.0 / sum(fatalities)over() as per_fatalities
from airplanecrash
group by operator;

-- ...21.calculate avg no of fatalities for each year along with year to year change
select year(date) as year,
avg(fatalities) as avg_fatalities,
avg(fatalities)-lag(avg(fatalities)) over(order by year(date)) as yoy_change
from airplanecrash
group by year(date);

-- ...22.determine the median no of flights on flights,along with the difference from the median for each crash
select aboard,
median(aboard) over() as median_flight,
aboard-median(aboard) over() as diff_median
from airplanecrash
group by aboard;

-- 23.rank crashes by no of fatalities within each year
select date,
rank() over(partition by year(date) order by fatalities desc) as fat_rank
from airplanecrash;

-- 24.calculate avg no of fatalities for crashes involving each aircraft type,ordered by avg no of fatalities
select type,
avg(fatalities) as avg_fatalities,
rank() over(order by avg(fatalities) desc) as rank_fatalities
from airplanecrash
group by type;

-- 25.find the earliest crash date for each operator
select operator,
min(date) as earliest_date
from airplanecrash
group by operator;

-- 26.calculate running total of crashes for each month,ordered by month,year
select date,
count(*) over (partition by year(date),month(date) order by date) as running_crash
from airplanecrash
group by date;

