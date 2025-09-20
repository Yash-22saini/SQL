use world;
select code , name, if( name ="Aruba" , "hey", "hello"), indepyear from country;
 
 select code , name,
 if( name ="Aruba" , "terror", if (name = "Angola", "terrorist","tourism")), indepyear from country;

 
-- case - when  condition   then expression 
--        when condition  then expression 2
--        else   expression 
--   end  

select code, name,
	case 
		when  name="Aruba"  then "terror"
		when name = "Angola" then "terrorist"
    else   "tourism"
end  as "status"
from country;

-- if your country name starts with A print(country with A) 
-- s (country with s)
-- otherwise country with another name 

select code, name,
	case 
		when  name like "A%"  then "country with A"
		when name like "S%" then "country with S"
    else   "country with another name "
end  as "status"
from country;

select name , indepyear , ifnull(indepyear,0) from country;
select count(indepyear), count(ifnull(indepyear,0)) from country;

select  name , continent , nullif(length(name) ,length(continent) )from country ;
-- null if takes two expressions if they are same it will return null otherwise first expression . 

select name , population ,
	case
		 when population >200000 then " developed country"
         when population > 100000 then " developing country"
    else " under developed"
    end as countrystatus 
    from country;
    
