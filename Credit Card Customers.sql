SELECT * FROM project.bankchurners;
#data set
SELECT * FROM bankchurners;

#Tuples in a data set
SELECT COUNT(*) FROM bankchurners;

#Number of Existing Customers 
SELECT COUNT(*) FROM bankchurners
WHERE Attrition_Flag='Existing Customer';

#Number of Attrited Customers
SELECT COUNT(*) FROM bankchurners
WHERE Attrition_Flag='Attrited Customer';

SELECT CASE 
	WHEN Customer_Age<20 THEN '0-20'
	WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
	WHEN Customer_Age BETWEEN 30 AND 40 THEN '30-40'
	WHEN Customer_Age BETWEEN 40 AND 50 THEN '40-50'
	WHEN Customer_Age BETWEEN 50 AND 60 THEN '50-60'
	WHEN Customer_Age BETWEEN 60 AND 70 THEN '60-70'
	WHEN Customer_Age BETWEEN 70 AND 80 THEN '70-80'
	WHEN Customer_Age>80 THEN 'Above 80'		
END AS Age_Range, Count(*)
FROM BankChurners WHERE Attrition_Flag='Attrited Customer'
GROUP BY Age_Range
ORDER BY Age_Range;

SELECT SUM(IF(Gender='M',1,Null)) as Male_Existing_Customers,
SUM(IF(Gender='F',1,Null)) as Female_Existing_Customers
FROM bankchurners WHERE Attrition_Flag='Existing Customer';

SELECT SUM(IF(Gender='M',1,Null)) as Male_Existing_Customers,
SUM(IF(Gender='F',1,Null)) as Female_Existing_Customers
FROM bankchurners WHERE Attrition_Flag='Attrited Customer';

#Education level count based on Attrited and Existing Customers
SELECT Education_level, count(*) FROM bankchurners WHERE Attrition_Flag='Existing Customer' GROUP BY Education_Level order by COUNT(*);
SELECT Education_level, count(*) FROM bankchurners WHERE Attrition_Flag='Attrited Customer' GROUP BY Education_Level order by COUNT(*);

#Marital Status count based on Attrited and Existing Customer
SELECT Marital_Status, count(*) FROM bankchurners WHERE Attrition_Flag='Existing Customer' GROUP BY Marital_Status order by COUNT(*);
SELECT Marital_Status, count(*) FROM bankchurners WHERE Attrition_Flag='Attrited Customer' GROUP BY Marital_Status order by COUNT(*);

#Income Status coutn based on Attrited and existing customer
SELECT Income_Category, count(*) FROM bankchurners WHERE Attrition_Flag='Existing Customer' GROUP BY Income_Category order by COUNT(*);
SELECT Income_Category, count(*) FROM bankchurners WHERE Attrition_Flag='Attrited Customer' GROUP BY Income_Category order by COUNT(*);

#Distribution of Attrited customers based on months on book
SELECT CASE 
	WHEN Months_on_book <20 THEN '0-20'
	WHEN Months_on_book BETWEEN 20 AND 30 THEN '20-30'
	WHEN Months_on_book BETWEEN 30 AND 40 THEN '30-40'
	WHEN Months_on_book BETWEEN 40 AND 50 THEN '40-50'
	WHEN Months_on_book BETWEEN 50 AND 60 THEN '50-60'
    WHEN Customer_Age>60 THEN 'Above 60'		
END AS Monthsonbook_Range, Count(*)
FROM BankChurners WHERE Attrition_Flag='Attrited Customer'
GROUP BY Monthsonbook_Range
ORDER BY Monthsonbook_Range;

#Tensure of inactivity months
SELECT Months_Inactive_12_mon, count(*) FROM bankchurners WHERE Attrition_Flag='Existing Customer' GROUP BY Months_Inactive_12_mon order by COUNT(*);
SELECT Months_Inactive_12_mon, count(*) FROM bankchurners WHERE Attrition_Flag='Attrited Customer' GROUP BY Months_Inactive_12_mon order by COUNT(*);

