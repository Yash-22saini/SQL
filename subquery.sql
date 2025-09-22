-- sub query
-- query(subquery) -- when my result is dependent on another query then we use sub query also called nested query.

use world;
select * from city;
select name , population  from city where name='kabul';

-- subquery
select name , population  from city where population>(select population  from city where name='kabul');
select name , population  from city where population>(select population  from city where name='batna');

-- now get the name of the city where the district is same as of the district for amsterdam
select name ,district from city where district=(select district from city where name='amsterdam');

select * from country;
-- get the country code and the country name where continent matches with the continent of the country albania
select code ,name, continent from country where continent=(select continent from country where name='albania');


-- get the continent , the name of the country where the life exp. matches with the life exp.of country name as cook islands
select continent ,name , lifeexpectancy from country where lifeexpectancy=(select lifeexpectancy from country where name='cook islands');

-- get the country code and the continent and gnp value  for the countries where the region do not match with the region of the country name as benin
select code ,continent ,gnp , region from country where region not like (select  region from country where name='benin');
select  region from country where name='benin'; -- to check region of benin
 
-- nested query/ sub query
-- single row subquery -- return only single row 
-- multi row subquery -- reutrns multiple rows - no use of >,< = ,<= -- use name in 

-- i need to get the country name and the population for all the countrie available in the continent name as europe
select  name, population , continent from country where continent = 'europe';

-- muti row query
select  name, population , continent from country where name in (select name from country where continent = 'europe');
  
-- get the country name and the country code where the life exp. match with the life expect. of the country name as bahamas
select  name ,code,lifeexpectancy from country where lifeexpectancy=(select lifeexpectancy from country where name='bahamas');











