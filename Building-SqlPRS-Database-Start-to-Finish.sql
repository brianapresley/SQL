/*# PrsDb-Specs: Specifications for PRS Database

The PRS database is designed to support the functions of the Purchase Request System (PRS) for the capstone
project.

--Create Users Table

The `User` table provides two functions:

1. Provides authentication for users wishing to use the PRS
2. Provides ownership for `Request`s created (who created and 'owns' them)

| Name       | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Username   | String  | No   | 30  | Yes    | No  | No  | No  | No  |       |
| Password   | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Firstname  | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Lastname   | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Phone      | String  | Yes  | 12  | No     | No  | No  | No  | No  |       |
| Email      | String  | Yes  | 255 | No     | No  | No  | No  | No  |       |
| IsReviewer | Boolean | No   | N/A | No     | No  | No  | 1   | No  |       |
| IsAdmin    | Boolean | No   | N/A | No     | No  | No  | 1   | No  |       |

Notes:

* The `Username` column must be unique for all rows though it is not the PK.
* The `Phone` columns should be in `xxx-xxx-xxxx` format if provided

use Master; --To switch to master Db
Go --executes command
Drop Database If Exists SqlPRS; --Drop an existing database if it has the same name (cannot have queries running before drop)
Go 
Create Database SqlPRS;
use SqlPRS; --To switch to new SqlPRS Db
Go

Create Table Users 
(
	ID int not null primary key identity(1, 1),
	Username nvarchar(30) unique not null,
	Password nvarchar(30) not null,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar (255),
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,

);

Select * from Users


Insert into Users (Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	Values ('AGraham', 'Password30', 'Aubrey', 'Graham', '404-411-7777', 'Aubrey.Graham@NoEmail.com', '1', '1');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	Values ('LGriffin', 'Password40', 'Lois', 'Griffin', '448-345-6789', 'Lois.Griffin@NoEmail.com', '1', '0');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	Values ('SGriffin', 'Password6', 'Stewie', 'Griffin', '407-234-6789', 'Stewie.Griffin@NoEmail.com', '1', '0');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('LRogers', 'Password4', 'Leon', 'Rogers', '513-987-6789', 'Leon.Rogers@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('PLewis', 'Password47', 'Penney', 'Lewis', '543-345-2367', 'Penney.Lewis@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('CKnott', 'Password11', 'Charles', 'Knott', '513-444-4000', 'Charles.Knott@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('SPaul', 'Password18', 'Susanna', 'Paul', '808-787-4567', 'Susanna.Paul@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('KSandlin', 'Password10', 'Kelly', 'Sandlin', '598-367-3667', 'Kelly.Sandlin@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('JBartlett', 'Password12', 'James', 'Bartlett', '513-345-4567', 'James.Bartlett@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('ORandolph', 'Password8', 'Otis', 'Randolph', '513-878-0000', 'Otis.Randolph@NoEmail.com');
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	Values ('SParker', 'Password28', 'Stacey', 'Parker', '513-987-6543', 'Stacey.Parker@NoEmail.com');


Select * From Users



--Create Vendors Table

The `Vendor` table provides one function:

1. Provides the name of the vendor from whom products are acquired

| Name       | Type    | Null | Len | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | --- | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A | Yes    | Yes | No  | No  | Yes | 1,1   |
| Code       | String  | No   | 30  | Yes    | No  | No  | No  | No  |       |
| Name       | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| Address    | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| City       | String  | No   | 30  | No     | No  | No  | No  | No  |       |
| State      | String  | No   | 2   | No     | No  | No  | No  | No  |       |
| Zip        | String  | No   | 5   | No     | No  | No  | No  | No  |       |
| Phone      | String  | Yes  | 12  | No     | No  | No  | No  | No  |       |
| Email      | String  | Yes  | 255 | No     | No  | No  | No  | No  |       |

Notes:

1. The `Code` column must be unique for all rows though it is not the PK.


Create Table Vendors
(
	ID int not null primary key identity(1, 1),
	Code nvarchar(30) unique not null,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12),
	Email nvarchar(255),


);

Select * From Vendors;
	 
Insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
				Values ('1001', 'Phone Co.', '857 Maple Street', 'Columbus', 'OH', '78742', '888-808-9900', 'Phone.Company@NoEmail.com'),
						('1002', 'Food Co.', '1107 Turtle Road', 'Alphabet', 'FL', '48798', '877-404-7400', 'Food.Company@NoEmail.com'),
						('1003', 'Utility Co.', '22 Forester Drive', 'Dorsey', 'PA', '12554', '888-476-8000', 'Utility.Company@NoEmail.com'),
						('1004', 'Water Co.', '3223 Parish Drive', 'Little', 'VA', '85744', '800-988-6400', 'Water.Company@NoEmail.com'),
						('1005', 'Power Co.', '12000 Savannah Avenue', 'Hollytown', 'RI', '45221', '877-420-9800', 'Power.Company@NoEmail.com'),
						('1006', 'Uniform Co.', '453 Arbor Road', 'Dayton', 'OH', '96877', '866-874-4500', 'Uniform.Company@NoEmail.com'),
						('1007', 'Trucking Co.', '1344 Roscoe Road', 'Earl', 'KS', '87457', '800-587-9870', 'Trucking.Company@NoEmail.com'),
						('1008', 'Supply Co.', '27 Lotus Hill Place', 'Cheyenne', 'NJ', '32533', '888-994-9000', 'Supply.Company@NoEmail.com'),
						('1009', 'Cleaning Co.', '9878 Purple Lane', 'Kelvin', 'TX', '77411', '850-652-9897', 'Cleaning.Company@NoEmail.com');

		Select * From Vendors


Create Product Table

The `Product` table provides two functions:

1. Provides the list of products that can be added to a `RequestLine`
2. Provides the name and price of products

| Name       | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----       | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id         | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| PartNbr    | String  | No   | 30   | Yes    | No  | No  | No  | No  |       |
| Name       | String  | No   | 30   | No     | No  | No  | No  | No  |       |
| Price      | Decimal | No   | 11,2 | No     | No  | No  | No  | No  |       |
| Unit       | String  | No   | 30   | No     | No  | No  | No  | No  |       |
| PhotoPath  | String  | Yes  | 255  | No     | No  | No  | No  | No  |       |
| VendorId   | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to Vendor |

Notes:

1. The `PartNbr` column must be unique for all rows though it is not the PK. It 
represents the vendors identifier for the product
2. The `Name` is the column displayed to the user and is the name of the product
given by the company.
3. The `VendorId` points to the vendor that supplies the product.



Create Table Product
(
	ID int not null primary key identity (1, 1),
	PartNbr nvarchar(30) unique not null,
	Name nvarchar(30) not null,
	Price decimal (11, 2) not null,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255),
	VendorID int foreign key references Vendors(ID), 

);

Select * From Product;

Select * From vendors;


Insert into Product (PartNbr, Name, Price, Unit, VendorID)
	Values ('1002A1', 'Toaster', '43.99', 'each', '2'),
			('1003A1', 'Satellite', '389.99', 'each', '3'),
			('1004A1', 'Filter', '54.99', 'each', '4'),
			('1005A1', 'Fuse', '4.99', 'each', '5'),
			('1006A1', 'Khakis', '19.99', 'each', '6'),
			('1007A1', 'Tire', '89.99', 'each', '7'),
			('1008A1', 'Notebook', '1.99', 'each', '8'),
			('1009A1', 'Vacuum', '29.99', 'each', '9'),
			('1001A2', 'Receiver', '44.99', 'each', '1'),
			('1002A2', 'Apple Sauce', '2.99', 'each', '2'),
			('1003A2', 'Router', '150.00', 'each', '3'),
			('1004B2', 'Hot Water Heater', '899.99', 'each', '4'),
			('1005B1', 'Circuit', '84.99', 'each', '5'),
			('1006B1', 'Hat', '9.99', 'each', '6'),
			('1007C1', 'Brakes', '32.99', 'each', '7'),
			('1008C2', 'Computer', '649.99', 'each', '8'),
			('1009B1', 'Mop Bucket', '26.99', 'each', '9');

Select * From Product;


## Request Table

The `Request` table is the heart of the PRS. Together with a collection of `RequestLine`
rows makes up the user's request of products. It has xxx functions:

1. Provides the grouping for all the products being requested.
2. Provides the user that created the request
3. Provides the total amount of all the products being requested

| Name            | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| Description     | String  | No   | 80   | No     | No  | No  | No  | No  |       |
| Justification   | String  | No   | 80   | No     | No  | No  | No  | No  |       |
| RejectionReason | String  | Yes  | 80   | No     | No  | No  | No  | No  |       |
| DeliveryMode    | String  | No   | 20   | No     | No  | No  | Yes | No  | Def 'Pickup' |
| Status          | String  | No   | 10   | No     | No  | No  | Yes | No  | Def 'NEW'    |
| Total           | Decimal | No   | 11,2 | No     | No  | No  | Yes | No  | Def 0 |
| UserId          | Integer | No   | N/A  | No     | No  | Yes | No  | No  | FK to User |

Notes:

* `RejectionReason` must be provided when the request is rejected
* The `UserId` is automatically set to the Id of the logged in user.
* Neither `Status` nor `Total` may be set by the user. These are set by the application only.
* The `Total` is auto calculated by adding up all the lines currently on the request


Create table Request
(
	ID int not null primary key identity(1, 1),
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80),
	DeliveryMode nvarchar(20) not null default 'Pickup',
	Status nvarchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserID int not null foreign key references Users(ID),
);

Select * From Request;
Select * From Users;




Insert Into Request (Description, Justification, UserID)
	Values ('First Request', 'Needed for survival', '1'),
			('Second Request', 'Boss told me to', '8'),
			('Third Request', 'My job is hard', '1'),
			('Fourth Request', 'HELP ME', '4'),
			('Fifth Request', 'We need to tidy up', '11'),
			('Sixth Request', 'My job is boring', '9'),
			('Seventh Request', 'The building is empty', '12');

Select * From Request;



## RequestLine Table

The `RequestLine` table implements a many-to-many relationship between the request and product tables. Each request
can have multiple requestLines and every product can have multiple lines. This means that every request can be related
to multiple products and each product can be related to multiple requests.

The `RequestLine` holds all the products for a particular request.

| Name            | Type    | Null | Len  | Unique | PK  | FK  | Def | Gen | Notes |
| ----            | ----    | ---- | ---  | ------ | --- | --- | --- | --- | ----- |
| Id              | Integer | No   | N/A  | Yes    | Yes | No  | No  | Yes | 1,1   |
| RequestId       | Integer | No   | N/A  | No     | No  | Yes | No  | No  |       |
| ProductId       | Integer | No   | N/A  | No     | No  | Yes | No  | No  |       |
| Quantity        | Integer | No   | N/A  | No     | No  | No  | Yes | No  | def to 1 |

Notes:

* `Quantity` must be greater than or equal to zero (cannot be negative)
-- Quantity constraints *Research!!


Create Table RequestLine
(
	ID int not null primary key identity(1, 1),
	RequestID int not null foreign key references Request(ID),
	ProductID int not null foreign key references Product(ID),
	Quantity int not null default 1,
);

Select * From RequestLine;



Select * From Request;
Select * From Product;


Insert into RequestLine (RequestID, ProductID, Quantity)
		Values ('1', '2', '3'),
				('1', '4', '1'),
				('1', '3', '1'),
				('4', '2', '1'),
				('4', '6', '8'),
				('2', '4', '2'),
				('5', '7', '40'),
				('4', '3', '1'),
				('6', '5', '8'),
				('7', '9', '100');

Select * From RequestLine;

*/

--To Join all tables together

Select
		Cast(R.ID as char) as 'ID', R.Description, R.Status,
		Concat(U.Firstname, ' ', U.Lastname) as 'Name',
		P.Name, Cast(RL.Quantity as nvarchar(10)) as 'Qty',
		Cast (P.Price as nvarchar(10)) as 'Price', (RL.Quantity * P.Price) as 'Subtotal'
 
	From Request R
	join RequestLine RL
		on RL.RequestID = R.ID
	join Product P
		on P.ID = RL.ProductID
	join Users U
		on U.ID = R.UserID
Where R.ID = 1


Union
select '', '', '', '', '', '', 'TOTAL:', sum(RL.Quantity * P.Price) as 'Total'
	From Request R
		join RequestLine RL
			on RL.RequestID = R.ID
		join Product P
			on P.ID = RL.ProductID
		join Users U
			on U.ID = R.UserID
	Where R.ID = 1
		group by R.ID, R.Description

order by ID desc











