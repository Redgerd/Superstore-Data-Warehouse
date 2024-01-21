
.LOGON 192.168.18.91 /dbc,dbc ;
DATABASE DB_STG2 ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																										--SALES				
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DB_STG2.STORE
SEL 
		CAST(BusinessEntityID AS SMALLINT), 
		CAST(Name AS VARCHAR(50)), 
		CAST(Demographics AS VARCHAR(500)), 
		CAST(rowguid AS VARCHAR(50)), 
		CAST(ModifiedDate AS TIMESTAMP(6))
FROM DB_STG1.SALES_STORE	;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	insert into DB_STG2.CUSTOMER
select cast(CustomerID as int)
		,cast((case when PersonID = 'NULL' THEN 0 else PersonID End) as int) as PersonID 
		,cast((case when StoreID = 'NULL' THEN 0 else StoreID End) as smallint) as StoreID
		,cast(TerritoryID as byteint)
		,cast(AccountNumber as varchar(15))
		,cast(rowguid as varchar(40))
		,cast(ModifiedDate as timestamp(6))
from DB_STG1.CUSTOMER_SALES;
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	insert into DB_STG2.ShoppingCartItem
select 
		cast(ShoppingCartItemID as BYTEINT)
		,cast(ShoppingCartID as SMALLINT)
		,cast(Quantity as BYTEINT)
		,cast(ProductID as SMALLINT)
		,cast(DateCreated as TIMESTAMP(6))
		,cast(ModifiedDate as TIMESTAMP(6))
from DB_STG1.ShoppingCartItem_SALES;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	insert into DB_STG2.SalesTaxRate
select 
		cast(SalesTaxRateID as BYTEINT)
		,cast(StateProvinceID as BYTEINT)
		,cast(TaxType as BYTEINT)
		,TRIM(cast(TaxRate as DECIMAL(4,2)))
		,cast(Name as VARCHAR(50))
		,cast(rowguid as VARCHAR(40))
		,cast(SUBSTR ( (case when ModifiedDate = 'NULL' THEN NULL else ModifiedDate End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.SalesTaxRate_SALES	;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into DB_STG2.Currency 
sel distinct 
cast((case when CurrencyCode = 'NULL' THEN 'N/A' else CurrencyCode End) as VARCHAR(10)) as CurrencyCode 
,cast((case when Name2 = 'NULL' THEN 'N/A' else Name2 End) as VARCHAR(20)) as Name 
,cast(SUBSTR ( (case when ModifiedDate8 = 'NULL' THEN NULL else ModifiedDate8 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2011

union all

sel distinct 
cast((case when CurrencyCode = 'NULL' THEN 'N/A' else CurrencyCode End) as VARCHAR(10)) as CurrencyCode 
,cast((case when Name2 = 'NULL' THEN 'N/A' else Name2 End) as VARCHAR(20)) as Name 
,cast(SUBSTR ( (case when ModifiedDate8 = 'NULL' THEN NULL else ModifiedDate8 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2012

union all

sel distinct 
cast((case when CurrencyCode = 'NULL' THEN 'N/A' else CurrencyCode End) as VARCHAR(10)) as CurrencyCode 
,cast((case when Name2 = 'NULL' THEN 'N/A' else Name2 End) as VARCHAR(20)) as Name 
,cast(SUBSTR ( (case when ModifiedDate8 = 'NULL' THEN NULL else ModifiedDate8 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2013

union all

sel distinct 
cast((case when CurrencyCode = 'NULL' THEN 'N/A' else CurrencyCode End) as VARCHAR(10)) as CurrencyCode 
,cast((case when Name2 = 'NULL' THEN 'N/A' else Name2 End) as VARCHAR(20)) as Name 
,cast(SUBSTR ( (case when ModifiedDate8 = 'NULL' THEN NULL else ModifiedDate8 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.Currency WHERE ModifiedDate IS NULL ;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	insert into DB_STG2.CurrencyRate 
sel distinct 
cast((case when CurrencyRateID2 = 'NULL' THEN NULL else CurrencyRateID2 End) as INT) as CurrencyRateID 
,cast(SUBSTR ( (case when CurrencyRateDate = 'NULL' THEN NULL else CurrencyRateDate End), 1,11) AS DATE ) as CurrencyRateDate 
,cast((case when FromCurrencyCode = 'NULL' THEN NULL else FromCurrencyCode End) as VARCHAR (10) ) as FromCurrencyCode
,cast((case when ToCurrencyCode = 'NULL' THEN NULL else ToCurrencyCode End) as VARCHAR (10) ) as ToCurrencyCode
,cast((case when AverageRate = 'NULL' THEN NULL else AverageRate End) as DECIMAL(5,2) ) as AverageRate
,cast((case when EndOfDayRate = 'NULL' THEN NULL else EndOfDayRate End) as DECIMAL(5,2) ) as EndOfDayRate
,cast(SUBSTR ( (case when ModifiedDate7 = 'NULL' THEN NULL else ModifiedDate7 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2011


union all

sel distinct 
cast((case when CurrencyRateID2 = 'NULL' THEN NULL else CurrencyRateID2 End) as INT) as CurrencyRateID 
,cast(SUBSTR ( (case when CurrencyRateDate = 'NULL' THEN NULL else CurrencyRateDate End), 1,11) AS DATE ) as CurrencyRateDate 
,cast((case when FromCurrencyCode = 'NULL' THEN NULL else FromCurrencyCode End) as VARCHAR (10) ) as FromCurrencyCode
,cast((case when ToCurrencyCode = 'NULL' THEN NULL else ToCurrencyCode End) as VARCHAR (10) ) as ToCurrencyCode
,cast((case when AverageRate = 'NULL' THEN NULL else AverageRate End) as DECIMAL(5,2) ) as AverageRate
,cast((case when EndOfDayRate = 'NULL' THEN NULL else EndOfDayRate End) as DECIMAL(5,2) ) as EndOfDayRate
,cast(SUBSTR ( (case when ModifiedDate7 = 'NULL' THEN NULL else ModifiedDate7 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2012
	
	
union all

sel distinct 
cast((case when CurrencyRateID2 = 'NULL' THEN NULL else CurrencyRateID2 End) as INT) as CurrencyRateID 
,cast(SUBSTR ( (case when CurrencyRateDate = 'NULL' THEN NULL else CurrencyRateDate End), 1,11) AS DATE ) as CurrencyRateDate 
,cast((case when FromCurrencyCode = 'NULL' THEN NULL else FromCurrencyCode End) as VARCHAR (10) ) as FromCurrencyCode
,cast((case when ToCurrencyCode = 'NULL' THEN NULL else ToCurrencyCode End) as VARCHAR (10) ) as ToCurrencyCode
,cast((case when AverageRate = 'NULL' THEN NULL else AverageRate End) as DECIMAL(5,2) ) as AverageRate
,cast((case when EndOfDayRate = 'NULL' THEN NULL else EndOfDayRate End) as DECIMAL(5,2) ) as EndOfDayRate
,cast(SUBSTR ( (case when ModifiedDate7 = 'NULL' THEN NULL else ModifiedDate7 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2013
	
	
union all

sel distinct 
cast((case when CurrencyRateID2 = 'NULL' THEN NULL else CurrencyRateID2 End) as INT) as CurrencyRateID 
,cast(SUBSTR ( (case when CurrencyRateDate = 'NULL' THEN NULL else CurrencyRateDate End), 1,11) AS DATE ) as CurrencyRateDate 
,cast((case when FromCurrencyCode = 'NULL' THEN NULL else FromCurrencyCode End) as VARCHAR (10) ) as FromCurrencyCode
,cast((case when ToCurrencyCode = 'NULL' THEN NULL else ToCurrencyCode End) as VARCHAR (10) ) as ToCurrencyCode
,cast((case when AverageRate = 'NULL' THEN NULL else AverageRate End) as DECIMAL(5,2) ) as AverageRate
,cast((case when EndOfDayRate = 'NULL' THEN NULL else EndOfDayRate End) as DECIMAL(5,2) ) as EndOfDayRate
,cast(SUBSTR ( (case when ModifiedDate7 = 'NULL' THEN NULL else ModifiedDate7 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2014 ;

DEL  FROM DB_STG2.CurrencyRate WHERE ModifiedDate IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	insert into DB_STG2.SpecialOffer 
sel distinct 
cast((case when SpecialOfferID2 = 'NULL' THEN Null else SpecialOfferID2 End) as BYTEINT) as SpecialOfferID
,cast((case when Description = 'NULL' THEN Null else Description End) as VARCHAR(100) ) as Description
,cast((case when DiscountPct = 'NULL' THEN Null else DiscountPct End) as DECIMAL(2,2) ) as DiscountPct
,cast((case when Type_ = 'NULL' THEN Null else Type_ End) as VARCHAR(50)) as Type_
,cast((case when Category = 'NULL' THEN Null else Category End) as VARCHAR(50)) as Category
,cast(SUBSTR ( (case when StartDate = 'NULL' THEN NULL else StartDate End), 1,11) AS DATE ) as StartDate 
,cast(SUBSTR ( (case when EndDate = 'NULL' THEN NULL else EndDate End), 1,11) AS DATE ) as EndDate 
,cast((case when MinQty = 'NULL' THEN 0 else MinQty End) as BYTEINT) as MinQty
,cast((case when MaxQty = 'NULL' THEN 0 else MaxQty End) as BYTEINT) as MaxQty
,cast((case when rowguid3 = 'NULL' THEN Null else rowguid3 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate5 = 'NULL' THEN NULL else ModifiedDate5 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2011


union all

sel distinct 
cast((case when SpecialOfferID2 = 'NULL' THEN Null else SpecialOfferID2 End) as BYTEINT) as SpecialOfferID
,cast((case when Description = 'NULL' THEN Null else Description End) as VARCHAR(100) ) as Description
,cast((case when DiscountPct = 'NULL' THEN Null else DiscountPct End) as DECIMAL(2,2) ) as DiscountPct
,cast((case when Type_ = 'NULL' THEN Null else Type_ End) as VARCHAR(50)) as Type_
,cast((case when Category = 'NULL' THEN Null else Category End) as VARCHAR(50)) as Category
,cast(SUBSTR ( (case when StartDate = 'NULL' THEN NULL else StartDate End), 1,11) AS DATE ) as StartDate 
,cast(SUBSTR ( (case when EndDate = 'NULL' THEN NULL else EndDate End), 1,11) AS DATE ) as EndDate 
,cast((case when MinQty = 'NULL' THEN 0 else MinQty End) as BYTEINT) as MinQty
,cast((case when MaxQty = 'NULL' THEN 0 else MaxQty End) as BYTEINT) as MaxQty
,cast((case when rowguid3 = 'NULL' THEN Null else rowguid3 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate5 = 'NULL' THEN NULL else ModifiedDate5 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2012

union all

sel distinct 
cast((case when SpecialOfferID2 = 'NULL' THEN Null else SpecialOfferID2 End) as BYTEINT) as SpecialOfferID
,cast((case when Description = 'NULL' THEN Null else Description End) as VARCHAR(100) ) as Description
,cast((case when DiscountPct = 'NULL' THEN Null else DiscountPct End) as DECIMAL(2,2) ) as DiscountPct
,cast((case when Type_ = 'NULL' THEN Null else Type_ End) as VARCHAR(50)) as Type_
,cast((case when Category = 'NULL' THEN Null else Category End) as VARCHAR(50)) as Category
,cast(SUBSTR ( (case when StartDate = 'NULL' THEN NULL else StartDate End), 1,11) AS DATE ) as StartDate 
,cast(SUBSTR ( (case when EndDate = 'NULL' THEN NULL else EndDate End), 1,11) AS DATE ) as EndDate 
,cast((case when MinQty = 'NULL' THEN 0 else MinQty End) as BYTEINT) as MinQty
,cast((case when MaxQty = 'NULL' THEN 0 else MaxQty End) as BYTEINT) as MaxQty
,cast((case when rowguid3 = 'NULL' THEN Null else rowguid3 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate5 = 'NULL' THEN NULL else ModifiedDate5 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2013

union all

sel distinct 
cast((case when SpecialOfferID2 = 'NULL' THEN Null else SpecialOfferID2 End) as BYTEINT) as SpecialOfferID
,cast((case when Description = 'NULL' THEN Null else Description End) as VARCHAR(100) ) as Description
,cast((case when DiscountPct = 'NULL' THEN Null else DiscountPct End) as DECIMAL(2,2) ) as DiscountPct
,cast((case when Type_ = 'NULL' THEN Null else Type_ End) as VARCHAR(50)) as Type_
,cast((case when Category = 'NULL' THEN Null else Category End) as VARCHAR(50)) as Category
,cast(SUBSTR ( (case when StartDate = 'NULL' THEN NULL else StartDate End), 1,11) AS DATE ) as StartDate 
,cast(SUBSTR ( (case when EndDate = 'NULL' THEN NULL else EndDate End), 1,11) AS DATE ) as EndDate 
,cast((case when MinQty = 'NULL' THEN 0 else MinQty End) as BYTEINT) as MinQty
,cast((case when MaxQty = 'NULL' THEN 0 else MaxQty End) as BYTEINT) as MaxQty
,cast((case when rowguid3 = 'NULL' THEN Null else rowguid3 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate5 = 'NULL' THEN NULL else ModifiedDate5 End), 1,11) AS DATE ) as ModifiedDate 


From DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SpecialOffer WHERE SpecialOfferID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into DB_STG2.SalesTerritoryHistory 
sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID
,cast((case when TerritoryID3 = 'NULL' THEN Null else TerritoryID3 End) as BYTEINT ) as TerritoryID
 ,cast((case when StartDate2 = 'NULL' THEN NULL else StartDate2 End)AS TIMESTAMP(6) ) as StartDate 
 ,cast((case when EndDate2 = 'NULL' THEN NULL else EndDate2 End) AS TIMESTAMP(6) ) as EndDate 
,cast((case when rowguid6 = 'NULL' THEN Null else rowguid6 End) as VARCHAR(40) ) as rowguid
,cast(SUBSTR ( (case when ModifiedDate12 = 'NULL' THEN NULL else ModifiedDate12 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2011


union all

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID
,cast((case when TerritoryID3 = 'NULL' THEN Null else TerritoryID3 End) as BYTEINT ) as TerritoryID
 ,cast((case when StartDate2 = 'NULL' THEN NULL else StartDate2 End)AS TIMESTAMP(6) ) as StartDate 
 ,cast((case when EndDate2 = 'NULL' THEN NULL else EndDate2 End) AS TIMESTAMP(6) ) as EndDate 
,cast((case when rowguid6 = 'NULL' THEN Null else rowguid6 End) as VARCHAR(40) ) as rowguid
,cast(SUBSTR ( (case when ModifiedDate12 = 'NULL' THEN NULL else ModifiedDate12 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2012

union all

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID
,cast((case when TerritoryID3 = 'NULL' THEN Null else TerritoryID3 End) as BYTEINT ) as TerritoryID
 ,cast((case when StartDate2 = 'NULL' THEN NULL else StartDate2 End)AS TIMESTAMP(6) ) as StartDate 
 ,cast((case when EndDate2 = 'NULL' THEN NULL else EndDate2 End) AS TIMESTAMP(6) ) as EndDate 
,cast((case when rowguid6 = 'NULL' THEN Null else rowguid6 End) as VARCHAR(40) ) as rowguid
,cast(SUBSTR ( (case when ModifiedDate12 = 'NULL' THEN NULL else ModifiedDate12 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2013

union all

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID
,cast((case when TerritoryID3 = 'NULL' THEN Null else TerritoryID3 End) as BYTEINT ) as TerritoryID
 ,cast((case when StartDate2 = 'NULL' THEN NULL else StartDate2 End)AS TIMESTAMP(6) ) as StartDate 
 ,cast((case when EndDate2 = 'NULL' THEN NULL else EndDate2 End) AS TIMESTAMP(6) ) as EndDate 
,cast((case when rowguid6 = 'NULL' THEN Null else rowguid6 End) as VARCHAR(40) ) as rowguid
,cast(SUBSTR ( (case when ModifiedDate12 = 'NULL' THEN NULL else ModifiedDate12 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesTerritoryHistory WHERE BusinessEntityID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		insert into DB_STG2.SalesTerritory 
sel distinct 
cast((case when TerritoryID2 = 'NULL' THEN Null else TerritoryID2 End) as BYTEINT) as TerritoryID
,cast((case when Name3 = 'NULL' THEN Null else Name3 End) as VARCHAR(20) ) as Name
,cast((case when CountryRegionCode = 'NULL' THEN Null else CountryRegionCode End) as VARCHAR(10) ) as CountryRegionCode
,cast((case when Group_ = 'NULL' THEN Null else Group_ End) as VARCHAR (20) ) as Group_
,cast((case when SalesYTD = 'NULL' THEN Null else SalesYTD End) as DECIMAL(15,2) ) as SalesYTD
,cast((case when SalesLastYear = 'NULL' THEN Null else SalesLastYear End) as DECIMAL(15,2) ) as SalesLastYear
,cast((case when CostYTD = 'NULL' THEN Null else CostYTD End) as DECIMAL(10,2)) as CostYTD
,cast((case when CostLastYear = 'NULL' THEN Null else CostLastYear End) as DECIMAL(10,2)) as CostLastYear
,cast((case when rowguid5 = 'NULL' THEN Null else rowguid5 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate11 = 'NULL' THEN NULL else ModifiedDate11 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2011

union all

sel distinct 
cast((case when TerritoryID2 = 'NULL' THEN Null else TerritoryID2 End) as BYTEINT) as TerritoryID
,cast((case when Name3 = 'NULL' THEN Null else Name3 End) as VARCHAR(20) ) as Name
,cast((case when CountryRegionCode = 'NULL' THEN Null else CountryRegionCode End) as VARCHAR(10) ) as CountryRegionCode
,cast((case when Group_ = 'NULL' THEN Null else Group_ End) as VARCHAR (20) ) as Group_
,cast((case when SalesYTD = 'NULL' THEN Null else SalesYTD End) as DECIMAL(15,2) ) as SalesYTD
,cast((case when SalesLastYear = 'NULL' THEN Null else SalesLastYear End) as DECIMAL(15,2) ) as SalesLastYear
,cast((case when CostYTD = 'NULL' THEN Null else CostYTD End) as DECIMAL(10,2)) as CostYTD
,cast((case when CostLastYear = 'NULL' THEN Null else CostLastYear End) as DECIMAL(10,2)) as CostLastYear
,cast((case when rowguid5 = 'NULL' THEN Null else rowguid5 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate11 = 'NULL' THEN NULL else ModifiedDate11 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2012

union all

sel distinct 
cast((case when TerritoryID2 = 'NULL' THEN Null else TerritoryID2 End) as BYTEINT) as TerritoryID
,cast((case when Name3 = 'NULL' THEN Null else Name3 End) as VARCHAR(20) ) as Name
,cast((case when CountryRegionCode = 'NULL' THEN Null else CountryRegionCode End) as VARCHAR(10) ) as CountryRegionCode
,cast((case when Group_ = 'NULL' THEN Null else Group_ End) as VARCHAR (20) ) as Group_
,cast((case when SalesYTD = 'NULL' THEN Null else SalesYTD End) as DECIMAL(15,2) ) as SalesYTD
,cast((case when SalesLastYear = 'NULL' THEN Null else SalesLastYear End) as DECIMAL(15,2) ) as SalesLastYear
,cast((case when CostYTD = 'NULL' THEN Null else CostYTD End) as DECIMAL(10,2)) as CostYTD
,cast((case when CostLastYear = 'NULL' THEN Null else CostLastYear End) as DECIMAL(10,2)) as CostLastYear
,cast((case when rowguid5 = 'NULL' THEN Null else rowguid5 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate11 = 'NULL' THEN NULL else ModifiedDate11 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2013

union all

sel distinct 
cast((case when TerritoryID2 = 'NULL' THEN Null else TerritoryID2 End) as BYTEINT) as TerritoryID
,cast((case when Name3 = 'NULL' THEN Null else Name3 End) as VARCHAR(20) ) as Name
,cast((case when CountryRegionCode = 'NULL' THEN Null else CountryRegionCode End) as VARCHAR(10) ) as CountryRegionCode
,cast((case when Group_ = 'NULL' THEN Null else Group_ End) as VARCHAR (20) ) as Group_
,cast((case when SalesYTD = 'NULL' THEN Null else SalesYTD End) as DECIMAL(15,2) ) as SalesYTD
,cast((case when SalesLastYear = 'NULL' THEN Null else SalesLastYear End) as DECIMAL(15,2) ) as SalesLastYear
,cast((case when CostYTD = 'NULL' THEN Null else CostYTD End) as DECIMAL(10,2)) as CostYTD
,cast((case when CostLastYear = 'NULL' THEN Null else CostLastYear End) as DECIMAL(10,2)) as CostLastYear
,cast((case when rowguid5 = 'NULL' THEN Null else rowguid5 End) as VARCHAR(40)) as rowguid
,cast(SUBSTR ( (case when ModifiedDate11 = 'NULL' THEN NULL else ModifiedDate11 End), 1,11) AS DATE ) as ModifiedDate 

From DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesTerritory WHERE TerritoryID IS NULL ;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into     DB_STG2.SpecialOfferProduct    
sel distinct 
cast((case when SpecialOfferID3 = 'NULL' THEN Null else SpecialOfferID3 End) as byteint) as SpecialOfferID 
,cast((case when ProductID2 = 'NULL' THEN Null else ProductID2 End) as INT) as ProductID 
,cast((case when rowguid4 = 'NULL' THEN Null else rowguid4 End) as varchar(40)) as rowguid 
,cast(SUBSTR ( (case when ModifiedDate6 = 'NULL' THEN NULL else ModifiedDate6 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2011    
    
union all        
sel distinct 
cast((case when SpecialOfferID3 = 'NULL' THEN Null else SpecialOfferID3 End) as byteint) as SpecialOfferID 
,cast((case when ProductID2 = 'NULL' THEN Null else ProductID2 End) as INT) as ProductID 
,cast((case when rowguid4 = 'NULL' THEN Null else rowguid4 End) as varchar(40)) as rowguid 
,cast(SUBSTR ( (case when ModifiedDate6 = 'NULL' THEN NULL else ModifiedDate6 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012    

union all

sel distinct 
cast((case when SpecialOfferID3 = 'NULL' THEN Null else SpecialOfferID3 End) as byteint) as SpecialOfferID 
,cast((case when ProductID2 = 'NULL' THEN Null else ProductID2 End) as INT) as ProductID 
,cast((case when rowguid4 = 'NULL' THEN Null else rowguid4 End) as varchar(40)) as rowguid 
,cast(SUBSTR ( (case when ModifiedDate6 = 'NULL' THEN NULL else ModifiedDate6 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013    

union all

sel distinct 
cast((case when SpecialOfferID3 = 'NULL' THEN Null else SpecialOfferID3 End) as byteint) as SpecialOfferID 
,cast((case when ProductID2 = 'NULL' THEN Null else ProductID2 End) as INT) as ProductID 
,cast((case when rowguid4 = 'NULL' THEN Null else rowguid4 End) as varchar(40)) as rowguid 
,cast(SUBSTR ( (case when ModifiedDate6 = 'NULL' THEN NULL else ModifiedDate6 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014       ;

DEL  FROM DB_STG2.SpecialOfferProduct WHERE SpecialOfferID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into     DB_STG2.CreditCard
sel distinct 
cast((case when CreditCardID2 = 'NULL' THEN Null else CreditCardID2 End) as smallint) as CreditCardID 
,cast((case when CardType_ = 'NULL' THEN Null else CardType_ End) as VARCHAR(20)) as CardType 
,cast((case when CardNumber = 'NULL' THEN Null else CardNumber End) as BIGINT) as CardNumber 
,cast((case when ExpMonth = 'NULL' THEN Null else ExpMonth End) as BYTEINT) as ExpMonth 
,cast((case when ExpYear = 'NULL' THEN Null else ExpYear End) as SMALLINT) as ExpYear 
,cast(SUBSTR ( (case when ModifiedDate9 = 'NULL' THEN NULL else ModifiedDate9 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2011    

union all        

sel distinct 
cast((case when CreditCardID2 = 'NULL' THEN Null else CreditCardID2 End) as smallint) as CreditCardID 
,cast((case when CardType_ = 'NULL' THEN Null else CardType_ End) as VARCHAR(20)) as CardType 
,cast((case when CardNumber = 'NULL' THEN Null else CardNumber End) as BIGINT) as CardNumber 
,cast((case when ExpMonth = 'NULL' THEN Null else ExpMonth End) as BYTEINT) as ExpMonth 
,cast((case when ExpYear = 'NULL' THEN Null else ExpYear End) as SMALLINT) as ExpYear 
,cast(SUBSTR ( (case when ModifiedDate9 = 'NULL' THEN NULL else ModifiedDate9 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012    

union all

sel distinct 
cast((case when CreditCardID2 = 'NULL' THEN Null else CreditCardID2 End) as smallint) as CreditCardID 
,cast((case when CardType_ = 'NULL' THEN Null else CardType_ End) as VARCHAR(20)) as CardType 
,cast((case when CardNumber = 'NULL' THEN Null else CardNumber End) as BIGINT) as CardNumber 
,cast((case when ExpMonth = 'NULL' THEN Null else ExpMonth End) as BYTEINT) as ExpMonth 
,cast((case when ExpYear = 'NULL' THEN Null else ExpYear End) as SMALLINT) as ExpYear 
,cast(SUBSTR ( (case when ModifiedDate9 = 'NULL' THEN NULL else ModifiedDate9 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013    

union all

sel distinct 
cast((case when CreditCardID2 = 'NULL' THEN Null else CreditCardID2 End) as smallint) as CreditCardID 
,cast((case when CardType_ = 'NULL' THEN Null else CardType_ End) as VARCHAR(20)) as CardType 
,cast((case when CardNumber = 'NULL' THEN Null else CardNumber End) as BIGINT) as CardNumber 
,cast((case when ExpMonth = 'NULL' THEN Null else ExpMonth End) as BYTEINT) as ExpMonth 
,cast((case when ExpYear = 'NULL' THEN Null else ExpYear End) as SMALLINT) as ExpYear 
,cast(SUBSTR ( (case when ModifiedDate9 = 'NULL' THEN NULL else ModifiedDate9 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014      ;

DEL  FROM DB_STG2.CreditCard WHERE CreditCardID IS NULL ;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.SalesReason	
sel distinct 
cast((case when SalesReasonID2 = 'NULL' THEN Null else SalesReasonID2 End) as byteint) as SalesReasonID 
,cast((case when Name = 'NULL' THEN Null else Name End) as VARCHAR(20)) as Name 
,cast((case when ReasonType_ = 'NULL' THEN Null else ReasonType_ End) as VARCHAR(20)) as ReasonType 
 ,cast(SUBSTR ( (case when ModifiedDate3 = 'NULL' THEN NULL else ModifiedDate3 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2011	
		
	
union all		

sel distinct 
cast((case when SalesReasonID2 = 'NULL' THEN Null else SalesReasonID2 End) as byteint) as SalesReasonID 
,cast((case when Name = 'NULL' THEN Null else Name End) as VARCHAR(20)) as Name 
,cast((case when ReasonType_ = 'NULL' THEN Null else ReasonType_ End) as VARCHAR(20)) as ReasonType 
 ,cast(SUBSTR ( (case when ModifiedDate3 = 'NULL' THEN NULL else ModifiedDate3 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012	

union all

sel distinct 
cast((case when SalesReasonID2 = 'NULL' THEN Null else SalesReasonID2 End) as byteint) as SalesReasonID 
,cast((case when Name = 'NULL' THEN Null else Name End) as VARCHAR(20)) as Name 
,cast((case when ReasonType_ = 'NULL' THEN Null else ReasonType_ End) as VARCHAR(20)) as ReasonType 
 ,cast(SUBSTR ( (case when ModifiedDate3 = 'NULL' THEN NULL else ModifiedDate3 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013	

union all

sel distinct 
cast((case when SalesReasonID2 = 'NULL' THEN Null else SalesReasonID2 End) as byteint) as SalesReasonID 
,cast((case when Name = 'NULL' THEN Null else Name End) as VARCHAR(20)) as Name 
,cast((case when ReasonType_ = 'NULL' THEN Null else ReasonType_ End) as VARCHAR(20)) as ReasonType 
 ,cast(SUBSTR ( (case when ModifiedDate3 = 'NULL' THEN NULL else ModifiedDate3 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014		;

DEL  FROM DB_STG2.SalesReason WHERE SalesReasonID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into 	DB_STG2.SalesOrderHeader	
sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as int) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN 0 else SalesOrderID3 End) as int ) as SalesOrderID 
,cast((case when RevisionNumber = 'NULL' THEN 0 else RevisionNumber End) as byteint ) as RevisionNumber 
 ,cast(SUBSTR ( (case when OrderDate = 'NULL' THEN NULL else OrderDate End), 1,11) AS DATE ) as OrderDate 
 ,cast(SUBSTR ( (case when DueDate = 'NULL' THEN NULL else DueDate End), 1,11) AS DATE ) as DueDate 
 ,cast(SUBSTR ( (case when ShipDate = 'NULL' THEN NULL else ShipDate End), 1,11) AS DATE ) as ShipDate 
,cast((case when Status = 'NULL' THEN 0 else Status End) as BYTEINT ) as Status 
,cast((case when OnlineOrderFlag = 'NULL' THEN 0 else OnlineOrderFlag End) as BYTEINT) as OnlineOrderFlag 
,cast((case when SalesOrderNumber = 'NULL' THEN 'N/A' else SalesOrderNumber End) as VARCHAR(15) ) as SalesOrderNumber 
,cast((case when PurchaseOrderNumber = 'NULL' THEN 'N/A' else PurchaseOrderNumber End) as VARCHAR(20) ) as PurchaseOrderNumber 
,cast((case when AccountNumber = 'NULL' THEN 'N/A' else AccountNumber End) as VARCHAR(20) ) as AccountNumber 
,cast((case when CustomerID = 'NULL' THEN 0 else CustomerID End) as INT ) as CustomerID 
,cast((case when SalesPersonID = 'NULL' THEN 0 else SalesPersonID End) as SMALLINT ) as SalesPersonID 
,cast((case when TerritoryID = 'NULL' THEN 0 else TerritoryID End) as BYTEINT ) as TerritoryID 
,cast((case when BillToAddressID = 'NULL' THEN 0 else BillToAddressID End) as INT ) as BillToAddressID 
,cast((case when ShipToAddressID = 'NULL' THEN 0 else ShipToAddressID End) as INT ) as ShipToAddressID 
,cast((case when ShipMethodID = 'NULL' THEN 0 else ShipMethodID End) as BYTEINT ) as ShipMethodID 
,cast((case when CreditCardID = 'NULL' THEN 0 else CreditCardID End) as INT ) as CreditCardID 
,cast((case when CreditCardApprovalCode = 'NULL' THEN 'N/A' else CreditCardApprovalCode End) as VARCHAR(20)) as CreditCardApprovalCode 
,cast((case when CurrencyRateID = 'NULL' THEN 0 else CurrencyRateID End) as INT ) as CurrencyRateID 
,cast((case when SubTotal = 'NULL' THEN 0 else SubTotal End) as DECIMAL(10,2) ) as SubTotal 
,cast((case when TaxAmt = 'NULL' THEN 0 else TaxAmt End) as DECIMAL(10,2) ) as TaxAmt 
,cast((case when Freight = 'NULL' THEN 0 else Freight End) as DECIMAL(10,2) ) as Freight 
,cast((case when TotalDue = 'NULL' THEN 0 else TotalDue End) as DECIMAL(10,2) ) as TotalDue 
,cast((case when Comment_ = 'NULL' THEN 'N/A' else Comment_ End) as VARCHAR (10) ) as Comment_ 
,cast((case when rowguid = 'NULL' THEN 'N/A' else rowguid End) as VARCHAR (40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate = 'NULL' THEN NULL else ModifiedDate End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2011	
		
	
union all		

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as int) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN 0 else SalesOrderID3 End) as int ) as SalesOrderID 
,cast((case when RevisionNumber = 'NULL' THEN 0 else RevisionNumber End) as byteint ) as RevisionNumber 
 ,cast(SUBSTR ( (case when OrderDate = 'NULL' THEN NULL else OrderDate End), 1,11) AS DATE ) as OrderDate 
 ,cast(SUBSTR ( (case when DueDate = 'NULL' THEN NULL else DueDate End), 1,11) AS DATE ) as DueDate 
 ,cast(SUBSTR ( (case when ShipDate = 'NULL' THEN NULL else ShipDate End), 1,11) AS DATE ) as ShipDate 
,cast((case when Status = 'NULL' THEN 0 else Status End) as BYTEINT ) as Status 
,cast((case when OnlineOrderFlag = 'NULL' THEN 0 else OnlineOrderFlag End) as BYTEINT) as OnlineOrderFlag 
,cast((case when SalesOrderNumber = 'NULL' THEN 'N/A' else SalesOrderNumber End) as VARCHAR(15) ) as SalesOrderNumber 
,cast((case when PurchaseOrderNumber = 'NULL' THEN 'N/A' else PurchaseOrderNumber End) as VARCHAR(20) ) as PurchaseOrderNumber 
,cast((case when AccountNumber = 'NULL' THEN 'N/A' else AccountNumber End) as VARCHAR(20) ) as AccountNumber 
,cast((case when CustomerID = 'NULL' THEN 0 else CustomerID End) as INT ) as CustomerID 
,cast((case when SalesPersonID = 'NULL' THEN 0 else SalesPersonID End) as SMALLINT ) as SalesPersonID 
,cast((case when TerritoryID = 'NULL' THEN 0 else TerritoryID End) as BYTEINT ) as TerritoryID 
,cast((case when BillToAddressID = 'NULL' THEN 0 else BillToAddressID End) as INT ) as BillToAddressID 
,cast((case when ShipToAddressID = 'NULL' THEN 0 else ShipToAddressID End) as INT ) as ShipToAddressID 
,cast((case when ShipMethodID = 'NULL' THEN 0 else ShipMethodID End) as BYTEINT ) as ShipMethodID 
,cast((case when CreditCardID = 'NULL' THEN 0 else CreditCardID End) as INT ) as CreditCardID 
,cast((case when CreditCardApprovalCode = 'NULL' THEN 'N/A' else CreditCardApprovalCode End) as VARCHAR(20)) as CreditCardApprovalCode 
,cast((case when CurrencyRateID = 'NULL' THEN 0 else CurrencyRateID End) as INT ) as CurrencyRateID 
,cast((case when SubTotal = 'NULL' THEN 0 else SubTotal End) as DECIMAL(10,2) ) as SubTotal 
,cast((case when TaxAmt = 'NULL' THEN 0 else TaxAmt End) as DECIMAL(10,2) ) as TaxAmt 
,cast((case when Freight = 'NULL' THEN 0 else Freight End) as DECIMAL(10,2) ) as Freight 
,cast((case when TotalDue = 'NULL' THEN 0 else TotalDue End) as DECIMAL(10,2) ) as TotalDue 
,cast((case when Comment_ = 'NULL' THEN 'N/A' else Comment_ End) as VARCHAR (10) ) as Comment_ 
,cast((case when rowguid = 'NULL' THEN 'N/A' else rowguid End) as VARCHAR (40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate = 'NULL' THEN NULL else ModifiedDate End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012 	

union all		


sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as int) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN 0 else SalesOrderID3 End) as int ) as SalesOrderID 
,cast((case when RevisionNumber = 'NULL' THEN 0 else RevisionNumber End) as byteint ) as RevisionNumber 
 ,cast(SUBSTR ( (case when OrderDate = 'NULL' THEN NULL else OrderDate End), 1,11) AS DATE ) as OrderDate 
 ,cast(SUBSTR ( (case when DueDate = 'NULL' THEN NULL else DueDate End), 1,11) AS DATE ) as DueDate 
 ,cast(SUBSTR ( (case when ShipDate = 'NULL' THEN NULL else ShipDate End), 1,11) AS DATE ) as ShipDate 
,cast((case when Status = 'NULL' THEN 0 else Status End) as BYTEINT ) as Status 
,cast((case when OnlineOrderFlag = 'NULL' THEN 0 else OnlineOrderFlag End) as BYTEINT) as OnlineOrderFlag 
,cast((case when SalesOrderNumber = 'NULL' THEN 'N/A' else SalesOrderNumber End) as VARCHAR(15) ) as SalesOrderNumber 
,cast((case when PurchaseOrderNumber = 'NULL' THEN 'N/A' else PurchaseOrderNumber End) as VARCHAR(20) ) as PurchaseOrderNumber 
,cast((case when AccountNumber = 'NULL' THEN 'N/A' else AccountNumber End) as VARCHAR(20) ) as AccountNumber 
,cast((case when CustomerID = 'NULL' THEN 0 else CustomerID End) as INT ) as CustomerID 
,cast((case when SalesPersonID = 'NULL' THEN 0 else SalesPersonID End) as SMALLINT ) as SalesPersonID 
,cast((case when TerritoryID = 'NULL' THEN 0 else TerritoryID End) as BYTEINT ) as TerritoryID 
,cast((case when BillToAddressID = 'NULL' THEN 0 else BillToAddressID End) as INT ) as BillToAddressID 
,cast((case when ShipToAddressID = 'NULL' THEN 0 else ShipToAddressID End) as INT ) as ShipToAddressID 
,cast((case when ShipMethodID = 'NULL' THEN 0 else ShipMethodID End) as BYTEINT ) as ShipMethodID 
,cast((case when CreditCardID = 'NULL' THEN 0 else CreditCardID End) as INT ) as CreditCardID 
,cast((case when CreditCardApprovalCode = 'NULL' THEN 'N/A' else CreditCardApprovalCode End) as VARCHAR(20)) as CreditCardApprovalCode 
,cast((case when CurrencyRateID = 'NULL' THEN 0 else CurrencyRateID End) as INT ) as CurrencyRateID 
,cast((case when SubTotal = 'NULL' THEN 0 else SubTotal End) as DECIMAL(10,2) ) as SubTotal 
,cast((case when TaxAmt = 'NULL' THEN 0 else TaxAmt End) as DECIMAL(10,2) ) as TaxAmt 
,cast((case when Freight = 'NULL' THEN 0 else Freight End) as DECIMAL(10,2) ) as Freight 
,cast((case when TotalDue = 'NULL' THEN 0 else TotalDue End) as DECIMAL(10,2) ) as TotalDue 
,cast((case when Comment_ = 'NULL' THEN 'N/A' else Comment_ End) as VARCHAR (10) ) as Comment_ 
,cast((case when rowguid = 'NULL' THEN 'N/A' else rowguid End) as VARCHAR (40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate = 'NULL' THEN NULL else ModifiedDate End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013

union all		


sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as int) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN 0 else SalesOrderID3 End) as int ) as SalesOrderID 
,cast((case when RevisionNumber = 'NULL' THEN 0 else RevisionNumber End) as byteint ) as RevisionNumber 
 ,cast(SUBSTR ( (case when OrderDate = 'NULL' THEN NULL else OrderDate End), 1,11) AS DATE ) as OrderDate 
 ,cast(SUBSTR ( (case when DueDate = 'NULL' THEN NULL else DueDate End), 1,11) AS DATE ) as DueDate 
 ,cast(SUBSTR ( (case when ShipDate = 'NULL' THEN NULL else ShipDate End), 1,11) AS DATE ) as ShipDate 
,cast((case when Status = 'NULL' THEN 0 else Status End) as BYTEINT ) as Status 
,cast((case when OnlineOrderFlag = 'NULL' THEN 0 else OnlineOrderFlag End) as BYTEINT) as OnlineOrderFlag 
,cast((case when SalesOrderNumber = 'NULL' THEN 'N/A' else SalesOrderNumber End) as VARCHAR(15) ) as SalesOrderNumber 
,cast((case when PurchaseOrderNumber = 'NULL' THEN 'N/A' else PurchaseOrderNumber End) as VARCHAR(20) ) as PurchaseOrderNumber 
,cast((case when AccountNumber = 'NULL' THEN 'N/A' else AccountNumber End) as VARCHAR(20) ) as AccountNumber 
,cast((case when CustomerID = 'NULL' THEN 0 else CustomerID End) as INT ) as CustomerID 
,cast((case when SalesPersonID = 'NULL' THEN 0 else SalesPersonID End) as SMALLINT ) as SalesPersonID 
,cast((case when TerritoryID = 'NULL' THEN 0 else TerritoryID End) as BYTEINT ) as TerritoryID 
,cast((case when BillToAddressID = 'NULL' THEN 0 else BillToAddressID End) as INT ) as BillToAddressID 
,cast((case when ShipToAddressID = 'NULL' THEN 0 else ShipToAddressID End) as INT ) as ShipToAddressID 
,cast((case when ShipMethodID = 'NULL' THEN 0 else ShipMethodID End) as BYTEINT ) as ShipMethodID 
,cast((case when CreditCardID = 'NULL' THEN 0 else CreditCardID End) as INT ) as CreditCardID 
,cast((case when CreditCardApprovalCode = 'NULL' THEN 'N/A' else CreditCardApprovalCode End) as VARCHAR(20)) as CreditCardApprovalCode 
,cast((case when CurrencyRateID = 'NULL' THEN 0 else CurrencyRateID End) as INT ) as CurrencyRateID 
,cast((case when SubTotal = 'NULL' THEN 0 else SubTotal End) as DECIMAL(10,2) ) as SubTotal 
,cast((case when TaxAmt = 'NULL' THEN 0 else TaxAmt End) as DECIMAL(10,2) ) as TaxAmt 
,cast((case when Freight = 'NULL' THEN 0 else Freight End) as DECIMAL(10,2) ) as Freight 
,cast((case when TotalDue = 'NULL' THEN 0 else TotalDue End) as DECIMAL(10,2) ) as TotalDue 
,cast((case when Comment_ = 'NULL' THEN 'N/A' else Comment_ End) as VARCHAR (10) ) as Comment_ 
,cast((case when rowguid = 'NULL' THEN 'N/A' else rowguid End) as VARCHAR (40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate = 'NULL' THEN NULL else ModifiedDate End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014	; 

DEL  FROM DB_STG2.SalesOrderHeader WHERE BusinessEntityID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.SalesPersonQuotaHistory	
sel distinct 
cast((case when BusinessEntityID3 = 'NULL' THEN Null else BusinessEntityID3 End) as SMALLINT) as BusinessEntityID 
 ,cast(SUBSTR ( (case when QuotaDate = 'NULL' THEN NULL else QuotaDate End), 1,11) AS DATE ) as QuotaDate 
,cast((case when SalesQuota = 'NULL' THEN Null else SalesQuota End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when rowguid7 = 'NULL' THEN Null else rowguid7 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate13 = 'NULL' THEN NULL else ModifiedDate13 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2011	
		
	
union all		

sel distinct 
cast((case when BusinessEntityID3 = 'NULL' THEN Null else BusinessEntityID3 End) as SMALLINT) as BusinessEntityID 
 ,cast(SUBSTR ( (case when QuotaDate = 'NULL' THEN NULL else QuotaDate End), 1,11) AS DATE ) as QuotaDate 
,cast((case when SalesQuota = 'NULL' THEN Null else SalesQuota End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when rowguid7 = 'NULL' THEN Null else rowguid7 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate13 = 'NULL' THEN NULL else ModifiedDate13 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012

union all	

sel distinct 
cast((case when BusinessEntityID3 = 'NULL' THEN Null else BusinessEntityID3 End) as SMALLINT) as BusinessEntityID 
 ,cast(SUBSTR ( (case when QuotaDate = 'NULL' THEN NULL else QuotaDate End), 1,11) AS DATE ) as QuotaDate 
,cast((case when SalesQuota = 'NULL' THEN Null else SalesQuota End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when rowguid7 = 'NULL' THEN Null else rowguid7 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate13 = 'NULL' THEN NULL else ModifiedDate13 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013

union all	

sel distinct 
cast((case when BusinessEntityID3 = 'NULL' THEN Null else BusinessEntityID3 End) as SMALLINT) as BusinessEntityID 
 ,cast(SUBSTR ( (case when QuotaDate = 'NULL' THEN NULL else QuotaDate End), 1,11) AS DATE ) as QuotaDate 
,cast((case when SalesQuota = 'NULL' THEN Null else SalesQuota End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when rowguid7 = 'NULL' THEN Null else rowguid7 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate13 = 'NULL' THEN NULL else ModifiedDate13 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesPersonQuotaHistory WHERE BusinessEntityID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.SalesPerson	
sel distinct 
cast((case when BusinessEntityID4 = 'NULL' THEN Null else BusinessEntityID4 End) as SMALLINT) as BusinessEntityID 
,cast((case when TerritoryID4 = 'NULL' THEN Null else TerritoryID4 End) as BYTEINT ) as TerritoryID 
,cast((case when SalesQuota2 = 'NULL' THEN Null else SalesQuota2 End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when Bonus = 'NULL' THEN Null else Bonus End) as DECIMAL(10,2) ) as Bonus 
,cast((case when CommissionPct = 'NULL' THEN Null else CommissionPct End) as DECIMAL(10,2) ) as CommissionPct 
,cast((case when SalesYTD2 = 'NULL' THEN Null else SalesYTD2 End) as DECIMAL(10,2) ) as SalesYTD 
,cast((case when SalesLastYear2 = 'NULL' THEN Null else SalesLastYear2 End) as DECIMAL(10,2) ) as SalesLastYear 
,cast((case when rowguid8 = 'NULL' THEN Null else rowguid8 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate14 = 'NULL' THEN NULL else ModifiedDate14 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2011	
		
	
union all	

sel distinct 
cast((case when BusinessEntityID4 = 'NULL' THEN Null else BusinessEntityID4 End) as SMALLINT) as BusinessEntityID 
,cast((case when TerritoryID4 = 'NULL' THEN Null else TerritoryID4 End) as BYTEINT ) as TerritoryID 
,cast((case when SalesQuota2 = 'NULL' THEN Null else SalesQuota2 End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when Bonus = 'NULL' THEN Null else Bonus End) as DECIMAL(10,2) ) as Bonus 
,cast((case when CommissionPct = 'NULL' THEN Null else CommissionPct End) as DECIMAL(10,2) ) as CommissionPct 
,cast((case when SalesYTD2 = 'NULL' THEN Null else SalesYTD2 End) as DECIMAL(10,2) ) as SalesYTD 
,cast((case when SalesLastYear2 = 'NULL' THEN Null else SalesLastYear2 End) as DECIMAL(10,2) ) as SalesLastYear 
,cast((case when rowguid8 = 'NULL' THEN Null else rowguid8 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate14 = 'NULL' THEN NULL else ModifiedDate14 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2012

union all	

sel distinct 
cast((case when BusinessEntityID4 = 'NULL' THEN Null else BusinessEntityID4 End) as SMALLINT) as BusinessEntityID 
,cast((case when TerritoryID4 = 'NULL' THEN Null else TerritoryID4 End) as BYTEINT ) as TerritoryID 
,cast((case when SalesQuota2 = 'NULL' THEN Null else SalesQuota2 End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when Bonus = 'NULL' THEN Null else Bonus End) as DECIMAL(10,2) ) as Bonus 
,cast((case when CommissionPct = 'NULL' THEN Null else CommissionPct End) as DECIMAL(10,2) ) as CommissionPct 
,cast((case when SalesYTD2 = 'NULL' THEN Null else SalesYTD2 End) as DECIMAL(10,2) ) as SalesYTD 
,cast((case when SalesLastYear2 = 'NULL' THEN Null else SalesLastYear2 End) as DECIMAL(10,2) ) as SalesLastYear 
,cast((case when rowguid8 = 'NULL' THEN Null else rowguid8 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate14 = 'NULL' THEN NULL else ModifiedDate14 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2013

union all	

sel distinct 
cast((case when BusinessEntityID4 = 'NULL' THEN Null else BusinessEntityID4 End) as SMALLINT) as BusinessEntityID 
,cast((case when TerritoryID4 = 'NULL' THEN Null else TerritoryID4 End) as BYTEINT ) as TerritoryID 
,cast((case when SalesQuota2 = 'NULL' THEN Null else SalesQuota2 End) as DECIMAL(10,2) ) as SalesQuota 
,cast((case when Bonus = 'NULL' THEN Null else Bonus End) as DECIMAL(10,2) ) as Bonus 
,cast((case when CommissionPct = 'NULL' THEN Null else CommissionPct End) as DECIMAL(10,2) ) as CommissionPct 
,cast((case when SalesYTD2 = 'NULL' THEN Null else SalesYTD2 End) as DECIMAL(10,2) ) as SalesYTD 
,cast((case when SalesLastYear2 = 'NULL' THEN Null else SalesLastYear2 End) as DECIMAL(10,2) ) as SalesLastYear 
,cast((case when rowguid8 = 'NULL' THEN Null else rowguid8 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate14 = 'NULL' THEN NULL else ModifiedDate14 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesPerson WHERE BusinessEntityID IS NULL ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.PersonCreditCard	
sel distinct 
cast((case when BusinessEntityID = 'NULL' THEN Null else BusinessEntityID End) as INT) as BusinessEntityID 
,cast((case when CreditCardID3 = 'NULL' THEN Null else CreditCardID3 End) as INT ) as CreditCardID 
 ,cast(SUBSTR ( (case when ModifiedDate10 = 'NULL' THEN NULL else ModifiedDate10 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2011	
		
	
union all	

sel distinct 
cast((case when BusinessEntityID = 'NULL' THEN Null else BusinessEntityID End) as INT) as BusinessEntityID 
,cast((case when CreditCardID3 = 'NULL' THEN Null else CreditCardID3 End) as INT ) as CreditCardID 
 ,cast(SUBSTR ( (case when ModifiedDate10 = 'NULL' THEN NULL else ModifiedDate10 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012

union all	

sel distinct 
cast((case when BusinessEntityID = 'NULL' THEN Null else BusinessEntityID End) as INT) as BusinessEntityID 
,cast((case when CreditCardID3 = 'NULL' THEN Null else CreditCardID3 End) as INT ) as CreditCardID 
 ,cast(SUBSTR ( (case when ModifiedDate10 = 'NULL' THEN NULL else ModifiedDate10 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013

union all	

sel distinct 
cast((case when BusinessEntityID = 'NULL' THEN Null else BusinessEntityID End) as INT) as BusinessEntityID 
,cast((case when CreditCardID3 = 'NULL' THEN Null else CreditCardID3 End) as INT ) as CreditCardID 
 ,cast(SUBSTR ( (case when ModifiedDate10 = 'NULL' THEN NULL else ModifiedDate10 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.PersonCreditCard WHERE BusinessEntityID IS NULL ;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.SalesOrderHeaderSalesReason	
sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as INT) as BusinessEntityID 
,cast((case when SalesOrderID2 = 'NULL' THEN 0 else SalesOrderID2 End) as INT ) as SalesOrderID 
,cast((case when SalesReasonID = 'NULL' THEN 0 else SalesReasonID End) as BYTEINT ) as SalesReasonID 
 ,cast(SUBSTR ( (case when ModifiedDate2 = 'NULL' THEN NULL else ModifiedDate2 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2011	
		
	
union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as INT) as BusinessEntityID 
,cast((case when SalesOrderID2 = 'NULL' THEN 0 else SalesOrderID2 End) as INT ) as SalesOrderID 
,cast((case when SalesReasonID = 'NULL' THEN 0 else SalesReasonID End) as BYTEINT ) as SalesReasonID 
 ,cast(SUBSTR ( (case when ModifiedDate2 = 'NULL' THEN NULL else ModifiedDate2 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012

union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as INT) as BusinessEntityID 
,cast((case when SalesOrderID2 = 'NULL' THEN 0 else SalesOrderID2 End) as INT ) as SalesOrderID 
,cast((case when SalesReasonID = 'NULL' THEN 0 else SalesReasonID End) as BYTEINT ) as SalesReasonID 
 ,cast(SUBSTR ( (case when ModifiedDate2 = 'NULL' THEN NULL else ModifiedDate2 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013

union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN 0 else BusinessEntityID2 End) as INT) as BusinessEntityID 
,cast((case when SalesOrderID2 = 'NULL' THEN 0 else SalesOrderID2 End) as INT ) as SalesOrderID 
,cast((case when SalesReasonID = 'NULL' THEN 0 else SalesReasonID End) as BYTEINT ) as SalesReasonID 
 ,cast(SUBSTR ( (case when ModifiedDate2 = 'NULL' THEN NULL else ModifiedDate2 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesOrderHeaderSalesReason WHERE BusinessEntityID IS NULL ;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into 	DB_STG2.SalesOrderDetail	
sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN Null else SalesOrderID3 End) as INT ) as SalesOrderID 
,cast((case when SalesOrderDetailID = 'NULL' THEN Null else SalesOrderDetailID End) as INT ) as SalesOrderDetailID 
,cast((case when CarrierTrackingNumber = 'NULL' THEN 'N/A' else CarrierTrackingNumber End) as VARCHAR(20) ) as CarrierTrackingNumber 
,cast((case when OrderQty = 'NULL' THEN Null else OrderQty End) as SMALLINT ) as OrderQty 
,cast((case when ProductID = 'NULL' THEN Null else ProductID End) as SMALLINT ) as ProductID 
,cast((case when SpecialOfferID = 'NULL' THEN Null else SpecialOfferID End) as BYTEINT ) as SpecialOfferID
,cast((case when UnitPrice = 'NULL' THEN Null else UnitPrice End) as DECIMAL(10,2) ) as UnitPrice 
,cast((case when UnitPriceDiscount = 'NULL' THEN Null else UnitPriceDiscount End) as DECIMAL(10,2) ) as UnitPriceDiscount 
,cast((case when LineTotal = 'NULL' THEN Null else LineTotal End) as DECIMAL(10,2) ) as LineTotal
,cast((case when rowguid2 = 'NULL' THEN Null else rowguid2 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate4 = 'NULL' THEN NULL else ModifiedDate4 End), 1,11) AS DATE ) as ModifiedDate 


from DB_STG1.Sales_2011	
		
	
union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN Null else SalesOrderID3 End) as INT ) as SalesOrderID 
,cast((case when SalesOrderDetailID = 'NULL' THEN Null else SalesOrderDetailID End) as INT ) as SalesOrderDetailID 
,cast((case when CarrierTrackingNumber = 'NULL' THEN 'N/A' else CarrierTrackingNumber End) as VARCHAR(20) ) as CarrierTrackingNumber 
,cast((case when OrderQty = 'NULL' THEN Null else OrderQty End) as SMALLINT ) as OrderQty 
,cast((case when ProductID = 'NULL' THEN Null else ProductID End) as SMALLINT ) as ProductID 
,cast((case when SpecialOfferID = 'NULL' THEN Null else SpecialOfferID End) as BYTEINT ) as SpecialOfferID
,cast((case when UnitPrice = 'NULL' THEN Null else UnitPrice End) as DECIMAL(10,2) ) as UnitPrice 
,cast((case when UnitPriceDiscount = 'NULL' THEN Null else UnitPriceDiscount End) as DECIMAL(10,2) ) as UnitPriceDiscount 
,cast((case when LineTotal = 'NULL' THEN Null else LineTotal End) as DECIMAL(10,2) ) as LineTotal
,cast((case when rowguid2 = 'NULL' THEN Null else rowguid2 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate4 = 'NULL' THEN NULL else ModifiedDate4 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2012

union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN Null else SalesOrderID3 End) as INT ) as SalesOrderID 
,cast((case when SalesOrderDetailID = 'NULL' THEN Null else SalesOrderDetailID End) as INT ) as SalesOrderDetailID 
,cast((case when CarrierTrackingNumber = 'NULL' THEN 'N/A' else CarrierTrackingNumber End) as VARCHAR(20) ) as CarrierTrackingNumber 
,cast((case when OrderQty = 'NULL' THEN Null else OrderQty End) as SMALLINT ) as OrderQty 
,cast((case when ProductID = 'NULL' THEN Null else ProductID End) as SMALLINT ) as ProductID 
,cast((case when SpecialOfferID = 'NULL' THEN Null else SpecialOfferID End) as BYTEINT ) as SpecialOfferID
,cast((case when UnitPrice = 'NULL' THEN Null else UnitPrice End) as DECIMAL(10,2) ) as UnitPrice 
,cast((case when UnitPriceDiscount = 'NULL' THEN Null else UnitPriceDiscount End) as DECIMAL(10,2) ) as UnitPriceDiscount 
,cast((case when LineTotal = 'NULL' THEN Null else LineTotal End) as DECIMAL(10,2) ) as LineTotal
,cast((case when rowguid2 = 'NULL' THEN Null else rowguid2 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate4 = 'NULL' THEN NULL else ModifiedDate4 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2013

union all	

sel distinct 
cast((case when BusinessEntityID2 = 'NULL' THEN Null else BusinessEntityID2 End) as SMALLINT) as BusinessEntityID 
,cast((case when SalesOrderID3 = 'NULL' THEN Null else SalesOrderID3 End) as INT ) as SalesOrderID 
,cast((case when SalesOrderDetailID = 'NULL' THEN Null else SalesOrderDetailID End) as INT ) as SalesOrderDetailID 
,cast((case when CarrierTrackingNumber = 'NULL' THEN 'N/A' else CarrierTrackingNumber End) as VARCHAR(20) ) as CarrierTrackingNumber 
,cast((case when OrderQty = 'NULL' THEN Null else OrderQty End) as SMALLINT ) as OrderQty 
,cast((case when ProductID = 'NULL' THEN Null else ProductID End) as SMALLINT ) as ProductID 
,cast((case when SpecialOfferID = 'NULL' THEN Null else SpecialOfferID End) as BYTEINT ) as SpecialOfferID
,cast((case when UnitPrice = 'NULL' THEN Null else UnitPrice End) as DECIMAL(10,2) ) as UnitPrice 
,cast((case when UnitPriceDiscount = 'NULL' THEN Null else UnitPriceDiscount End) as DECIMAL(10,2) ) as UnitPriceDiscount 
,cast((case when LineTotal = 'NULL' THEN Null else LineTotal End) as DECIMAL(10,2) ) as LineTotal
,cast((case when rowguid2 = 'NULL' THEN Null else rowguid2 End) as VARCHAR(40) ) as rowguid 
 ,cast(SUBSTR ( (case when ModifiedDate4 = 'NULL' THEN NULL else ModifiedDate4 End), 1,11) AS DATE ) as ModifiedDate 

from DB_STG1.Sales_2014	;

DEL  FROM DB_STG2.SalesOrderDetail WHERE BusinessEntityID IS NULL ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.LOGOFF ;
	
	
	
	
	
