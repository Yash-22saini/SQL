-- windows function 
-- view function -- virtual table -- table data store physically -- code reusability -- security 
use sakila ;
create view temp as (
select first_name,count(*) from actor where actor_id>10
group by first_name order by count(*) desc);

select*from temp;

create view temp2 as 
(select first_name , last_name from actor);

select * from temp2;


-- ctas -- create table as select 
create table factors as 
(select actor_id, first_name , last_name from actor where actor_id<7);

select * from factors;

-- make view using all columns ,  inside view run update and insert , see chnages in both original and view, new view with filter 
CREATE VIEW factors_view AS
SELECT *
FROM factors;

UPDATE factors_view
SET last_name = 'UPDATED'
WHERE actor_id = 3;

SELECT * FROM factors;
SELECT * FROM factors_view;

INSERT INTO factors_view (actor_id, first_name, last_name)
VALUES (7, 'NEWNAME', 'NEWSURNAME');

SELECT * FROM factors;

-- temp table -- accesable through the session -- are for the session only available for extisting session
-- view -- for all users -- for all the sessions 
-- cte vs view vs temporary table


