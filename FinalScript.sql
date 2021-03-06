USE [master]
GO

CREATE DATABASE [CanteenDB2Test]

GO
USE [CanteenDB2Test]

GO
CREATE TABLE [dbo].[tblCard](
	[fldCardID] [int] IDENTITY(1,1) NOT NULL,
	[fldCustomerID] [int] NULL,
	[fldBalance] [float] NULL,
	CONSTRAINT [PK_tblCard_fldCardID] PRIMARY KEY CLUSTERED ([fldCardID] ASC)
)

GO
CREATE TABLE [dbo].[tblCustomer](
	[fldCustomerID] [int] IDENTITY(1,1) NOT NULL,
	[fldCardID] [int] NOT NULL,
	[fldCustomerName] [varchar](40) NULL,
	CONSTRAINT [PK_tblCustomer_fldCustomerID] PRIMARY KEY CLUSTERED ([fldCustomerID] ASC)
)
GO

CREATE TABLE [dbo].[tblEmployee](
	[fldEmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[fldPassword] [varchar](255) NOT NULL,
	[fldStatus] [varchar](40) NOT NULL,
	[fldName] [varchar](50) NOT NULL,
	[fldSurname] [varchar](50) NOT NULL,
	CONSTRAINT [PK_tblEmployee_fldEmployeeID] PRIMARY KEY CLUSTERED ([fldEmployeeID] ASC)
 )

GO
CREATE TABLE [dbo].[tblRegister](
	[fldRegisterID] [int] NOT NULL,
	[fldCustomerID] [int] NOT NULL,
	[fldEmployeeID] [int] NOT NULL,
	[fldStockID] [int] NOT NULL,
	[fldSalesID] [int] NOT NULL,
 CONSTRAINT [PK_tblRegister] PRIMARY KEY CLUSTERED ([fldRegisterID] ASC)
 )

GO
CREATE TABLE [dbo].[tblSales](
	[fldSalesID] [int] IDENTITY(1,1) NOT NULL,
	[fldRegisterID] [int] NOT NULL,
	[fldProductType] [varchar](255) NOT NULL,
	[fldProductName] [varchar](255) NOT NULL,
	[fldTotal_QTY_Sold] [int] NOT NULL,
	[fldProductPrice] [int] NOT NULL,
	[fldDateofSale] [date] NOT NULL,
 CONSTRAINT [PK_tblSales_fldSalesID] PRIMARY KEY CLUSTERED ([fldSalesID] ASC)
 )

GO
CREATE TABLE [dbo].[tblStorage](
	[fldStockID] [int] IDENTITY(1,1) NOT NULL,
	[fldSupplierID] [int] NOT NULL,
	[fldProductName] [varchar](50) NOT NULL,
	[fldProductType] [varchar](255) NOT NULL,
	[fldQuantity] [int] NULL,
	[fldMinQuantity] [int] NULL,
	[fldExpirationDay] [date] NOT NULL,
	[fldPrice] [float] NOT NULL,
 CONSTRAINT [PK_tblProduct_fldProductID] PRIMARY KEY CLUSTERED ([fldStockID] ASC)
 )
GO
CREATE TABLE [dbo].[tblSupplier](
	[fldSupplierID] [int] IDENTITY(1,1) NOT NULL,
	[fldCompanyName] [varchar](255) NULL,
	[fldEmail] [varchar](255) NULL,
	[fldPrice] [float] NOT NULL,
	[fldOrderQuantity] [int] NULL,
 CONSTRAINT [PK_tblSupplier_fldSupplierID] PRIMARY KEY CLUSTERED ([fldSupplierID] ASC)
)


SET IDENTITY_INSERT [dbo].[tblCard] ON 

INSERT [dbo].[tblCard] ([fldCardID], [fldCustomerID], [fldBalance]) VALUES (1, 1, 100)
INSERT [dbo].[tblCard] ([fldCardID], [fldCustomerID], [fldBalance]) VALUES (2, 2, 200)
INSERT [dbo].[tblCard] ([fldCardID], [fldCustomerID], [fldBalance]) VALUES (3, 3, 250)
INSERT [dbo].[tblCard] ([fldCardID], [fldCustomerID], [fldBalance]) VALUES (4, 4, 150)
SET IDENTITY_INSERT [dbo].[tblCard] OFF
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([fldCustomerID], [fldCardID], [fldCustomerName]) VALUES (1, 1, N'Hans')
INSERT [dbo].[tblCustomer] ([fldCustomerID], [fldCardID], [fldCustomerName]) VALUES (2, 2, N'Anders')
INSERT [dbo].[tblCustomer] ([fldCustomerID], [fldCardID], [fldCustomerName]) VALUES (3, 3, N'Henrik')
INSERT [dbo].[tblCustomer] ([fldCustomerID], [fldCardID], [fldCustomerName]) VALUES (4, 4, N'Ove')
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
SET IDENTITY_INSERT [dbo].[tblStorage] ON 

INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (5, 1, N'Juice', N'Drink', 10, 10, CAST(N'2021-05-20' AS Date), 15)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (6, 2, N'Soda', N'Drink', 15, 10, CAST(N'2022-04-20' AS Date), 20)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (7, 2, N'Coca Cola', N'Drink', 19, 20, CAST(N'2022-04-22' AS Date), 20)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (8, 1, N'Milk', N'Drink', 9, 5, CAST(N'2020-04-26' AS Date), 5)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (10, 3, N'Burgers', N'Food', 47, 20, CAST(N'2020-05-05' AS Date), 15.5)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (11, 1, N'Coffee', N'Drink', 29, 10, CAST(N'2020-05-11' AS Date), 10)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (12, 1, N'Water', N'Drink', 15, 20, CAST(N'2021-05-04' AS Date), 5)
INSERT [dbo].[tblStorage] ([fldStockID], [fldSupplierID], [fldProductName], [fldProductType], [fldQuantity], [fldMinQuantity], [fldExpirationDay], [fldPrice]) VALUES (13, 3, N'Fruits', N'Food', 28, 20, CAST(N'2020-05-04' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tblStorage] OFF
SET IDENTITY_INSERT [dbo].[tblSupplier] ON 

INSERT [dbo].[tblSupplier] ([fldSupplierID], [fldCompanyName], [fldEmail], [fldPrice], [fldOrderQuantity]) VALUES (1, N'Arla', N'arla@dkdk.dk', 250, 300)
INSERT [dbo].[tblSupplier] ([fldSupplierID], [fldCompanyName], [fldEmail], [fldPrice], [fldOrderQuantity]) VALUES (2, N'coca cola', N'cola@drink.com', 300, 500)
INSERT [dbo].[tblSupplier] ([fldSupplierID], [fldCompanyName], [fldEmail], [fldPrice], [fldOrderQuantity]) VALUES (3, N'Burgers', N'Burgers@food.com', 350, 500)
SET IDENTITY_INSERT [dbo].[tblSupplier] OFF



ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomer_tblCard] FOREIGN KEY([fldCardID])
REFERENCES [dbo].[tblCard] ([fldCardID])
GO
ALTER TABLE [dbo].[tblCustomer] CHECK CONSTRAINT [FK_tblCustomer_tblCard]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblCustomer] FOREIGN KEY([fldCustomerID])
REFERENCES [dbo].[tblCustomer] ([fldCustomerID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblCustomer]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblEmployee] FOREIGN KEY([fldEmployeeID])
REFERENCES [dbo].[tblEmployee] ([fldEmployeeID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblEmployee]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblSales] FOREIGN KEY([fldSalesID])
REFERENCES [dbo].[tblSales] ([fldSalesID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblSales]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK_tblRegister_tblStorage] FOREIGN KEY([fldStockID])
REFERENCES [dbo].[tblStorage] ([fldStockID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK_tblRegister_tblStorage]
GO
ALTER TABLE [dbo].[tblStorage]  WITH CHECK ADD  CONSTRAINT [FK_tblStorage_tblSupplier] FOREIGN KEY([fldSupplierID])
REFERENCES [dbo].[tblSupplier] ([fldSupplierID])
GO
ALTER TABLE [dbo].[tblStorage] CHECK CONSTRAINT [FK_tblStorage_tblSupplier]
GO

------------------------------------------------

CREATE PROCEDURE [dbo].[GetSalesInfo]
AS 
	BEGIN
		SELECT * FROM tblSales
	END
GO
USE [master]
GO
