--GROUP THETA-JOIN
--19L-1046
--19L-1066
--19L-2359

USE MASTER
GO
DROP DATABASE AGROFLORA
GO
CREATE DATABASE AGROFLORA
GO
USE AGROFLORA
GO

--CREATING TABLES
CREATE TABLE [Admin] (
	[UserName]	varchar(20) NOT NULL,
	[Password]	varchar(20) NOT NULL,

	AdminID		int NOT NULL,
	Fname		varchar(20) NOT NULL,
	Lname		varchar(20) NOT NULL,
	Email		varchar(30),
	CNIC		char(13) NOT NULL UNIQUE,
);

CREATE TABLE Customer (
	[UserName]	varchar(20) NOT NULL,
	[Password]	varchar(20) NOT NULL,

	CustomerID	int NOT NULL,
	Fname		varchar(20) NOT NULL,
	Lname		varchar(20) NOT NULL,
	Email		varchar(30),
	[Address]	varchar(50),
	DOB			date,
	Points		int,
	Contact		char(11),
	CreditCard	char(16)
);

CREATE TABLE Retailer (
	[UserName]		varchar(20) NOT NULL,
	[Password]		varchar(20) NOT NULL,

	RetailerID		int NOT NULL,
	[Name]			varchar(50) NOT NULL,
	Email			varchar(30),
	[Address]		varchar(50),
	NTN				char(13) UNIQUE,
	Contact			char(11),
	BankAccount		varchar(20)
);

CREATE TABLE Product (
	ProductID		int NOT NULL,
	RetailerID		int	 NOT NULL,
	[Name]			varchar(40) NOT NULL,
	Price			float NOT NULL,
	CategoryID		int DEFAULT 6,
	Stock			int,
	[Description]	varchar(300),
	DateAdded		date NOT NULL,
	[Image]			varchar(200),
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
	review		varchar(200)
);

CREATE TABLE Purchase (
	PurchaseID	int NOT NULL,
	CustomerID	int NOT NULL,
	ProductID	int NOT NULL,
	Quantity	int NOT NULL,
	[Date]		datetime NOT NULL,
	PaymentType	int DEFAULT 2
);

CREATE TABLE PaymentType (
	[PaymentTypeID]	int NOT NULL,
	[Name]			varchar(25)
);
GO

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
GO

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
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_PaymentType
FOREIGN KEY (PaymentType) REFERENCES PaymentType(PaymentTypeID)
ON DELETE SET NULL ON UPDATE CASCADE;
GO

--CHECKS
ALTER TABLE Rating ADD CONSTRAINT CHK_Score
CHECK (Score BETWEEN 1 AND 5);

ALTER TABLE Product ADD CONSTRAINT CHK_Price
CHECK (Price >= 0);

ALTER TABLE Product ADD CONSTRAINT CHK_Stock
CHECK (Stock >= 0);
GO
--DATA
Insert Into [Admin] ([UserName],[Password],AdminID,Fname,Lname,Email,CNIC) values
('sukhanamir','cruchyrock478',1,'Sukhan','Amir','sukhanamir23@gmail,com','3520245930124'),
('abdulmuneem','poniacbandit39',2,'Rana','Abdul Muneem','abdulmuneem76@gmail.com','3520258491028'),
('raziahmed', 'inferno889', 3,'Razi','Ahmed','raziahmed98@gmail.com','3520285940314');

Insert Into [Customer] ([UserName],[Password],CustomerID,Fname,Lname,Email,[Address],DOB,Points,Contact,CreditCard) values
('abdulsami','rollarcoaster45',4,'Abdul Sami','Butt','abdulsami@outlook.com','378 G3 Johar Town,Lahore ','1978-03-21',0,'03594830126','5940302768943670'),
('hajrazubair','notsoweird23',6,'Hajra','Zubair','hzubair44@gmail.com','44 block A DHA,Karachi ','1999-03-12',0,'03657483296','5746398076571297'),
('ridaahmed','iamoutofpasswords33',8,'Rida','Ahmed','ridaahmed5@gmail.com','984 J1 Wapda Town,Lahore ','2002-12-5',0,'03970543619','9715489065468491'),
('mohsinkhan','tranquialitybase',10,'Mohsin','Khan','mohsinkhan@yahoo.com','44 street 55 Peshawar Cantt,Peshawar ','2001-06-6',0,'0346372895','8493016574839265'),
('RaziAhmad722', 'lalalalala', 1,'Razi','Ahmad', 'razi722@gmail.com' , '122 Cornelia Street', '1998-01-21', 0, '03325215251', '0123456789101112'),
('MunimMuneem', 'Monum', 2,'Rana','AbdulMuneem', 'monum1252@gmail.com' , 'chakk no. 543', '2001-01-21', 0, '03325885251', '0123411189101112'),
('Sukhan123', 'Perplexedhooman', 3,'Sukhan','Khan', 'Sukhan123@gmail.com' , 'F2 block lacas', '2000-01-21', 0, '03366215251', '0123422289101112'),
('AAR123', '12344n', 5,'Ahsan','Abdurrehman', 'aar123@gmail.com' , '123 G block Bahria', '2000-01-31', 0, '03376215251', '0129422289101112'),
('zainRafique21', '19344n', 7,'Zain','Rafique', 'zain123@gmail.com' , '142 F block Valencia Town', '2000-02-23', 0, '03176215251', '0169422289101112'),
('sherry123', '19944n', 9,'Shaheer','Akhtar', 'sherry0123@gmail.com' , '142 F block Johar Town', '2000-05-30', 0, '03176015251', '0169422280001112');

INSERT INTO Retailer VALUES
('Flowershop', '01234567', 1, 'Flowershop', 'flowershop@gmail.com', 'Wapda Town Lahore', '0123456', '03361111111', '12345678910111213'),
('ParadiseGarden', '12345678', 2, 'The Paradise Garden', 'paradisegarden@gmail.com', 'Bahria Town Karachi', '1234567', '03231212121', '12345678910111214'),
('GTerrace', '23456789', 3, 'Green Terrace', 'greenterrace@gmail.com', 'DHA Phase3 Lahore', '2345678', '03341112222', '12345678910111215'), 
('GardenDel', '34567890', 4, 'Garden Delights', 'gardendelights@gmail.com', 'Model Town Lahore', '3456789', '03329998888', '12345678910111216'),
('PKfertilizer', '45678901', 5, 'PK Fertilizers', 'PKfertilizers@gmail.com', 'F2 Islamabad', '4567890', '03235555544', '12345678910111217');

INSERT INTO Category VALUES
(1, 'Plant'),
(2, 'Seeds'),
(3, 'Fertilizer'),
(4, 'Pot'),
(5, 'Tool'),
(6, 'Other');

INSERT INTO Product VALUES
(1, 1, 'Petunia', 50, 1, 100, 'Petunia flower with pot grown locally', '2021-1-17', 'petunia.png', 1),
(2, 1, 'Terminaria', 1200, 1, 50, 'Terminaria plant grown locally', '2021-2-18', 'terminaria.png',1),
(3, 1, 'ShoeFlower', 350, 1, 80, 'Shoeflower grown locally', '2021-2-25', 'shoe_flower.png',1),
(4, 1, 'Ixora', 1100, 1, 40, 'Ixora flower imported', '2021-3-23', 'ixora.png',1),
(5, 2, 'Lemon Grass', 200, 1, 50, 'Healthy bush of lemon grass plant', '2021-4-10', 'lemon_grass.png',1),
(6, 2, 'Euphorbia', 450, 1, 90, 'Fully grown Euphorbia flower', '2021-4-11', 'euphorbia.png', 1),
(7, 2, 'Avocaria', 4750, 1, 30, 'Fully grown Avocaria tree grown locally', '2021-4-13', 'avocaria.png', 1),
(8, 2, 'Rose', 80, 1, 150, 'Rose flower grown locally', '2021-4-23', 'rose.png', 1),
(9,3,'Urea Fertilizer',12000,3,600,'Comes in 50KG bags','2021-01-01', 'urea_fertilizer.png', 1),
(10,3,'Red Pots',300,4,200,'Hangable','2020-05-15', 'red_pots.png', 1),
(11,3,'Tomato Seeds',100,2,700,'Fast Growing','2020-07-16', 'tomato_seeds.png', 1),
(12,3,'Tulip Seeds',700,2,800,'All Season','2021-01-07', 'tulip_seeds.png', 1),
(13,4,'Money Plant',50,1,400,'Indoor Plant','2020-09-22', 'money_plant.png', 1),
(14,4,'Spring Onion Seed',200,2,1200,'Kitchen Garden Item','2021-02-19', 'spring_onion_seeds.png', 1),
(15,4,'Artifical Grass',700,6,400,'Comes in patches of 30 yards','2021-04-01', 'artificial_grass.png', 1),
(16,4,'Shovel',200,5,300,'Tool for digging','2020-04-02', 'shovel.png', 1),
(17, 5, 'Mattock', 1000, 5, 100, 'hand tool used for digging, prying, and chopping', '2021-1-01', 'mattock.png', 1),
(18, 5, 'NPK Fertilizer', 8000, 3, 50, '10kg NPK Fully organic fertilizers', '2021-1-01', 'npk_fertilizer.png', 1),
(19, 5, 'Calcium Fertilizer', 6000, 3, 60, '10kg Calcium rich fertilizers', '2021-1-01', 'calcium_fertilizer.png', 1),
(20, 5, 'Rodenticide', 2000, 5, 20, 'Kill pesky rodents by giving them this poison. 1kg Bag.', '2021-1-01', 'rodenticide.png', 1);

INSERT INTO PaymentType VALUES
(1,'Credit Card'),
(2,'Cash on delivery'),
(3,'Cheque on delivery'),
(4,'Debit Card'),
(5,'Mobile Payment');

INSERT INTO Purchase VALUES
(1, 4, 2, 10, '2021-2-24', 1),
(2, 4, 4, 5, '2021-2-24', 1),
(3, 6, 9, 1, '2021-2-10', 2),
(4, 6, 11, 5, '2021-2-10', 2),
(5, 6, 14, 3, '2021-4-20', 2),
(6, 8, 10, 15, '2021-06-15', 5),
(7, 10, 15, 1, '2021-02-01', 1),
(8, 10, 17, 1, '2021-02-01', 1),
(9, 1, 6, 3, '2021-4-15', 2),
(10, 1, 13, 5, '2021-4-20', 2),
(11, 1, 1, 2,'2021-10-2',1),
(12, 1, 1, 4,'2021-9-2',2),
(13, 2, 3, 1,'2022-8-2',3),
(14, 2, 2, 7,'2022-7-3',1),
(15, 3, 4, 5,'2021-12-21',5),
(16, 5, 7, 1,'2021-12-11',4),
(17, 5, 12, 3,'2021-12-12',3),
(18, 5, 14, 2,'2021-12-25',1),
(19, 7, 16, 1,'2021-12-14',1),
(20, 7, 19, 2,'2021-12-16',5);

INSERT INTO Rating VALUES
(17, 2, 1, 'Not Durable'),
(20, 5, 4, 'Excellent Results'),
(14, 2, 3, 'Satisfactory'),
(14, 7, 5, NULL),
(16, 1, 4, 'A Must Have'),
(12, 4, 5, 'Extremely helpful for my flowershop'),
(20, 2, 4, NULL),
(9, 1, 4, 'Boosted the growth of my plants'),
(18, 1, 3, NULL),
(1, 5, 4, 'One of the most beautiful plants in my garden'),
(8, 5, 3,' The Growth went down in winters'),
(19, 2, 4, NULL),
(5, 3, 5, 'Surely left a happy customer'),
(12, 1, 3, NULL),
(10, 2, 3, 'They are pretty cute')
GO

SELECT * FROM Admin
SELECT * FROM Customer
SELECT * FROM Retailer
SELECT * FROM Product
SELECT * FROM Category
SELECT * FROM Rating
SELECT * FROM PaymentType
SELECT * FROM Purchase
GO


--STORED PROCEDURES

--UTILITY
CREATE PROCEDURE search_customer
@username	varchar(20),
@found		int output
AS
BEGIN
IF	EXISTS (
		   SELECT	*
		   FROM		Customer
		   WHERE	Customer.UserName = @username
		   )
	SET @found = 1
ELSE
	SET @found = 0
END
GO
Create PROCEDURE search_retailer
@username	varchar(20),
@found		int output
AS
BEGIN
IF	EXISTS (
		   SELECT	*
		   FROM		Retailer
		   WHERE	Retailer.UserName = @username
		   )
	SET @found = 1
ELSE
	SET @found = 0
END
GO
Create PROCEDURE search_NTN
@NTN char(13),
@found int output
As
BEGIN
IF
	EXISTS(
			SELECT*
			FROM Retailer
			where Retailer.NTN = @NTN
	)
	SET @found = 1
	ELSE
	SET @found = 0
END
GO

--HOME PAGE
CREATE PROCEDURE get_popular_products
AS
	SELECT	TOP 3 Product.[Name], Product.DateAdded, Product.[Image]
	FROM	Product
			LEFT JOIN Rating ON Product.ProductID = Rating.productID
	WHERE	Rating.score IS NOT NULL
			AND 4 <= (
					 SELECT MIN(R.score)
					 FROM	Rating R
					 WHERE	Product.ProductID = R.productID
					 GROUP BY R.productID
					 )
	GROUP BY	Product.ProductID, Product.[Name], Product.DateAdded, Product.[Image]
GO
CREATE PROCEDURE get_new_products
AS
	SELECT	TOP 3 Product.[Name], Product.DateAdded, Product.[Image]
	FROM	Product
	ORDER BY Product.DateAdded DESC
GO

--SIGN IN PAGES
CREATE PROCEDURE admin_signin
@username	varchar(20),
@password	varchar(20),
@found		int output

AS
	SELECT *
	FROM	[Admin]
	WHERE	[Admin].UserName = @username
			AND [Admin].[Password] = @password
IF @@ROWCOUNT > 0
	SET @found = 1
ELSE
	SET @found = 0
GO
CREATE PROCEDURE retailer_signin
@username	varchar(20),
@password	varchar(20),
@found		int output

AS
	SELECT *
	FROM	Retailer
	WHERE	Retailer.UserName = @username
			AND Retailer.[Password] = @password
IF @@ROWCOUNT > 0
	SET @found = 1
ELSE
	SET @found = 0
GO
CREATE PROCEDURE customer_signin
@username	varchar(20),
@password	varchar(20),
@found		int output

AS
	SELECT *
	FROM	Customer
	WHERE	Customer.UserName = @username
			AND Customer.[Password] = @password
IF @@ROWCOUNT > 0
	SET @found = 1
ELSE
	SET @found = 0
GO

--SIGN UP PAGES
CREATE PROCEDURE customer_signup
@customerID	int,
@fname		varchar(20),
@lname		varchar(20) ,
@username	varchar(20) ,
@email		varchar(30),
@password 	varchar(20),
@address	varchar(50),
@dob		date,
@contact	char(11)
AS

IF @contact = ''
	SET @contact = NULL

INSERT INTO Customer ([UserName], [Password], CustomerID, Fname, Lname, Email, [Address], DOB,Contact, Points)
values (@username, @password, @customerID, @fname, @lname, @email, @address, @dob,@contact, 0)
GO
CREATE PROCEDURE retailer_signup
@username	varchar(20),
@password varchar(20),
@name varchar(20),
@email varchar(30),
@address	varchar(50),
@bankAccount varchar(20),
@contact char(11),
@NTN char(13),
@ID int
AS

INSERT INTO Retailer([UserName],[Password],[Name],Email,[Address], BankAccount,Contact,NTN,RetailerID)
values (@username,@password,@name,@email,@address,@bankAccount,@contact,@NTN,@ID)

GO