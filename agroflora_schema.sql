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
	CNIC		char(13) NOT NULL ,
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
	Contact		char(11),
);

CREATE TABLE Retailer (
	[UserName]		varchar(20) NOT NULL,
	[Password]		varchar(20) NOT NULL,

	RetailerID		int NOT NULL,
	[Name]			varchar(50) NOT NULL,
	Email			varchar(30),
	[Address]		varchar(50),
	NTN				char(13),
	Contact			char(11)
	
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
('default', 'default', 0, 'default', 'default', 'default@default.com', '0123456789123'),
('sukhanamir','cruchyrock478',1,'Sukhan','Amir','sukhanamir23@gmail,com','3520245930124'),
('abdulmuneem','poniacbandit39',2,'Rana','Abdul Muneem','abdulmuneem76@gmail.com','3520258491028'),
('raziahmed', 'inferno889', 3,'Razi','Ahmed','raziahmed98@gmail.com','3520285940314');
GO

Insert Into [Customer] ([UserName],[Password],CustomerID,Fname,Lname,Email,[Address],DOB,Contact) values
('default', 'default', 0, 'default', 'default', 'default@default.com', 'default', '2000-01-01', '01234567891'),
('abdulsami','rollarcoaster45',4,'Abdul Sami','Butt','abdulsami@outlook.com','378 G3 Johar Town,Lahore ','1978-03-21','03594830126'),
('hajrazubair','notsoweird23',6,'Hajra','Zubair','hzubair44@gmail.com','44 block A DHA,Karachi ','1999-03-12','03657483296'),
('ridaahmed','iamoutofpasswords33',8,'Rida','Ahmed','ridaahmed5@gmail.com','984 J1 Wapda Town,Lahore ','2002-12-5','03970543619'),
('mohsinkhan','tranquialitybase',10,'Mohsin','Khan','mohsinkhan@yahoo.com','44 street 55 Peshawar Cantt,Peshawar ','2001-06-6','0346372895'),
('RaziAhmad722', 'lalalalala', 1,'Razi','Ahmad', 'razi722@gmail.com' , '122 Cornelia Street', '1998-01-21', '03325215251'),
('MunimMuneem', 'Monum', 2,'Rana','AbdulMuneem', 'monum1252@gmail.com' , 'chakk no. 543', '2001-01-21',  '03325885251'),
('Sukhan123', 'Perplexedhooman', 3,'Sukhan','Khan', 'Sukhan123@gmail.com' , 'F2 block lacas', '2000-01-21', '03366215251'),
('AAR123', '12344n', 5,'Ahsan','Abdurrehman', 'aar123@gmail.com' , '123 G block Bahria', '2000-01-31', '03376215251'),
('zainRafique21', '19344n', 7,'Zain','Rafique', 'zain123@gmail.com' , '142 F block Valencia Town', '2000-02-23',  '03176215251'),
('sherry123', '19944n', 9,'Shaheer','Akhtar', 'sherry0123@gmail.com' , '142 F block Johar Town', '2000-05-30',  '03176015251');
GO

INSERT INTO Retailer VALUES
('default', 'default', 0, 'default', 'default@default.com', 'default', '1111111111111', '01234567891'), 
('Flowershop', '01234567', 1, 'Flowershop', 'flowershop@gmail.com', 'Wapda Town Lahore', '5555555555555', '03361111111'),
('ParadiseGarden', '12345678', 2, 'The Paradise Garden', 'paradisegarden@gmail.com', 'Bahria Town Karachi', '4444444444444', '03231212121'),
('GTerrace', '23456789', 3, 'Green Terrace', 'greenterrace@gmail.com', 'DHA Phase3 Lahore', '3333333333333', '03341112222'), 
('GardenDel', '34567890', 4, 'Garden Delights', 'gardendelights@gmail.com', 'Model Town Lahore', '2222222222222', '03329998888'),
('PKfertilizer', '45678901', 5, 'PK Fertilizers', 'PKfertilizers@gmail.com', 'F2 Islamabad', '6666666666666', '03235555544');
GO

INSERT INTO Category VALUES
(1, 'Plant'),
(2, 'Seed'),
(3, 'Fertilizer'),
(4, 'Pot'),
(5, 'Tool'),
(6, 'Other');
GO

INSERT INTO Product VALUES
(1, 1, 'Petunia', 50, 1, 100, 'Petunia flower with pot grown locally', '2021-1-17', 'images/products/petunia.png', 1),
(2, 1, 'Terminaria', 1200, 1, 50, 'Terminaria plant grown locally', '2021-2-18', 'images/products/terminaria.png',1),
(3, 1, 'ShoeFlower', 350, 1, 80, 'Shoeflower grown locally', '2021-2-25', 'images/products/shoe_flower.png',1),
(4, 1, 'Ixora', 1100, 1, 40, 'Ixora flower imported', '2021-3-23', 'images/products/ixora.png',1),
(5, 2, 'Lemon Grass', 200, 1, 50, 'Healthy bush of lemon grass plant', '2021-4-10', 'images/products/lemon_grass.png',1),
(6, 2, 'Euphorbia', 450, 1, 90, 'Fully grown Euphorbia flower', '2021-4-11', 'images/products/euphorbia.png', 1),
(7, 2, 'Avocaria', 4750, 1, 30, 'Fully grown Avocaria tree grown locally', '2021-4-13', 'images/products/avocaria.png', 1),
(8, 2, 'Rose', 80, 1, 150, 'Rose flower grown locally', '2021-4-23', 'images/products/rose.png', 1),
(9,3,'Urea Fertilizer',12000,3,600,'Comes in 50KG bags','2021-01-01', 'images/products/urea_fertilizer.png', 1),
(10,3,'Red Pots',300,4,200,'Hangable','2020-05-15', 'images/products/red_pots.png', 1),
(11,3,'Tomato Seeds',100,2,700,'Fast Growing','2020-07-16', 'images/products/tomato_seeds.png', 1),
(12,3,'Tulip Seeds',700,2,800,'All Season','2021-01-07', 'images/products/tulip_seeds.png', 1),
(13,4,'Money Plant',50,1,400,'Indoor Plant','2020-09-22', 'images/products/money_plant.png', 1),
(14,4,'Spring Onion Seed',200,2,1200,'Kitchen Garden Item','2021-02-19', 'images/products/spring_onion_seeds.png', 1),
(15,4,'Artifical Grass',700,6,400,'Comes in patches of 30 yards','2021-04-01', 'images/products/artificial_grass.png', 1),
(16,4,'Shovel',200,5,300,'Tool for digging','2020-04-02', 'images/products/shovel.png', 1),
(17, 5, 'Mattock', 1000, 5, 100, 'hand tool used for digging, prying, and chopping', '2021-1-01', 'images/products/mattock.png', 1),
(18, 5, 'NPK Fertilizer', 8000, 3, 50, '10kg NPK Fully organic fertilizers', '2021-1-01', 'images/products/npk_fertilizer.png', 1),
(19, 5, 'Calcium Fertilizer', 6000, 3, 60, '10kg Calcium rich fertilizers', '2021-1-01', 'images/products/calcium_fertilizer.png', 1),
(20, 5, 'Rodenticide', 2000, 5, 20, 'Kill pesky rodents by giving them this poison. 1kg Bag.', '2021-1-01', 'images/products/rodenticide.png', 1);
GO

INSERT INTO PaymentType VALUES
(1,'Credit Card'),
(2,'Cash on delivery'),
(3,'Cheque on delivery'),
(4,'Debit Card'),
(5,'Mobile Payment');
GO

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
GO

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
CREATE PROCEDURE get_retailerID
@username	varchar(20)
AS
	SELECT	Retailer.RetailerID
	FROM	Retailer
	WHERE	Retailer.[UserName] = @username
GO
--HOME PAGE
CREATE PROCEDURE get_popular_products
AS
	SELECT	TOP 3 Product.ProductID ,Product.[Name], Product.DateAdded, Product.[Image]
	FROM	Product
			LEFT JOIN Rating ON Product.ProductID = Rating.productID
	WHERE	Rating.score IS NOT NULL
			AND Product.[Status] = 1
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
	SELECT	TOP 3 Product.ProductID, Product.[Name], Product.DateAdded, Product.[Image]
	FROM	Product
	WHERE	Product.[Status] = 1
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

INSERT INTO Customer ([UserName], [Password], CustomerID, Fname, Lname, Email, [Address], DOB,Contact)
values (@username, @password, @customerID, @fname, @lname, @email, @address, @dob,@contact)
GO
CREATE PROCEDURE retailer_signup
@username	varchar(20),
@password varchar(20),
@name varchar(20),
@email varchar(30),
@address	varchar(50),
@contact char(11),
@NTN char(13),
@ID int
AS

INSERT INTO Retailer([UserName],[Password],[Name],Email,[Address],Contact,NTN,RetailerID)
values (@username,@password,@name,@email,@address,@contact,@NTN,@ID)

GO

--CATALOGUE PAGES

CREATE PROCEDURE get_products_category
@category	varchar(30)
AS
SELECT	Product.ProductID, Product.[Name], Product.[Image]
FROM	Product
		INNER JOIN Category ON Product.CategoryID = Category.categoryID
WHERE	Category.[name] = @category
		AND Product.[Status] = 1
GO

CREATE PROCEDURE get_product
@productID	int
AS
SELECT	Product.ProductID, Product.[Name], Category.[name] AS [Category], Product.Price, Product.[Description], Product.Stock, Product.[Image]
FROM	Product
		INNER JOIN Category ON Product.CategoryID = Category.categoryID
WHERE	Product.ProductID = @productID
GO

CREATE PROCEDURE search_product
@product	varchar(50)
AS
	SELECT	Product.ProductID, Product.[Name], Product.[Image]
	FROM	Product
	WHERE	Product.[Name] LIKE @product
			AND Product.[Status] = 1
GO

--PROFILE PAGES
CREATE PROCEDURE get_customer
@username varchar(20)
AS
	Select *
	from Customer
	where [Customer].UserName = @username
GO

CREATE PROCEDURE get_admin
@username varchar(20)
AS
	Select *
	from [Admin]
	where [Admin].UserName = @username
GO

CREATE PROCEDURE get_retailer
@username varchar(20)
AS
	Select *
	from [Retailer]
	where [Retailer].UserName = @username
GO

CREATE PROCEDURE purchase_history
@username varchar(20)
AS
	Select [Product].name as Name, Purchase.Quantity as Quantity, Purchase.Date as Date, PaymentType.Name as [Payment Type], [Purchase].Quantity*[Product].Price as [Total Amount]
	from purchase
	Inner Join [Customer] on [Purchase].CustomerID = Customer.CustomerID Inner Join Product on Product.ProductID = Purchase.ProductID
	Inner Join PaymentType on  PaymentType.PaymentTypeID = Purchase.PaymentType 
	where [Customer].UserName = @username
GO

CREATE PROCEDURE product_history
@username	varchar(20)
AS
	SELECT	Product.[Name], Category.[Name] AS [Category], Product.Price, Product.Stock, Product.DateAdded AS [Date added]
	FROM	Product
			INNER JOIN Retailer ON Product.RetailerID = Retailer.RetailerID
			INNER JOIN Category ON Product.CategoryID = Category.categoryID
	WHERE	Retailer.UserName = @username
GO

CREATE PROCEDURE sale_history
@username	varchar(20)
AS
SELECT	Product.[Name], Purchase.Quantity, Purchase.[Date], Purchase.Quantity*Product.Price AS [Total]
FROM	Purchase
		INNER JOIN Product ON Purchase.ProductID = Product.ProductID
		INNER JOIN Retailer ON Product.RetailerID = Retailer.RetailerID

WHERE	Retailer.UserName = @username
ORDER BY Purchase.[Date] DESC
GO

--EDIT PAGES
CREATE PROCEDURE edit_admin
@uname	varchar(20),
@fname	varchar(20),
@lname	varchar(20),
@email	varchar(30),
@cnic	char(13)
AS
	UPDATE	[Admin]
	SET		Fname = @fname,
			Lname = @lname,
			Email = @email,
			CNIC = @cnic
	WHERE	UserName = @uname
GO

CREATE PROCEDURE edit_customer
@uname		varchar(20),
@fname		varchar(20),
@lname		varchar(20),
@email		varchar(30),
@address	varchar(50),
@dob		date,
@contact	char(11)
AS
	IF @contact = ''
		SET @contact = NULL

	UPDATE	Customer
	SET		Fname = @fname,
			Lname = @lname,
			Email = @email,
			[Address] = @address,
			DOB = @dob,
			[Contact] = @contact
	WHERE	UserName = @uname
GO

CREATE PROCEDURE edit_retailer
@uname		varchar(20),
@name		varchar(30),
@email		varchar(30),
@address	varchar(50),
@ntn		char(13),
@contact	char(11)
AS
	UPDATE	Retailer
	SET		[Name] = @name,
			Email = @email,
			[Address] = @address,
			NTN = @ntn,
			[Contact] = @contact
	WHERE	UserName = @uname
GO

--PRODUCT MANAGEMENT
CREATE PROCEDURE get_current_products
AS
	SELECT	Product.ProductID, Retailer.[Name] AS [Retailer], Product.[Name] AS [Product],
			Product.Price, Category.[Name] AS [Category], Product.DateAdded
	FROM	Product
			INNER JOIN Retailer ON Product.RetailerID = Retailer.RetailerID
			INNER JOIN Category ON Product.CategoryID = Category.categoryID
	WHERE	Product.[Status] = 1;
GO

CREATE PROCEDURE get_removed_products
AS
	SELECT	Product.ProductID, Retailer.[Name] AS [Retailer], Product.[Name] AS [Product],
			Product.Price, Category.[Name] AS [Category], Product.DateAdded
	FROM	Product
			INNER JOIN Retailer ON Product.RetailerID = Retailer.RetailerID
			INNER JOIN Category ON Product.CategoryID = Category.categoryID
	WHERE	Product.[Status] = 0;
GO

CREATE PROCEDURE remove_product
@productID	int
AS
	UPDATE Product
	SET		Product.[Status] = 0
	WHERE	Product.ProductID = @productID
GO

CREATE PROCEDURE restore_product
@productID	int
AS
	UPDATE Product
	SET		Product.[Status] = 1
	WHERE	Product.ProductID = @productID
GO

CREATE PROCEDURE add_product
@productID	int,
@retailerID	int,
@name		varchar(40),
@price		float,
@categoryID	int,
@stock		int,
@desc		varchar(300),
@dateAdded	date,
@image		varchar(200)
AS
INSERT INTO Product VALUES
(@productID, @retailerID, @name, @price, @categoryID, @stock, @desc, @dateAdded, @image, 1)
GO

--CART FUNCTIONS
CREATE PROCEDURE add_purchase
@PurchaseID int,
@CustomerID int,
@ProductID int,
@Quantity int,
@Date datetime,
@PaymentType int
AS
	INSERT INTO Purchase VALUES
	(@PurchaseID,@CustomerID,@ProductID,@Quantity,@Date,@PaymentType)
GO

CREATE PROCEDURE get_stock
@ProductID int,
@ret int output
AS
	BEGIN TRANSACTION
	SAVE TRANSACTION SAVEPOINT

	BEGIN TRY

	SET @ret= (Select Product.Stock
	FROM Product
	WHERE Product.ProductID = @ProductID)

	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
	ROLLBACK TRANSACTION SAVEPOINT
	END
	END CATCH

	COMMIT TRANSACTION
GO

CREATE PROCEDURE update_stock
@ProductID int,
@val int
AS
	BEGIN TRANSACTION
	SAVE TRANSACTION SAVEPOINT

	BEGIN TRY

	UPDATE product
	SET Product.Stock = @val
	WHERE Product.ProductID = @ProductID;

	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
	ROLLBACK TRANSACTION SAVEPOINT
	END
	END CATCH

	COMMIT TRANSACTION
	
GO


--RATING
CREATE PROCEDURE get_ratings
@productID int
AS
	BEGIN TRANSACTION
	SAVE TRANSACTION SAVEPOINT

	BEGIN TRY

	Select	Customer.UserName AS [Name],Rating.score AS [Rating],Rating.review AS [Review]
	FROM	Product
			INNER JOIN Rating On Product.ProductID=Rating.productID
			INNER JOIN Customer ON Customer.CustomerID=Rating.customerID
	WHERE	Product.ProductID=@productID

	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
	ROLLBACK TRANSACTION SAVEPOINT
	END
	END CATCH

	COMMIT TRANSACTION
GO

CREATE PROCEDURE unrated_products
@username varchar(20)

AS
	Select  [Product].[name] as [ProductName], [Product].ProductID
	from purchase
	Inner Join [Customer] on [Purchase].CustomerID = Customer.CustomerID Inner Join Product on Product.ProductID = Purchase.ProductID
    where (Customer.UserName=@username)
EXCEPT 
Select  [Product].[name] as Name, [Product].ProductID
	from Rating
	Inner Join [Customer] on Rating.CustomerID = Customer.CustomerID Inner Join Product on Product.ProductID = Rating.ProductID
    where (Customer.UserName=@username)
GO

CREATE PROCEDURE rate_product
@customerID	int,
@productID int,
@score int,
@review varchar(200)
AS

	BEGIN TRANSACTION
	SAVE TRANSACTION SAVEPOINT

	BEGIN TRY

	if @review = ''
		set @review = null

	INSERT INTO Rating
	values (@productID,@customerID, @score, @review);

	END TRY

	BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
	ROLLBACK TRANSACTION SAVEPOINT
	END
	END CATCH

	COMMIT TRANSACTION
GO

/*Triggers*/
 CREATE TRIGGER Customer_inserted
 On Customer
 AFTER INSERT 
 AS 
 PRINT 'New customer Inserted'
 GO

 CREATE TRIGGER Retailer_inserted
 On Retailer
 AFTER INSERT 
 AS 
 PRINT 'New Reatiler Inserted'
 GO

 CREATE TRIGGER ADMIN_inserted
 On Admin
 AFTER INSERT 
 AS 
 PRINT 'New Admin Inserted'
 GO
