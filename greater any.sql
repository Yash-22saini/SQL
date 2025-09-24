use world;
select * from world.country;

-- get the name of the country whose population is greater than the all  population of tha countries of continent  north america 
select name , population from country where population > all ( select population from country where continent = 'north america');

-- get the country code , name of the country whose life exp is same as for the countries from europe
select code, name from country where lifeexpectancy = any  (select lifeexpectancy from country where continent = 'europe');
 
-- get the name and the continenet for the countries who have got their independence near by the indep yearfrom the countries of asia
select name, continent, indepyear , population from country where indepyear > any (select indepyear from country where continent = 'asia');

select continent , count(*) from country where indepyear > any (select indepyear from country where continent = 'asia') and continent!= 'asia'group by continent;


-- order by - arrange data by asc and desc
select * from country order by name;
select * from country order by region desc,surfacearea asc;

select name , population ,(select population from country where name = 'anguilla'),(population/(select population from country where name = 'anguilla'))from country;

