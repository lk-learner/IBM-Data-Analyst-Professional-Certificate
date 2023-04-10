/*1. What is the output of this query?
Select * from Book where PurchaseCost >12;*/
Select * from Booktable1 where PurchaseCost >12;

/*2. What is the output of this query?
Select DISTINCT Category from Book;*/
Select DISTINCT Category from Booktable1;

/*3. Write a SQL query to retrieve all the data from Book where Status equals “out”.*/
select * from Booktable1 where Status = "Out";

/*4. Write SQL statement to retrieve only the first 3 rows from book.*/
select * from Booktable1 limit 3;

/*5. Write a SQL statement to count all books where the Category equals Travel.*/
select count(BookISBN) from Booktable1 where Category = "Travel";

/*6. Write SQL statements to delete the books with ISBN of “978-1-119-95055-02-4,
978-0-261-81762-01-2”*/
DELETE from Booktable1 where BookISBN = '978-1-119-95055-02-4';
DELETE from Booktable1 where BookISBN = '978-0-261-81762-01-2';

