use world;
select * from city;
select * from country;
-- 1.get the city name and the district where the district do not  have the word noord 
select c.name , c.district from city as c where district  not like'%noord%';

-- 2. get the total no. of cities present in each country having the population greater than 1.5 lakh
 select countrycode , count(*) as totallcities from city where population>150000 group by countrycode;
 
 -- 3 .get the district name which has more than two cities.
select district ,  countrycode , count(*) as cities from city group by district , countrycode having count(*)>2;

-- 4 . find the city name , country code and the country name where the country populatuion is greater than 50000
select c.name , c.countrycode , co.name , co.population from city as c join country as co on c.countrycode = co.code where co.Population > 50000 ;

-- 5.get the district and totl population for each country ;
select c.district ,sum(c.population) as districtpopulation , c.countrycode ,co.Name as countryname , co.population as countrypopulation from city as c join country as co on c.countrycode=co.code group by c.countrycode ,c.district,co.code, co.name ,co.population;

-- .6 get the total no of countries present in each continenet having their independence year after 1920
select continent , count(*) as countries from country where indepyear>1920 group by continent;


-- 7.get the avg surface area, the total population, avg life expentancy and the total no of continents available for each region
SELECT Region,
       AVG(SurfaceArea)   ,
       SUM(Population)    ,
       AVG(LifeExpectancy)  ,
       COUNT(DISTINCT Continent)
FROM Country GROUP BY Region;
