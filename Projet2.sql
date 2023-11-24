create database Shop
use Shop

create table Brands (
BrandID int primary key identity(1,1) not null,
BrandName nvarchar(255)
);
select * from Brands
insert into Brands (BrandName)
values
('Samsung'),
('Xiaomi'),
('Apple'),
('Lenovo');

create table Laptops(
LaptopID int  identity(1,1) primary key not null,
LaptopName nvarchar(255),
LaptopPrice decimal,
FK_BrandID int FOREIGN KEY references Brands(BrandID) not null
);
select * from Laptops


insert into Laptops (LaptopName, LaptopPrice,FK_BrandID)
values
('MacBook', 4000, 3),
('SamsungProNotebook', 5000, 1),
('LenovoBook', 6000, 4);

create table Phones (
PhoneID int primary key identity(1,1),
PhoneName nvarchar(255),
PhonePrice decimal,
FK_PhoneID int FOREIGN KEY references Brands(BrandID) not null
);
select * from Phones

insert into Phones (PhoneName, PhonePrice, FK_PhoneID)
values
('Samsung A50', 900,2),
('Apple 15 ProMax', 3500, 1),
('Apple 13 pro', 1500, 2),
('Redmi', 1000, 3);

select Laptops.LaptopID, Brands.BrandName, Laptops.LaptopPrice
from Laptops
inner join Brands on Laptops.FK_BrandID=Brands.BrandID

select Phones.PhoneID, Brands.BrandName, Phones.PhonePrice
from Phones
inner join Brands on Phones.FK_PhoneID=Brands.BrandID

select Laptops.LaptopID, Brands.BrandName, Laptops.LaptopPrice
from Laptops
inner join Brands on Laptops.FK_BrandID=Brands.BrandID
where Brands.BrandName like 'a%';

select * from Laptops
where Laptops.LaptopPrice between 2000 and 5000 or Laptops.LaptopPrice>5000

select * from Phones
where Phones.PhonePrice between 1000 and 1500 or Phones.PhonePrice>1500

select Brands.BrandName, 
count(Laptops.LaptopID) as Laptop_Count
from Brands
LEFT JOIN Laptops on Brands.BrandID = Laptops.FK_BrandID
GROUP BY Brands.BrandName;


select Brands.BrandName, 
count(Phones.PhoneID) as Phones_Count
from Brands
LEFT JOIN Phones on Brands.BrandID = Phones.FK_PhoneID
GROUP BY Brands.BrandName;


