SELECT * FROM gapminder_uc;
-- 1.Create a copy of data --
create table gmc like gapminder_uc;
alter table gmc add column (row_num int);
insert gmc
select *,
row_number() over(partition by country,continent,`year`,lifeExp,pop,gdpPercap,iso_alpha) as row_num
from gapminder_uc ;
select * from gmc;

-- 2.Removing duplicates --
select * from gmc where row_num>1;
-- standardizing the data --
select * from gmc;
select distinct country from gmc;
select distinct continent from gmc;
select `year` from gmc;
select (gdpPercap) from gmc;
select  distinct iso_alpha from gmc;
-- data is already standardized --

-- filling and removing null values --
select * from gmc where continent ='' or continent is null;
update  gmc
set continent='Europe'
where country='Belgium';
select * from gmc where continent='' ;
select * from gmc where country='Brazil';
update  gmc
set continent='Americas'
where country='Brazil' and continent='';

-- Removing unwanted columns --
select * from gmc order by 1 ;


