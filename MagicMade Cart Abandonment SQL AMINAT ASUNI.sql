--1. STRUCTURE

-- Create database
CREATE DATABASE MagicMade_Ecommerce

--Use of database Created
USE MagicMade_Ecommerce

GO

CREATE SCHEMA MagicMadeE -- A schema helps to logically group tables under one name for easy identification and organizing data

 --Import Data

 --EDA

 --View Data
 SELECT *
 FROM MagicMade.Cart_Records

 --Count of the number of rows
 SELECT COUNT(*) AS Total_Count
 FROM MagicMade.Cart_Records

 --Check for Duplicates
 SELECT User_ID, User_Location, Gender, Cart_Contents, Cart_Value, Session_Date, Session_Duration, Abandonment_Reason,
 Purchase_Category, Referral_Medium, Device_Type, Cart_Status
 FROM MagicMade.Cart_Records
 GROUP BY User_ID, User_Location, Gender, Cart_Contents, Cart_Value, Session_Date, Session_Duration, Abandonment_Reason,
 Purchase_Category, Referral_Medium, Device_Type, Cart_Status
 HAVING COUNT(*) > 1;

 --Sum of Cart Value
 SELECT SUM(Cart_Value) AS Total_Value
 FROM MagicMade.Cart_Records
 --WHERE Cart_Status = 'Paid'
 
 --Number of rows by cart status
 SELECT Cart_Status,Count(*) AS Number
 FROM MagicMade.Cart_Records
 GROUP BY Cart_Status;

 --Number of rows by Gender
 SELECT Gender,Count(*) AS Number
 FROM MagicMade.Cart_Records
 GROUP BY Gender;

 --GROUP BY Gender
 SELECT Gender,Count(*) AS Number
 FROM MagicMade.Cart_Records
 WHERE Cart_Status ='Abandoned'
 GROUP BY Gender;

 SELECT Gender,Count(*) AS Number
 FROM MagicMade.Cart_Records
 WHERE Cart_Status ='Paid'
 GROUP BY Gender;


 SELECT Gender,Cart_Status, Count(*) AS Number
 FROM MagicMade.Cart_Records
 GROUP BY Gender,Cart_Status;

 --Users by Location
 SELECT User_Location, COUNT(*) AS Total_Location
 FROM MagicMade.Cart_Records
 GROUP BY User_Location
 ORDER BY 2 DESC;

 SELECT User_Location, COUNT(*) AS Total_Location
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Paid'
 GROUP BY User_Location
 ORDER BY 2 DESC;

SELECT User_Location, COUNT(*) AS Total_Location
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Abandoned'
 GROUP BY User_Location
 ORDER BY 2 DESC;

 SELECT User_Location,Cart_Status, COUNT(*) AS Total_Location
 FROM MagicMade.Cart_Records
 GROUP BY User_Location, Cart_Status
 ORDER BY 2 DESC;

 --Users by Cart Contents
 SELECT Cart_Contents, COUNT(*) AS Total_Cartcontents
 FROM MagicMade.Cart_Records
 GROUP BY Cart_Contents
 ORDER BY 2 DESC;

 SELECT Cart_Contents, COUNT(*) AS Total_AbandonedCartcontents
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Abandoned'
 GROUP BY Cart_Contents
 ORDER BY 2 DESC;

 SELECT Cart_Contents, COUNT(*) AS Contents
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Paid'
 GROUP BY Cart_Contents
 ORDER BY 2 DESC;

 --Users by Abandonment reason
 SELECT Abandonment_Reason, COUNT(*) AS Reasons
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Abandoned'
 GROUP BY AbandonmenT_Reason
 ORDER BY 2 DESC;

 --Users by Purchase Category
 SELECT Purchase_Category, COUNT(*) AS Total_Category
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Abandoned'
 GROUP BY Purchase_Category
 ORDER BY 2 DESC;

 --Top 10 Abandoned Cart Status by Purchase Category
 SELECT TOP 10 Purchase_Category, COUNT(*) AS Total_Category
 FROM MagicMade.Cart_Records
 WHERE Cart_Status = 'Abandoned'
 GROUP BY Purchase_Category
 ORDER BY 2 DESC;

 --Users By Referral Medium
SELECT Referral_Medium, Cart_Status,COUNT(*) AS Total_Number
FROM MagicMade.Cart_Records
--WHERE Cart_Status = 'Abandoned'
GROUP BY Referral_Medium,Cart_Status
ORDER BY Total_Number DESC;

--Users by Device Type
SELECT Device_Type,COUNT(*) AS Number
FROM MagicMade.Cart_Records
WHERE Cart_Status = 'Abandoned'
GROUP BY Device_Type
ORDER BY Number DESC;

--Create ranges for session Duration
SELECT Session_Range, Count(*) AS Total_Number
FROM 
(SELECT 
CASE
	WHEN Session_Duration>=5 and Session_Duration <= 28 THEN '5-28'
	WHEN Session_Duration>=29 and Session_Duration <= 51 THEN '29-51'
	WHEN Session_Duration>=52 and Session_Duration <= 74 THEN '52-74'
	WHEN Session_Duration>=75 and Session_Duration <= 97 THEN '75-97'
	ELSE '98-120'
END AS Session_Range
FROM MagicMade.Cart_Records
WHERE Cart_Status = 'Abandoned'
) AS Ranges
GROUP BY Session_Range
ORDER BY 2 DESC;

--Connect Database to PowerBI For Visualiation


