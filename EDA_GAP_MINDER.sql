-- EDA ON GAP MINDER --
select * from gmc;

select Min(`year`) as Start_range,Max(`year`) as End_range from gmc;
-- AVERAGE LIFE EXPECTANCY ANALYSIS--

with cte_analysis as
(
select  country,AVG(lifeExp) as avg_exp,`year`
from gmc
group by country,lifeExp,`year`
order by `year` asc)

select country,MAX(avg_exp) as Life_exp_of_country from cte_analysis
group by country,avg_exp
order by avg_exp desc;

-- POPULATION ANALYSIS --

select * from gmc;

select country,
dense_rank() over( order by pop desc) as maximum_pop ,`year`
from gmc;

select country, MAX(pop) as maximum_population,
dense_rank()
Over( order by MAX(pop) desc) as RANKING
from gmc
group by country;

-- GDP ANALYSIS --
select country, gdpPercap,
dense_rank() over( order by gdpPercap desc) as ranking_gdp ,`year`
from gmc;

select min(gdpPercap) as least,max(gdpPercap) as highest from gmc;

select continent,
Sum(gdpPercap) as Total_GDP_of_continent ,
dense_rank() over( order by Sum(gdpPercap) desc) as ranking_gdp
from gmc
group by continent;