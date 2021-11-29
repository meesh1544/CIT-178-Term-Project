/* Final Project Views 

View #1

UsE myFictionalBusiness;
GO
--updatable view
CREATE VIEW CurrentProducts
AS
SELECT InventoryID, Design, Dimensions, Price
FROM Inventory;
GO

--original data
SELECT * FROM CurrentProducts;

--updating price
GO
UPDATE CurrentProducts
SET Price = 12.99
WHERE InventoryID = 6;
GO

--Display new data
SELECT * FROM CurrentProducts;

View #2

--creating view
GO
CREATE VIEW CustomerOrders
AS
SELECT Customers.CustomerID, FName, LName, PhoneNumber, OrderID, Date 
FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
GO

--view to display data
SELECT * FROM CustomerOrders;

VIEW #3

--create view 
GO
CREATE VIEW CustomerQuantity
AS
SELECT OrderDetailsID, OrderID, InventoryID, Quantity FROM OrderDetails
WHERE Quantity = 5;
GO

--view to display data
SELECT * FROM CustomerQuantity;

View #4

--create view
GO
CREATE VIEW RetailerPlaces
AS
SELECT RetailerID, Name FROM Retailers;
Go

--view to display data
SELECT * FROM RetailerPlaces;*/











