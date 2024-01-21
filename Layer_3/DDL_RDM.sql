
.LOGON 192.168.18.94 /DBC,DBC ;
DATABASE DB_RDM ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																										--SALES				
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DB_RDM.STORE;
CREATE MULTISET TABLE  DB_RDM.STORE

(
		BusinessEntityID SMALLINT, 
		Name VARCHAR(50),
		Demographics VARCHAR(500),
		rowguid VARCHAR(50),
		MODIFIEDDATE DATE,
        TIME1 TIME
)
 PRIMARY INDEX (BUSINESSENTITYID) 
PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2008-10-01' AND
DATE '2008-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_RDM.CUSTOMER;
	CREATE MULTISET TABLE  DB_RDM.CUSTOMER

(
		CustomerID INTEGER,
		PersonID SMALLINT,
		StoreID SMALLINT,
		TerritoryID BYTEINT,
		AccountNumber VARCHAR(15),
		rowguid VARCHAR(40),
		MODIFIEDDATE DATE,
      TIME1 TIME

)
	PRIMARY INDEX (CUSTOMERID)	
	PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2008-10-01' AND
DATE '2008-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_RDM.SHOPPINGCARTITEM;
	
	CREATE MULTISET TABLE  DB_RDM.SHOPPINGCARTITEM

(
		SHOPPINGCARTITEMID BYTEINT,
		SHOPPINGCARTID SMALLINT,
		QUANTITY BYTEINT,
		PRODUCTID SMALLINT,
		DATECREATED DATE,
		TIME2 TIME,
		MODIFIEDDATE DATE,
        TIME1 TIME

)
	PRIMARY INDEX (SHOPPINGCARTITEMID)	
	PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2007-10-01' AND
DATE '2007-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DB_RDM.SALESTAXRATE;
CREATE MULTISET TABLE  DB_RDM.SALESTAXRATE

(
		SalesTaxRateID BYTEINT,
		StateProvinceID BYTEINT,
		TaxType BYTEINT,
		TaxRate DECIMAL(5,2),
		Name VARCHAR(50),
		rowguid VARCHAR(40),
		MODIFIEDDATE DATE
       
		)
	PRIMARY INDEX (SALESTAXRATEID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DB_RDM.CURRENCY;
CREATE MULTISET TABLE  DB_RDM.CURRENCY

(
		CurrencyCode VARCHAR(10),
		Name VARCHAR(20),
		MODIFIEDDATE DATE
        
		)
	PRIMARY INDEX (CURRENCYCODE)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DB_RDM.CURRENCYRATE;
	CREATE MULTISET TABLE  DB_RDM.CURRENCYRATE

(
		CurrencyRateID INTEGER,
		CurrencyRateDate DATE, 
		FromCurrencyCode VARCHAR (10),
		ToCurrencyCode VARCHAR(10),
		AverageRate DECIMAL(5,2),
		EndOfDayRate DECIMAL(5,2),
		MODIFIEDDATE DATE
        
)
	PRIMARY INDEX (CURRENCYRATEID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_RDM.SPECIALOFFER;
	CREATE MULTISET TABLE  DB_RDM.SPECIALOFFER

(
		SpecialOfferID BYTEINT,
		Description VARCHAR(100),
		DiscountPct DECIMAL(2,2),
		Type_ VARCHAR(50),
		Category VARCHAR(50),
		StartDate DATE,
		EndDate DATE,
		MinQty BYTEINT,
		MaxQty BYTEINT,
		rowguid VARCHAR(40),
		MODIFIEDDATE DATE
        
			
)
	PRIMARY INDEX (SPECIALOFFERID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	DROP TABLE DB_RDM.SALESTERRITORYHISTORY;
	CREATE MULTISET TABLE  DB_RDM.SALESTERRITORYHISTORY

(
		BUSINESSENTITYID SMALLINT,
		TERRITORYID BYTEINT,
		STARTDATE DATE,
		ENDDATE DATE,
		ROWGUID VARCHAR(40),
		MODIFIEDDATE DATE
       
)
	PRIMARY INDEX (BUSINESSENTITYID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_RDM.SALESTERRITORY;
	
	CREATE MULTISET TABLE  DB_RDM.SALESTERRITORY

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
		MODIFIEDDATE DATE
			
)
	PRIMARY INDEX (TERRITORYID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
			DROP TABLE DB_RDM.SPECIALOFFERPRODUCT;
	CREATE MULTISET TABLE  DB_RDM.SPECIALOFFERPRODUCT
(
SpecialOfferID byteint,
ProductID INT,
rowguid varchar(40),
MODIFIEDDATE DATE
)
 PRIMARY INDEX (SPECIALOFFERID) 
PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2005-01-01' AND
DATE '2006-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP TABLE DB_RDM.CREDITCARD;
	
	CREATE MULTISET TABLE  DB_RDM.CREDITCARD
(
CreditCardID smallint,
CardType VARCHAR(20),
CardNumber bigINT,
ExpMonth BYTEINT,
ExpYear SMALLINT,
MODIFIEDDATE DATE
)
PRIMARY INDEX (CREDITCARDID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		DROP TABLE DB_RDM.SALESREASON;
	
	CREATE MULTISET TABLE  DB_RDM.SALESREASON
(
SalesReasonID byteint,
Name VARchar(20),
ReasonType VARchar(20),
MODIFIEDDATE DATE
)
PRIMARY INDEX (SALESREASONID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE DB_RDM.SALESORDERHEADER;
CREATE MULTISET TABLE  DB_RDM.SALESORDERHEADER

(
	BUSINESSENTITYID INT,
	SALESORDERID INT,
	REVISIONNUMBER BYTEINT,
	ORDERDATE DATE,
	DUEDATE DATE,
	SHIPDATE DATE,
	STATUS BYTEINT,
	ONLINEORDERFLAG BYTEINT,
	SALESORDERNUMBER VARCHAR(15),
	PURCHASEORDERNUMBER VARCHAR(20),
	ACCOUNTNUMBER VARCHAR(20),
	CustomerID INT,
	SalesPersonID SMALLINT,
	TERRITORYID BYTEINT,
	BILLTOADDRESSID INT,
	SHIPTOADDRESSID INT,
	SHIPMETHODID BYTEINT,
	CREDITCARDID INT,
	CREDITCARDAPPROVALCODE VARCHAR(20),
	CURRENCYRATEID INT,
	SUBTOTAL DECIMAL(10,2),
	TAXAMT DECIMAL(10,2),
	FREIGHT DECIMAL(10,2),
	TOTALDUE DECIMAL(10,2),
	COMMENT_ VARCHAR (10),
	ROWGUID VARCHAR(40),
	MODIFIEDDATE DATE
   )
 PRIMARY INDEX (BUSINESSENTITYID, SALESORDERID ) 
PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2005-01-01' AND
DATE '2006-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	DROP TABLE DB_RDM.SALESPERSONQUOTAHISTORY;
	CREATE MULTISET TABLE  DB_RDM.SALESPERSONQUOTAHISTORY

(
	BUSINESSENTITYID SMALLINT,
	QUOTADATE DATE,
	SALESQUOTA DECIMAL(10,2),
	ROWGUID VARCHAR(40),
	MODIFIEDDATE DATE
)
PRIMARY INDEX (BUSINESSENTITYID, QUOTADATE)  ;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE DB_RDM.SALESPERSON;
CREATE MULTISET TABLE  DB_RDM.SALESPERSON

(
	BUSINESSENTITYID SMALLINT,
	TERRITORYID BYTEINT,
	SALESQUOTA DECIMAL(10,2),
	BONUS DECIMAL(10,2),
	COMMISSIONPCT DECIMAL(10,2),
	SALESYTD DECIMAL(10,2),
	SALESLASTYEAR DECIMAL(10,2),
	ROWGUID VARCHAR(40),
	MODIFIEDDATE DATE

)
PRIMARY INDEX (BUSINESSENTITYID)	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE DB_RDM.PERSONCREDITCARD;
CREATE MULTISET TABLE  DB_RDM.PERSONCREDITCARD

(
	BUSINESSENTITYID INT,
	CREDITCARDID INT,
	MODIFIEDDATE DATE
	)
PRIMARY INDEX (BUSINESSENTITYID, CREDITCARDID);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
DROP TABLE DB_RDM.SALESORDERHEADERSALESREASON;
	CREATE MULTISET TABLE  DB_RDM.SALESORDERHEADERSALESREASON

(
	BUSINESSENTITYID INT,
	SALESORDERID INT,
	SALESREASONID BYTEINT,
	MODIFIEDDATE DATE
)
PRIMARY INDEX (BUSINESSENTITYID, SALESORDERID, SALESREASONID )	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	DROP TABLE DB_RDM.SALESORDERDETAIL;
	CREATE MULTISET TABLE  DB_RDM.SALESORDERDETAIL

(
	BUSINESSENTITYID SMALLINT,
	SALESORDERID INT,
	SALESORDERDETAILID INT,
	CARRIERTRACKINGNUMBER VARCHAR(20),
	ORDERQTY SMALLINT,
	PRODUCTID SMALLINT,
	SPECIALOFFERID BYTEINT,
	UNITPRICE DECIMAL(10,2),
	UNITPRICEDISCOUNT DECIMAL(10,2),
	LINETOTAL DECIMAL(10,2),
	ROWGUID VARCHAR(40),
	MODIFIEDDATE DATE
)
 PRIMARY INDEX (BUSINESSENTITYID, SALESORDERID, SALESORDERDETAILID )	
PARTITION BY RANGE_N(MODIFIEDDATE BETWEEN DATE '2006-01-01' AND
DATE '2006-12-31' EACH INTERVAL '1' DAY, NO RANGE OR UNKNOWN);
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.LOGOFF ;
	
	
	
	
	
