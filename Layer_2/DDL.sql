
.LOGON 192.168.18.91 /dbc,dbc ;
DATABASE DB_STG2 ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																										--SALES				
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DB_STG2.STORE ;

CREATE MULTISET TABLE DB_STG2.STORE

(
		BusinessEntityID SMALLINT, 
		Name VARCHAR(50),
		Demographics VARCHAR(500),
		rowguid VARCHAR(50),
		ModifiedDate TIMESTAMP(6)

)
	PRIMARY INDEX (BusinessEntityID)	;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.CUSTOMER ;
	CREATE MULTISET TABLE DB_STG2.CUSTOMER

(
		CustomerID INTEGER,
		PersonID SMALLINT,
		StoreID SMALLINT,
		TerritoryID BYTEINT,
		AccountNumber VARCHAR(15),
		rowguid VARCHAR(40),
		ModifiedDate TIMESTAMP(6)

)
	PRIMARY INDEX (CustomerID)	;
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.ShoppingCartItem ;
	CREATE MULTISET TABLE DB_STG2.ShoppingCartItem

(
		ShoppingCartItemID BYTEINT,
		ShoppingCartID SMALLINT,
		Quantity BYTEINT,
	  	ProductID SMALLINT,
		DateCreated TIMESTAMP(6),
		ModifiedDate TIMESTAMP(6)

)
	PRIMARY INDEX (ShoppingCartItemID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.SalesTaxRate ;
CREATE MULTISET TABLE DB_STG2.SalesTaxRate

(
		SalesTaxRateID BYTEINT,
		StateProvinceID BYTEINT,
		TaxType BYTEINT,
		TaxRate DECIMAL(5,2),
		Name VARCHAR(50),
		rowguid VARCHAR(40),
		ModifiedDate DATE

)
	PRIMARY INDEX (SalesTaxRateID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.Currency ;
CREATE MULTISET TABLE DB_STG2.Currency

(
		CurrencyCode VARCHAR(10),
		Name VARCHAR(20),
		ModifiedDate DATE
)
	PRIMARY INDEX (CurrencyCode)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.CurrencyRate ;
	CREATE MULTISET TABLE DB_STG2.CurrencyRate

(
		CurrencyRateID INTEGER,
		CurrencyRateDate DATE, 
		FromCurrencyCode VARCHAR (10),
		ToCurrencyCode VARCHAR(10),
		AverageRate DECIMAL(5,2),
		EndOfDayRate DECIMAL(5,2),
		ModifiedDate DATE
)
	PRIMARY INDEX (CurrencyRateID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SpecialOffer ;
	CREATE MULTISET TABLE DB_STG2.SpecialOffer

(
		SpecialOfferID BYTEINT,
		Description VARCHAR(100),
		DiscountPCREATE DECIMAL(2,2),
		Type_ VARCHAR(50),
		Category VARCHAR(50),
		StartDate DATE,
		EndDate DATE,
		MinQty BYTEINT,
		MaxQty BYTEINT,
		rowguid VARCHAR(40),
		ModifiedDate DATE
)
	PRIMARY INDEX (SpecialOfferID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesTerritoryHistory ;
	CREATE MULTISET TABLE DB_STG2.SalesTerritoryHistory

(
		BusinessEntityID SMALLINT,
		TerritoryID BYTEINT,
		StartDate DATE,
		EndDate DATE,
		rowguid VARCHAR(40),
		ModifiedDate DATE
)
	PRIMARY INDEX (BusinessEntityID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesTerritory ;
	CREATE MULTISET TABLE DB_STG2.SalesTerritory

(
	TerritoryID BYTEINT,
		Name VARCHAR(20),
		CountryRegionCode VARCHAR(10),
		Group_ VARCHAR(20),
		SalesYTD DECIMAL(15,2),
		SalesLastYear DECIMAL(15,2),
		CostYTD DECIMAL(10,2),
		CostLastYear DECIMAL(10,2),
		rowguid VARCHAR(40),
		ModifiedDate DATE
)
	PRIMARY INDEX (TerritoryID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.SpecialOfferProduCREATE;
	CREATE MULTISET TABLE DB_STG2.SpecialOfferProduct
(
SpecialOfferID byteint,
ProductID INT,
rowguid varchar(40),
ModifiedDate DATE
)
PRIMARY INDEX (SpecialOfferID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		DROP TABLE DB_STG2.CreditCard ;
	CREATE MULTISET TABLE DB_STG2.CreditCard
(
CreditCardID smallint,
CardType VARCHAR(20),
CardNumber BIGINT,
ExpMonth BYTEINT,
ExpYear SMALLINT,
ModifiedDate DATE
)
PRIMARY INDEX (CreditCardID);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesReason ;
	CREATE MULTISET TABLE DB_STG2.SalesReason
(
SalesReasonID byteint,
Name VARchar(20),
ReasonType VARchar(20),
ModifiedDate DATE
)
PRIMARY INDEX (SalesReasonID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.SalesOrderHeader ;
CREATE MULTISET TABLE DB_STG2.SalesOrderHeader

(
	BusinessEntityID INT,
	SalesOrderID INT,
	RevisionNumber BYTEINT,
	OrderDate DATE,
	DueDate DATE,
	ShipDate DATE,
	Status BYTEINT,
	OnlineOrderFlag BYTEINT,
	SalesOrderNumber VARCHAR(15),
	PurchaseOrderNumber VARCHAR(20),
	AccountNumber VARCHAR(20),
	CustomerID INT,
	SalesPersonID SMALLINT,
	TerritoryID BYTEINT,
	BillToAddressID INT,
	ShipToAddressID INT,
	ShipMethodID BYTEINT,
	CreditCardID INT,
	CreditCardApprovalCode VARCHAR(20),
	CurrencyRateID INT,
	SubTotal DECIMAL(10,2),
	TaxAmt DECIMAL(10,2),
	Freight DECIMAL(10,2),
	TotalDue DECIMAL(10,2),
	Comment_ VARCHAR (10),
	rowguid VARCHAR(40),
	ModifiedDate DATE

)
PRIMARY INDEX (BusinessEntityID, SalesOrderID ) 	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesPersonQuotaHistory ;
	CREATE MULTISET TABLE DB_STG2.SalesPersonQuotaHistory

(
	BusinessEntityID SMALLINT,
	QuotaDate DATE,
	SalesQuota DECIMAL(10,2),
	rowguid VARCHAR(40),
	ModifiedDate DATE

)
PRIMARY INDEX (BusinessEntityID, QuotaDate)  ;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.SalesPerson ;
CREATE MULTISET TABLE DB_STG2.SalesPerson

(
	BusinessEntityID SMALLINT,
	TerritoryID BYTEINT,
	SalesQuota DECIMAL(10,2),
	Bonus DECIMAL(10,2),
	CommissionPct DECIMAL(10,2),
	SalesYTD DECIMAL(10,2),
	SalesLastYear DECIMAL(10,2),
	rowguid VARCHAR(40),
	ModifiedDate DATE

)
PRIMARY INDEX (BusinessEntityID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_STG2.PersonCreditCard ;
CREATE MULTISET TABLE DB_STG2.PersonCreditCard

(
	BusinessEntityID INT,
	CreditCardID INT,
	ModifiedDate DATE

)
PRIMARY INDEX (BusinessEntityID, CreditCardID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesOrderHeaderSalesReason ;
	CREATE MULTISET TABLE DB_STG2.SalesOrderHeaderSalesReason

(
	BusinessEntityID INT,
	SalesOrderID INT,
	SalesReasonID BYTEINT,
	ModifiedDate DATE
)
PRIMARY INDEX (BusinessEntityID, SalesOrderID, SalesReasonID )	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_STG2.SalesOrderDetail ;
	CREATE MULTISET TABLE DB_STG2.SalesOrderDetail

(
	BusinessEntityID SMALLINT,
	SalesOrderID INT,
	SalesOrderDetailID INT,
	CarrierTrackingNumber VARCHAR(20),
	OrderQty SMALLINT,
	ProductID SMALLINT,
	SpecialOfferID BYTEINT,
	UnitPrice DECIMAL(10,2),
	UnitPriceDiscount DECIMAL(10,2),
	LineTotal DECIMAL(10,2),
	rowguid VARCHAR(40),
	ModifiedDate DATE
)
PRIMARY INDEX (BusinessEntityID, SalesOrderID, SalesOrderDetailID )		;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.LOGOFF ;
	
	
	
	
	
