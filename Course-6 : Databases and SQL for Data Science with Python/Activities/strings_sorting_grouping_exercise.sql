/*1. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”*/
SELECT SUM(AmountinUSD) FROM indian_startup_funding WHERE CityLocation = 'Bengaluru';

/*2. Write SQL query to sort the table by startup name DESC*/
SELECT * FROM indian_startup_funding ORDER BY StartupName DESC;

/*Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
and AmountinUSD>380000*/
SELECT SUM(AmountinUSD) FROM indian_startup_funding
WHERE CityLocation = 'Bengaluru' AND AmountinUSD > 380000;

/*4. Write SQL query to get all CityLocations that has an AmountinUSD >380000*/
SELECT CityLocation FROM indian_startup_funding 
WHERE AmountinUSD > 380000;

/*5. Write SQL query to get only unique CityLocations that has an AmountinUSD >380000*/
SELECT DISTINCT CityLocation FROM indian_startup_funding 
WHERE AmountinUSD > 380000;

/*6. Write SQL query to get all StartupNames where AmountinUSD<380000*/
SELECT StartupName FROM indian_startup_funding 
WHERE AmountinUSD < 380000;

/*7. Write SQL query to sort the output from the previous question DESC*/
SELECT StartupName FROM indian_startup_funding 
WHERE AmountinUSD < 380000
ORDER BY StartupName DESC;

/*8. Write SQL query to get the City location that has the maximum funding amount “Note that is the
data is not cleaned properly you will get non logical result”*/
-- SELECT CityLocation, AmountinUSD FROM indian_startup_funding 
-- WHERE AmountinUSD = (SELECT MAX(AmountinUSD) FROM indian_startup_funding);

select CityLocation, AmountinUSD from indian_startup_funding where AmountinUSD=( select max(AmountinUSD) from indian_startup_funding where AmountinUSD NOT LIKE 'U%');


/*9. Write SQL query to get the total funding AmountinUSD for each IndustryVertical*/
SELECT IndustryVertical, SUM(AmountinUSD) FROM indian_startup_funding 
GROUP BY IndustryVertical;

/*10. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
letter “A”*/
SELECT IndustryVertical, SUM(AmountinUSD) FROM indian_startup_funding 
WHERE IndustryVertical LIKE 'A%' 
GROUP BY IndustryVertical;

/*11. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
letter “A” and sort the output DESC by the total AmountinUSD*/
SELECT IndustryVertical, SUM(AmountinUSD) FROM indian_startup_funding 
WHERE IndustryVertical LIKE 'A%' 
GROUP BY IndustryVertical 
ORDER BY SUM(AmountinUSD) DESC;

/*12. Write SQL query to count all the start_ups in the Education field*/
SELECT COUNT(*) FROM indian_startup_funding
WHERE IndustryVertical = 'Education';

/*13. Write SQL query to count all the start_Ups in the E-Commerce field*/
SELECT COUNT(*) FROM indian_startup_funding 
WHERE IndustryVertical = 'E-Commerce';

/*14. Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals
“Bengaluru”*/
SELECT COUNT(*) FROM indian_startup_funding 
WHERE IndustryVertical = 'E-Commerce' AND CityLocation = 'Bengaluru';

/*15. For each Industry Vertical find the total funding amount*/
SELECT IndustryVertical, SUM(AmountinUSD) FROM indian_startup_funding 
GROUP BY IndustryVertical;

/*16. For each Industry Vertical find the total funding amount as “Total_fund” and the average
funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry
Vertical, 2- using sub_queries*/

-- answer 1- using group by Industry Vertical
SELECT IndustryVertical, SUM(AmountinUSD) AS Total_fund, AVG(AmountinUSD) AS Avg_Fund 
FROM indian_startup_funding 
GROUP BY IndustryVertical;  

-- answer 2- using sub_queries
SELECT IndustryVertical, Total_fund, Avg_Fund 
FROM (
   SELECT IndustryVertical, SUM(AmountinUSD) AS Total_fund, AVG(AmountinUSD) AS Avg_Fund 
   FROM indian_startup_funding 
   GROUP BY IndustryVertical
) AS subquery 
ORDER BY Total_fund DESC;


/*17. Write SQL query to get the minimum value of funding for the “Uniphore” start_up*/
SELECT MIN(AmountinUSD) FROM indian_startup_funding 
WHERE StartupName = 'Uniphore';


/*18. Write SQL query to get the length of the city location names*/
SELECT CityLocation, LENGTH(CityLocation) AS CityLocationLength 
FROM indian_startup_funding;


/*19. Write SQL query to convert start_ups names into uppercase if the 
funding amount is >380,000*/
UPDATE indian_startup_funding 
SET StartupName = UPPER(StartupName) 
WHERE AmountinUSD > 380000;

/*20. Write SQL query to select distinct industry vertical names, knowing that names are mix of
lowercase and uppercase values.*/
SELECT DISTINCT LOWER(IndustryVertical) AS IndustryVertical 
FROM indian_startup_funding;






















