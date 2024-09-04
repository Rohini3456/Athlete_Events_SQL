drop table if EXISTS OLYMPICS_HISTORY;
CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY
(
ID INT,
Name VARCHAR,
Sex VARCHAR,
Age VARCHAR,
Height VARCHAR,
Weight VARCHAR,
Team VARCHAR,
noc VARCHAR,
Games VARCHAR,
Year INT,
Season VARCHAR,
City VARCHAR,
Sport VARCHAR,
Event VARCHAR,
Medal VARCHAR

);

drop table if EXISTS OLYMPICS_HISTORY_NOC_REGIONS;
CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY_NOC_REGIONS
(
NOC VARCHAR,
region VARCHAR,
notes VARCHAR
)

select count(1) from olympics_history;
select * from  OLYMPICS_HISTORY_NOC_REGIONS;




with t1 as 
(select count(distinct games) as total_summer_games
from OLYMPICS_HISTORY where season = 'Summer'),

t2 as
(select distinct sport, games 
 from OLYMPICS_HISTORY where season = 'Summer' order by games),

t3 as
(select distinct sport,count(games) as no_of_games
from t2
group by sport)

select * from t3
 
join t1 on t1.total_summer_games = t3.no_of_games;

-- query2--

with t1 as  
(select name, count(1)  as total_medals
from olympics_history where medal = 'Gold'
group by name
order by count(1) desc),

t2 as 
(select *, dense_rank() over(order by total_medals desc) as rnk
from t1)

select * from t2
where rnk <= 5;


--1. how many olympics games are held--

select count(distinct games) as no_of_olympics from olympics_history;

--2.List down all Olympics games held so far.--

select distinct games as list_0f_games from olympics_history 
where year, season, city;

-- 3.Mention the total no of nations who participated in each olympics game?--
select distinct count(Team) as no_of_nations from olympics_history;

--4.Which year saw the highest and lowest no of countries participating in olympics?








