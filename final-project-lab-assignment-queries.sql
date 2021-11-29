/*Query #1

USE myFictionalBusiness;
SELECT ZipCode.City, COUNT(DISTINCT Customers.CustomerID) AS [Customers per City]
FROM Customers JOIN ZipCode ON Customers.ZipCode = ZipCode.ZipCode
GROUP BY ZipCode.City
ORDER BY ZipCode.City DESC;

Query #2

USE myFictionalBusiness;
SELECT OrderID, SUM(Quantity)
FROM OrderDetails
GROUP BY OrderID;

Query #3

SELECT State, CustomerID
FROM Customers as [cust]
Join ZipCode as [ZIP]
ON cust.ZipCode = Zip.ZipCode;

Query #4

SELECT OrderDetailsID, AVG(Quantity) AS [Average Quantity Sold]
FROM OrderDetails
GROUP BY OrderDetailsID
Order BY AVG(Quantity) DESC;*/