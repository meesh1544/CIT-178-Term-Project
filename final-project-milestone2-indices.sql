USE myFictionalBusiness;
GO
CREATE INDEX idx_ZipCode ON Customers(ZipCode);
GO
Create INDEX idx_Retailer ON Orders(RetailerID);
GO
CREATE INDEX idx_Customer ON Orders(CustomerID);
GO
CREATE INDEX idx_OrderID ON OrderDetails(OrderID);
GO
CREATE INDEX idx_InventoryID ON OrderDetails(InventoryID);