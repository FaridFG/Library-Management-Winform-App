create database Library;

use Library;

create table Genres (
	Id int identity primary key,
	Name nvarchar (255) unique not null
);

create table Authors (
	Id int identity primary key,
	FullName nvarchar (255) not null,
	DateOfBirth date,
	PlaceOfBirth nvarchar (100),
	Email varchar (255) not null unique
);

create table Books (
	Id int identity primary key,
	Name nvarchar (255) not null,
	Price decimal (10, 2) not null,
	Quantity int default (0),
	Available int,
	Rented int,
	GenreId int foreign key references Genres (Id),
	AuthorId int foreign key references Authors (Id)
);

alter table Books
add isRented bit default 'False' not null;

alter table Books
drop column Available;

alter table Books
drop column Rented;

create table Customers (
	Id int identity primary key,
	Name nvarchar (100) not null,
	Surname nvarchar (100),
	Email varchar (255) not null unique,
	PhoneNum varchar (50)
);

create table Employees (
	Id int identity primary key,
	Name nvarchar (100) not null,
	Surname nvarchar (100),
	Email varchar (255) not null unique,
	Username varchar (255) not null unique,
	Password nvarchar (255) not null,
	isAdmin bit default 'false' not null,
	isConfirmed bit default 'false' not null,
	isDeleted bit default 'false' not null
);

create table Rents (
	Id int identity primary key,
	RentTime datetime not null,
	RentDue datetime not null,
	ReturnTime datetime not null,
	Fine decimal (5, 2),
	BookId int foreign key references Books (Id),
	CustomerId int foreign key references Customers (Id),
	EmployeeId int foreign key references Employees (Id)
);

alter table Rents
drop column ReturnTime;

alter table Rents
add ReturnTime date not null

create table Sales (
	Id int identity primary key,
	SaleTime datetime not null,
	BookId int foreign key references Books (Id),
	CustomerId int foreign key references Customers (Id),
	EmployeeId int foreign key references Employees (Id)
);

insert into Genres
values ('Science'), ('Science Fiction'), ('Crime')

insert into Authors (FullName, Email)
values ('Steven Strogatz', 'steven@gmail.com'),
	   ('Mark Arax', 'arax@gmail.com'),
	   ('Adam Higginbotham', 'higg_adam@gmail.com'),
	   ('Chris Carberry', 'carberry@gmail.com');

insert into Books
values ('Infinite Powers', 18.40, 30, 1, 1, 'False');

insert into Books
values ('The Dreamt Land', 22.80, 50, 2, 2, 'False'),
	   ('Midnight in Chernobyl', 16, 80, 2, 3, 'False'),
	   ('Alcohol in Space', 28.90, 20, 2, 4, 'False');

select * from Books;

create table RentBooks (
	Id int identity primary key,
	RentId int foreign key references Rents (Id),
	BookId int foreign key references Books (Id),
	BookQuantity int
);

alter table Rents
add isDeleted bit default 'false' not null