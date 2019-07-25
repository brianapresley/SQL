/*
use Master; --To switch to master Db
Go --executes command
Drop Database If Exists Quality; --Drop an existing database if it has the same name (cannot have queries running before drop)
Go 
Create Database Quality;
use Quality; --To switch to new DB
Go
Create Table Agents 
(
	ID int not null primary key identity(1, 1),
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Email nvarchar(255) not null,
	ManagerName nvarchar(50) not null,
	Location bit not null,
	Department nvarchar(50) not null,
);
Select * from Agents


	Insert into Agents (FirstName, LastName, Email, ManagerName, Location, Department)
			Values ('Patrick', 'Star', 'patrick.star@noemail.com', 'Unassigned', '0', 'Sales');

Select * From Agents
*/

Create Table Managers (
	ID int not null primary key identity (1, 1),
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null, 

);