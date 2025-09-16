 -- INDEXES
-- indexes is mechanism to optimize the sql query .  -- to acces the data faster from the database .
 use tushar;
 create table test(id int , name varchar(20));
 insert into test values (10,"abc"),(11,"def"),(15,"ghi"),(18,"yash"),(14,"aashu");
 explain select * from test where id = 15;
 
 select * from test;
 
 -- data pages - storage unit of a TABLE -- size 8 kb -- in my sql 16 kb 
 -- indexes are of two types 
 -- 1. clustered index -- It decides the physical order of data in a table (like sorting pages of a book).
 -- A table can have only one clustered index because data can be stored in only one order.
 -- when it is created , actual data rows are rearranged in a sorted way to match index order.
 
 -- 2. non clustered index -- It creates a separate structure that stores pointers to the actual data (like an index at the back of a book).
 -- A table can have many non-clustered indexes.
 -- the rows are not physically arranged or does not affect the physical order of data rows.
 
 -- Clustered = data is stored in sorted order
-- Non-clustered = separate index pointing to data

 -- Clustered = Sorted storage
-- Non-clustered = Pointers
-- Unique = No duplicates
-- Composite = index on Multiple columns together -- sequnece matters 
-- Filtered = Only some rows
-- Covering = Query fully covered
-- Full-text = Text search
-- Spatial = Maps/locations
-- XML/JSON = Semi-structured data


 