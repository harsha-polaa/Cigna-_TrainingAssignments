CREATE database Online_store_Invetory;

CREATE TABLE Products(
  ProductId NUMBER PRIMARY KEY,
  Productname VARCHAR2(25) NOT NULL,
  Category VARCHAR2(25) NOT NULL,
  Price NUMBER CHECK(Price>0),
  Stk_Quantity NUMBER DEFAULT 0
);

CREATE TABLE Customers(
CusID NUMBER PRIMARY KEY,
First_Name VARCHAR2(20) NOT NULL,
Last_Name VARCHAR2(20) NOT NULL,
Email VARCHAR2(50) UNIQUE,
Phone_no VARCHAR2(15)
);

CREATE TABLE Orders(
OrderID NUMBER PRIMARY KEY,
OrderDate DATE DEFAULT SYSDATE,
CusID NUMBER,
Order_amnt NUMBER CHECK(Order_amnt>0),
CONSTRAINT fk_customer FOREIGN KEY (CusID) REFERENCES Customers(CusID)
);

CREATE TABLE OrderDetails(
Ord_detail VARCHAR2(50) PRIMARY KEY,
Quantities NUMBER CHECK(Quantities>0),
OrderID NUMBER NOT NULL,
ProductId NUMBER NOT NULL,
CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
CONSTRAINT fk_product FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);


INSERT INTO Products VALUES (101, 'Laptop', 'Electronics', 60000, 10);
INSERT INTO Products VALUES (102, 'Mouse', 'Electronics', 500, 50);
INSERT INTO Products VALUES (103, 'Keyboard', 'Electronics', 1500, 30);
INSERT INTO Products VALUES (104, 'Headphones', 'Audio', 2500, 20);


INSERT INTO Customers VALUES (1, 'Harsha', 'Pola', 'harsha@gmail.com', '9876543210');
INSERT INTO Customers VALUES (2, 'Priya', 'Sharma', 'priya@gmail.com', '9988776655');
INSERT INTO Customers VALUES (3, 'Ravi', 'Kumar', 'ravi@gmail.com', '9123456780');

INSERT INTO Orders VALUES (201, SYSDATE, 1, 60500);
INSERT INTO Orders VALUES (202, SYSDATE, 2, 2500);
INSERT INTO Orders VALUES (203, SYSDATE, 3,  1500);

INSERT INTO OrderDetails VALUES ('OD1', 1, 201, 101);  
INSERT INTO OrderDetails VALUES ('OD2', 1, 201, 102);  
INSERT INTO OrderDetails VALUES ('OD3', 2, 202, 104);  
INSERT INTO OrderDetails VALUES ('OD4', 1, 203, 103);  

--QUERY 1: Retrieve products with low stock (eg: less than 20 units)
SELECT *
FROM Products
WHERE Stock_Quantity < 20;

-- QUERY 2: Calculate the total amount spent by each customer
SELECT C.Customer_ID, SUM(O.Total_Amount) as Amount_Spent
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID;
