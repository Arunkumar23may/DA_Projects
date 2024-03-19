-- Group the customers based on their income type and find the average of their annual income.
select  Type_Income, avg(Annual_Income) from credit_card
group by Type_Income;

-- Find the female owners of cars and property.
select * from credit_card where Car_Owner='Y' and Propert_Owner='Y' and GENDER='F'; 

-- Find the male customers who are staying with their families.
select * from credit_card;
select Ind_ID,GENDER,Family_Members from credit_card where Family_Members>0 and GENDER='M';

-- Please list the top five people having the highest income.
select Ind_ID,Annual_income FROM credit_card
ORDER BY Annual_income DESC LIMIT 5;

-- How many married people are having bad credit?
select count(c.Ind_ID) from credit_card c inner join  credit_card_label cl on c.Ind_ID=cl.Ind_ID where label=1 and Marital_status='Married';

-- What is the highest education level and what is the total count?
select distinct(EDUCATION) as edu_type,count(Ind_ID) as edu_number from credit_card
group by edu_type 
order by edu_number desc limit 1;

-- Between married males and females, who is having more bad credit?
select count(c.Ind_ID), GENDER from credit_card c inner join  credit_card_label cl on c.Ind_ID=cl.Ind_ID where label=1 and Marital_status='Married'
group by GENDER limit 1;






