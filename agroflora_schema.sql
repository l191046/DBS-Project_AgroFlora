USE MASTER
DROP DATABASE PRJT
CREATE DATABASE PRJT
USE PRJT

CREATE TABLE [Admin] (
	[Login]		varchar(20) NOT NULL,
	[Password]	varchar(20) NOT NULL,

	AdminID		int NOT NULL,
	Fname		varchar(20) NOT NULL,
	Lname		varchar(20) NOT NULL,
	Email		varchar(30),
	CNIC		char(13) NOT NULL,
);

CREATE TABLE Customer (
	[Login]		varchar(20) NOT NULL,
	[Password]	varchar(20) NOT NULL,

	CustomerID	int NOT NULL,
	Fname		varchar(20) NOT NULL,
	Lname		varchar(20) NOT NULL,
	Email		varchar(30),
	[Address]	varchar(30),
	DOB			date,
	Points		int,
	Contact		int,
	CreditCard	char(16)
);

CREATE TABLE Retailer (
	[Login]			varchar(20) NOT NULL,
	[Password]		varchar(20) NOT NULL,

	RetailerID		int NOT NULL,
	Fname			varchar(20) NOT NULL,
	Lname			varchar(20) NOT NULL,
	Email			varchar(30),
	[Address]		varchar(30),
	NTN				int NOT NULL,
	Contact			int,
	BankAccount		varchar(20) NOT NULL
);

CREATE TABLE Product (
	ProductID		int NOT NULL,
	RetailerID		int	 NOT NULL,
	[Name]			varchar(40) NOT NULL,
	Price			float NOT NULL,
	CategoryID		int DEFAULT 0,
	Stock			int,
	[Description]	varchar(100),
	DateAdded		date NOT NULL,
	[Status]		bit
);

CREATE TABLE Category (
	categoryID	int NOT NULL,
	[name]		varchar(25)
);

CREATE TABLE Rating (
	productID	int NOT NULL,
	customerID	int NOT NULL,
	score		int,
	review		varchar(100)
);

CREATE TABLE Purchase (
	PurchaseID	int NOT NULL,
	CustomerID	int NOT NULL,
	ProductID	int NOT NULL,
	Quantity	int NOT NULL,
	Price		int NOT NULL,
	[Date]		datetime NOT NULL,
	PaymentType	int
);

CREATE TABLE PaymentType (
	[PaymentTypeID]	int NOT NULL,
	[Name]			varchar(25)
);

--PRIMARY KEYS
ALTER TABLE [Admin] 
ADD CONSTRAINT  PK_Admin Primary Key (AdminID);

ALTER TABLE [Customer] 
ADD CONSTRAINT  PK_Customer PRIMARY KEY (CustomerID);

ALTER TABLE [Retailer] 
ADD CONSTRAINT  PK_Retailer PRIMARY KEY (RetailerID);

ALTER TABLE Product
ADD CONSTRAINT PK_Product PRIMARY KEY (productID);

ALTER TABLE Category
ADD CONSTRAINT PK_Category PRIMARY KEY (categoryID);

ALTER TABLE Rating
ADD CONSTRAINT PK_Rating PRIMARY KEY (productID, customerID);

ALTER TABLE [Purchase] 
ADD CONSTRAINT  PK_Purchase PRIMARY KEY (PurchaseID);

ALTER TABLE [PaymentType] 
ADD CONSTRAINT  PK_PaymentType PRIMARY KEY (PaymentTypeID);

--FOREIGN KEYS
ALTER TABLE Product ADD CONSTRAINT FK_Product_Retailer
FOREIGN KEY (retailerID) REFERENCES Retailer(RetailerID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Product ADD CONSTRAINT FK_Product_Category
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
ON DELETE SET DEFAULT ON UPDATE CASCADE;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_PaymentType
FOREIGN KEY (PaymentType) REFERENCES PaymentType(PaymentTypeID)
ON DELETE SET NULL ON UPDATE CASCADE;

--CHECKS
ALTER TABLE Rating ADD CONSTRAINT CHK_Score
CHECK (Score BETWEEN 1 AND 5);

ALTER TABLE Product ADD CONSTRAINT CHK_Price
CHECK (Price >= 0);



