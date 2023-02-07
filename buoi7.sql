--buoi7
Use FptAptechBikeStore

CREATE PROCEDURE display_customers 
as
SELECT customer_id, first_name
from sales.customers

EXECUTE display_customers

------
CREATE database btvnbuoi7
go 
use btvnbuoi7
go

CREATE  TABLE TOYS (
ProductCode varchar(5) Primary Key,
TName varchar(30),
Category varchar(30),
Manufacturer varchar(30),
AgeRange varchar(40),
UnitPrice money,
Netweight int,
QtyOnHand int
);

insert into TOYS values (01, 15, 5445, 654, 3-10, 50.000, 500, 20);  
insert into TOYS values (02, 'oto', 'nhua', 'hanghoa', 3-10, 20.000, 200, 10);  

