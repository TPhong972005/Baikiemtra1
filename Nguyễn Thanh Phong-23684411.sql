CREATE DATABASE QLBH15
go
USE QLBH15;

-- Tạo bảng Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);

-- Tạo bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    UnitInStock INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Tạo bảng Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50)
);

-- Tạo bảng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    City VARCHAR(50)
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5, 2) DEFAULT 0.00,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
----
DROP TABLE Customers
DROP TABLE Employees
DROP TABLE OrderDetails
DROP TABLE Orders
DROP TABLE Products 
DROP TABLE Suppliers
-----SUPPLIERS
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (1, 'Công ty TNHH Alpha')
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (2, 'Công ty CP Beta')
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (3, 'Công ty Gamma')
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (6, 'Công ty Ahihi')
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (4, 'Công ty TNHH Gamma')
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES (5, 'Công ty TNHH HN')
---PRODUCTS
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (6, 'Máy tính MSI', 3, 3200.00, 5)
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (1, 'Máy tính HP Pro', 1, 1200.00, 4)
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (2, 'Bàn phím Razer', 2, 90.00, 15)
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (3, 'Chuột Logitech MX', 3, 50.00, 3)
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (4, 'Màn hình LG 27"', 4, 250.00, 8)
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES (5, 'Loa Bluetooth JBL', 5, 150.00, 2)
---CUSTOMERS
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (6, 'Công ty ĐH CÔNG NGHIỆP', '12 Đường Lê Lợi', 'Madrid', 'Madrid', 'Spain')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (7, 'Công ty ĐH CÔNG NGHIỆP', '12 Đường Lê Lợi', 'Madrid', 'Madrid', 'Spain')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (1, 'Công ty TNHH Minh Anh', '123 Đường Lê Lợi', 'Madrid', 'Madrid', 'Spain')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (2, 'Công ty CP Nam Việt', '456 Đường Nguyễn Huệ', 'Munich', 'Bavaria', 'Germany')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (3, 'Công ty Hoàng Gia', '789 Đường Trần Phú', 'Hà Nội', 'Miền Bắc', 'Việt Nam')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (4, 'Công ty TNHH Thế Giới', '101 Đường Võ Thị Sáu', 'Melbourne', 'Victoria', 'Australia')
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES (5, 'Công ty CP Đông Tây', '202 Đường Phạm Ngũ Lão', 'Manchester', 'North West', 'UK')
---
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City)
VALUES (5, 'Nguyễn', 'Thanh Phong', '1980-07-09', 'Hội An')
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City)
VALUES (6, 'Fuller', 'Thanh Phong', '1980-07-09', 'Đà Nẵng')
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City)
VALUES (4, 'Fuller', 'Thanh Hoang', '1980-07-09', 'Hội An')
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City)
VALUES (3, 'Peter', 'Thanh Ngân', '1980-03-29', 'Bình ĐỊnh')

---
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (1, 6, 5, '1997-07-10')
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (2, 7, 5, '1997-01-10')
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (3, 6, 6, '1997-04-12')
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (4, 6, 6, '1996-07-10')
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (5, 5, 5, '1996-12-07')
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (6, 7, 3, '1996-07-16')
---
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (1, 6, 3200.00, 2, 30.00)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (2, 6, 3200.00, 1, 15.00)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (3, 1, 1200.00, 1, 10.00)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (4, 1, 1200.00, 1, 0.00)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (5, 2, 1200.00, 1, 0.00)
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (6, 3, 1000.00, 1, 0.00)
---
----
USE QLBH15
GO
----đến giờ viết truy vấn 
---cau 1
Select Customers.CustomerID ,CompanyName, Address, OrderID, OrderDate
from Customers, Orders
where Customers.CustomerID = orders.CustomerID
and year (OrderDate) = 1997 and MONTH (orderdate) = 7
order by CustomerID , orderDate desc
---cau 2
Select Customers.CustomerID ,CompanyName, Address, OrderID, OrderDate
from Customers, Orders
where Customers.CustomerID = Orders.CustomerID
and OrderDate between '1997-01-01' and '1997-01-15'
order by CustomerID, OrderDate desc
---cau 3
select Products.ProductID, ProductName
from Products, OrderDetails, Orders
where Products.ProductID = OrderDetails.ProductID
And OrderDetails.OrderID = Orders.OrderID
And OrderDate = '1996-07-16'
---CAU4
SELECT Orders.OrderID, CompanyName, OrderDate
FROM Customers, Orders
WHERE Customers.CustomerID = Orders.CustomerID
AND YEAR(OrderDate) = 1997
AND MONTH(OrderDate) IN (4, 9)
ORDER BY CompanyName, OrderDate DESC
---CAU 5
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName, OrderDate
FROM Employees, Orders
WHERE Employees.EmployeeID = Orders.EmployeeID
AND LastName = 'FulLer'
--- cau 6
SELECT Products.ProductID, ProductName, SupplierID
FROM Products, OrderDetails, Orders
WHERE Products.ProductID = OrderDetails.ProductID
AND OrderDetails.OrderID = Orders.OrderID
AND SupplierID IN (1, 3, 6)
AND YEAR(OrderDate) = 1997
AND MONTH(OrderDate) BETWEEN 4 AND 6
ORDER BY SupplierID, ProductID
--- CAU 7
SELECT *
FROM Products,OrderDetails
WHERE Products.UnitPrice =OrderDetails.Unitprice 
--- cau 8
SELECT Products.ProductID, ProductName
FROM Products, OrderDetails
WHERE Products.ProductID = OrderDetails.ProductID
AND OrderDetails.OrderID = 10248
---cau 9
SELECT DISTINCT Employees.EmployeeID, LastName, FirstName
FROM Employees, Orders
WHERE Employees.EmployeeID = Orders.EmployeeID
AND YEAR(OrderDate) = 1996 AND MONTH(OrderDate) = 7
--- CAU 10 
SELECT Products.ProductID, ProductName, Orders.OrderID, OrderDate, Customers.CustomerID, 
       OrderDetails.UnitPrice, Quantity, Quantity * OrderDetails.UnitPrice AS Total
FROM Products, OrderDetails, Orders, Customers
WHERE Products.ProductID = OrderDetails.ProductID
AND OrderDetails.OrderID = Orders.OrderID
AND Orders.CustomerID = Customers.CustomerID
AND YEAR(OrderDate) = 1996 AND MONTH(OrderDate) = 12
AND DATEPART(WEEKDAY, OrderDate) IN (7, 1)
ORDER BY ProductID, Quantity DESC
--- CAU 11
SELECT Employees.EmployeeID, LastName + ' ' + FirstName AS EmployeeName, 
       Orders.OrderID, OrderDate, Products.ProductID, Quantity, OrderDetails.UnitPrice, 
       Quantity * OrderDetails.UnitPrice AS Total
FROM Employees, Orders, OrderDetails, Products
WHERE Employees.EmployeeID = Orders.EmployeeID
AND Orders.OrderID = OrderDetails.OrderID
AND OrderDetails.ProductID = Products.ProductID
AND YEAR(OrderDate) = 1996
---CAU 12
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) = 12 AND DATEPART(WEEKDAY, OrderDate) = 7
---CAU 13
SELECT *
FROM Employees 
LEFT JOIN Orders  ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.OrderID IS NULL
--CAU 14
SELECT *
FROM Products 
LEFT JOIN OrderDetails  ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.OrderID IS NULL
--cau 15
SELECT *
FROM Customers 
LEFT JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL

