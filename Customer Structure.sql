create database cpPlatform_1;
use cpPlatform_1;
-- DROP DATABASE cpPlatform_1;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName varchar(30),
    LastName varchar(30),
    Date_of_Birth datetime,
    City varchar(30),
    State varchar(30),
    Country varchar(30),
    PostalCode bigint,
    Phone bigint,
    Email varchar(30),
    DateEntered datetime
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    IsActive varchar(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    CategoryID INT,
    SubCategory VARCHAR(255),
    Brand VARCHAR(255),
    SalePrice DECIMAL(10, 2),
    MarketPrice DECIMAL(10, 2),
    Type VARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);



CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Phone BIGINT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode varchar(50),
    Country VARCHAR(50),
    Phone varchar(15),
    Email VARCHAR(255)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentType VARCHAR(255),
    IsAllowed varchar(20)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    PaymentID INT,
    OrderDate DATE,
    ShipperID INT,
    ShipDate DATE,
    DeliveryDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SupplierID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);



