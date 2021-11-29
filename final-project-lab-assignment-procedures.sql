/* Final Project Procedures 

--retrieves and displays data
USE myFictionalBusiness;
GO
CREATE PROC spOrders
AS
SELECT * FROM Orders
ORDER BY Date;
GO

EXEC spOrders;


--Takes an input paramater
USE myFictionalBusiness;
GO
CREATE PROC spGetInventory
	@InventoryID int
AS
BEGIN
	SELECT * FROM Inventory
	WHERE InventoryID = @InventoryID;
END
GO
EXEC spGetInventory 1


--take one paramater and returns three output paramaters
USE myFictionalBusiness;
GO
CREATE PROC spCustomerInfo
	@CustomerID int,
	@FName varchar(30) OUTPUT,
	@LName varchar(30) OUTPUT,
	@Email varchar(30) OUTPUT,
	@PhoneNumber varchar(15) OUTPUT
AS
SELECT @FName = FName, @LName = LName, @Email = Email, @PhoneNumber = PhoneNumber
FROM Customers
WHERE CustomerID = @CustomerID
GO
--run
DECLARE @FName varchar(30);
DECLARE @LName varchar(30);
DECLARE @Email varchar(30);
DECLARE @PhoneNumber varchar(30);
EXEC spCustomerInfo 1001, @FName OUTPUT, @LName OUTPUT, @Email OUTPUT, @PhoneNumber OUTPUT;
SELECT @FName AS [First Name], @LName AS [Last Name], @Email AS [Email], @PhoneNumber AS [Phone Number];


--stored procedure that has return value
USE myFictionalBusiness;
GO
CREATE PROC spDesignCount
AS 
DECLARE @Design varchar(200);
SELECT @Design = COUNT(*)
FROM Inventory
RETURN @Design;
GO

DECLARE @Design varchar(200);
EXEC @Design = spDesignCount;
PRINT 'There are' + CONVERT(varchar, @Design) + 'Designs in the Database';
GO


/* Final Project User Defined Functions*/

--create function

USE myFictionalBusiness;
GO
CREATE FUNCTION fnGetDesign
	(@Design varchar(200) = '%')
	RETURNS int
BEGIN
	RETURN (SELECT InventoryId FROM Inventory WHERE Design = @Design);
END;

--use function
GO
SELECT InventoryID, Dimensions, Price FROM Inventory 
WHERE InventoryID = dbo.fnGetDesign('Neck%');

USE myFictionalBusiness;
GO
CREATE FUNCTION fnCustomers
	(@Lname varchar(30) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Customers WHERE LName LIKE @Lname);
GO
SELECT * FROM dbo.fnCustomers('%G%');

/* Final Project Triggers */

/*USE myFictionalBusiness;
SELECT CustomerID, FName, LName, ZipCode INTO TestCustomers
FROM Customers;

CREATE TABLE CustomerLogs(
    CustomerId nchar(5),
    status varchar(30)
	);

CREATE TRIGGER TestCustomers_INSERT ON TestCustomers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID nchar(5)
    SELECT @CustomerID =INSERTED.CustomerId
    FROM INSERTED

    INSERT INTO CustomerLogs
    VALUES(@CustomerId, 'Inserted')
END

INSERT INTO TestCustomers(CustomerID, FName, LName, ZipCode) VALUES ('1007','Ruby', 'Weather','49978');
INSERT INTO TestCustomers(CustomerID, FName, LName, ZipCode) VALUES ('1008','Wilson', 'Leonard','87612');

SELECT * FROM CustomerLogs;

CREATE TRIGGER TestCustomers_DELETE ON TestCustomers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID nchar(5)
    SELECT @CustomerID =DELETED.CustomerId
    FROM DELETED

    INSERT INTO CustomerLogs
    VALUES(@CustomerId, 'Deleted')
END*/

