/*1. Write a query in SQL to find the name and year of the movies.*/
select mov_name, mov_year from Movies1;

/*2. Write a query in SQL to find the year when the movie American Beauty
released.*/
select mov_year from Movies1 where mov_name = 'American Beauty';

/*3. Write a query in SQL to find the movie which was released in the year
1999.*/
select mov_name from Movies1 where mov_year=1999;

/*4. Write a query in SQL to find the movies which was released before 1998.*/
select mov_name from Movies1 where mov_year < 1998;

/*5. Write a query in SQL to return the name of all reviewers and name of
movies together in a single list.*/
select rev_name||''|| mov_name as list from Movies1;

/*6. Write a query in SQL to find the name of all reviewers who have rated 7 or
more stars to their rating.*/
select rev_name from Movies1 where rev_stars >7;

/*7. Write a query in SQL to find the titles of all movies that have no ratings.*/
select mov_name from Movies1 where num_o_ratings is null;

/*8. Write a query in SQL to find the titles of the movies with ID 905, 907, 917.*/
select mov_name from Movies1 where mov_id in (905, 907, 917);

/*9. Write a query in SQL to find the list of all those movies with year which
include the words Boogie Nights.*/
select mov_name from Movies1 where mov_name like 'Boogie Nights' and mov_year is NOT NULL;

/*10. Write a query in SQL to find the ID number for the actor whose first
name is &#39;Woody&#39; and the last name is &#39;Allen&#39;.*/
