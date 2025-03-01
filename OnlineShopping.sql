CREATE DATABASE OnlineShopping;
USE OnlineShopping;

CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Category VARCHAR(50) DEFAULT 'new',
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    OrderDate DATE,
    Total_Amount DECIMAL(10,2),
    Status VARCHAR(50),
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Order_Details (
    Order_Details_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Supplier (
    ID INT PRIMARY KEY,
    Contact_Info VARCHAR(255),
    Name VARCHAR(100)
);

CREATE TABLE Product_Supply (
    Product_ID INT,
    Supp_ID INT,
    PRIMARY KEY (Product_ID, Supp_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Supp_ID) REFERENCES Supplier(ID)
);

INSERT INTO Customer (ID, Name, Email, Phone, Address) VALUES
(1, 'Ahmed', 'ahmed@email.com', '1234567890', 'Cairo, Egypt'),
(2, 'Mariam', 'mariam@email.com', '0987654321', 'Alexandria, Egypt');

INSERT INTO Product (Product_ID, Category, Name, Description, Price) VALUES
(1, 'Electronics', 'Laptop', 'Gaming Laptop', 1500.00),
(2, 'Appliances', 'Washing Machine', 'Front Load Washing Machine', 500.00);

INSERT INTO Orders (Order_ID, OrderDate, Total_Amount, Status, Customer_ID) VALUES
(1, '2025-03-01', 1500.00, 'Shipped', 1),
(2, '2025-03-01', 500.00, 'Pending', 2);

INSERT INTO Order_Details (Order_Details_ID, Order_ID, Product_ID, Quantity, Price) VALUES
(1, 1, 1, 1, 1500.00),
(2, 2, 2, 1, 500.00);

INSERT INTO Supplier (ID, Contact_Info, Name) VALUES
(1, 'supplier1@email.com', 'Supplier One'),
(2, 'supplier2@email.com', 'Supplier Two');

INSERT INTO Product_Supply (Product_ID, Supp_ID) VALUES
(1, 1),
(2, 2);

ALTER TABLE Product ADD COLUMN Rating INT DEFAULT 0;
ALTER TABLE Product DROP COLUMN Rating;


