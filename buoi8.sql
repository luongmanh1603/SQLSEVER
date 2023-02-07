--buoi8

Create database StoreOrder1
go
use StoreOrder1

CREATE TABLE Customer (
    CustomerID int PRIMARY KEY IDENTITY(1,1) ,
	CustomerName varchar(30),
	Addressn varchar(100),
	Phone varchar(12),
)

CREATE TABLE Product(
    ProductID int PRIMARY KEY IDENTITY(1,1),
	ProductName varchar(30),
	Description varchar(40),
	Units varchar(10),
	UnitsPrice money,
)
CREATE TABLE OrderList(
    OrderID int PRIMARY KEY,
	OrderDate date,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID)
)
CREATE TABLE OrderItem(
    ItemID int ,
    OrderID int FOREIGN KEY REFERENCES OrderList(OrderID),
	ProductID int FOREIGN KEY REFERENCES Product(ProductID),
	UnitsPrice money,
	Amount int,
	PRIMARY KEY (ItemID,OrderID)
)
GO
--2
INSERT INTO Customer(CustomerName,Addressn,Phone)
VALUES ('Nguyen Van A','111 Nguyen Trai, Thanh Xuan, HN',987654321),
       ('Nguyen Van B','7 Khuong Dinh, Thanh Xuan, HN',123456789),
	   ('Nguyen Van C','154 Nguyen Huy Tuong, Thanh Xuan, HN',432156789)

INSERT INTO Product(ProductName,Description, Units, UnitsPrice)
VALUES ('May Tinh T450','May nhap moi','Chiec',1000),
       ('Dien thoai Nokia5670','Dien thoai dang hot','Chiec',200),
	   ('May In Samsung 450','May in dang e','Chiec',100)
GO

INSERT INTO OrderList(OrderID, OrderDate, CustomerID)
VALUES (123, '2018-11-09', 1),
	   (234, '2019-10-02', 2),
	   (345, '2019-11-09', 3)
GO

INSERT INTO OrderItem
VALUES (1,123,1,1000,1),
       (2,123,2,200,2),
	   (3,123,3,100,1),
	   (1,234,1,1000,3),
	   (2,345,2,200,5)
GO
--4

select * from Customer

select * from Product

select * from OrderList

--5
--thứ tự alphabet
select * from Customer
order by CustomerName
--thứ tự giảm dần
select * from Product
order by UnitsPrice Desc
--a đã mua
select p.ProductName
From Product p 
join OrderItem oi On p.ProductID = oi.ProductID
join OrderList ol On oi.OrderID = ol.OrderID
join Customer c On c.CustomerID = ol.CustomerID
WHERE CustomerName = 'Nguyen Van A'
group by p.ProductName

--6

--số khách hàng đã mua ở cửa hàng
select COUNT(CustomerId) TotalCustomer
from Customer

--số sản phẩm
select COUNT(ProductId) totalProduct
from Product

--tổng tiền 
select sum(oi.UnitsPrice * oi.Amount) tongtien
from OrderItem oi
join OrderList ol on oi.OrderID = ol.OrderID
group by oi.OrderID

select * from OrderItem

select * from OrderList