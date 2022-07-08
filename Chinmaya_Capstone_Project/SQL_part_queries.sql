-- Creating database 
create database if not exists Olympix;

-- Finding the average number of medals won by each country.
-- To calculate average number of medal own by each country we have to devide total number of medal into seaven diffrent participated year.

select country, sum(total_medal)/7 as avrage_medal from country_info -- calculating average of total medal by groupping with country column
join medals on medals.Country_id= country_info.Country_id -- joining medals table and country_info table by Country_id 
group by country 
ORDER BY (total_medal) desc; -- arranging value in descending order

-- Displaying the countries and the number of gold medals they have won in decreasing order

select country, sum(gold_medal) from country_info -- summing total of gold medals grouped with country column
join medals on  country_info.Country_id= medals.Country_id -- joining medals table and country_info table by Country_id 
group by country 
order by sum(gold_medal) desc   ;  -- arranging value in descending order

-- Display the list of people and the medals they have won in descending order, grouped by their country

select name,age,sum(gold_medal),sum(silver_medal),sum(brone_medal),sum(total_medal),country from personal -- summing all medals won by players and groupping with country and name column
join medals on medals.Country_id= personal.Country_id -- Joining medals table and personal table by Country_id
join country_info  on country_info.Country_id= personal.Country_id -- Joining Country_info and personal table by Country_id
group by name
order by sum(total_medal) desc; -- arranging value in descending order

-- Display the list of people with the medals they have won according to their their age

select name,age,gold_medal,silver_medal,brone_medal, total_medal from personal -- grouping all medal records with woner's name and their age
join medals on medals.Country_id = personal.Country_id -- joining medals table and personal table by Country_id 
group by (name) 
order by sum(total_medal) desc; -- arranging values in descending order

-- Calculating which country has won the most number of medals (cumulative).

select country, sum(total_medal) from country_info -- Summing total_medals and group with country
join medals on medals.Country_id= country_info.Country_id -- Joining medals table and country_info table by Country_id column
group by country 
order by sum(total_medal) desc -- arranging values in descending order
limit 1;


