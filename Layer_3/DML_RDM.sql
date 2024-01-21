
.LOGON 192.168.18.94 /DBC,DBC ;
DATABASE DB_RDM ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																										--SALES				
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO  DB_RDM.STORE
SEL 
BUSINESSENTITYID
,NAME
,DEMOGRAPHICS
,ROWGUID
,CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE,
CAST(MODIFIEDDATE AS TIME FORMAT 'HH:MI:SS') TIME1
FROM DB_STG2.STORE;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
INSERT INTO DB_RDM.CUSTOMER
SELECT	CUSTOMERID, PERSONID, STOREID, TERRITORYID, ACCOUNTNUMBER,
		ROWGUID
		,CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
,CAST(MODIFIEDDATE AS TIME FORMAT  'HH:MI:SS') AS TIME1
FROM DB_STG2.CUSTOMER;
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.SHOPPINGCARTITEM
SELECT	SHOPPINGCARTITEMID, SHOPPINGCARTID, QUANTITY, PRODUCTID,
		CAST(DATECREATED AS DATE) AS DATECREATED,
		CAST(DATECREATED AS TIME FORMAT 'HH:MI:SS') AS TIME2
		,CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
,CAST(MODIFIEDDATE AS TIME FORMAT  'HH:MI:SS') AS TIME1
		
FROM DB_STG2.SHOPPINGCARTITEM;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.SALESTAXRATE
SELECT	*
FROM DB_STG2.SALESTAXRATE;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.CURRENCY 
SELECT	*
FROM DB_STG2.CURRENCY;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DB_RDM.CURRENCYRATE 
SELECT	*
		FROM DB_STG2.CURRENCYRATE;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.SPECIALOFFER 
SELECT	*
		FROM DB_STG2.SPECIALOFFER;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.SALESTERRITORYHISTORY 
SELECT	*
FROM DB_STG2.SALESTERRITORYHISTORY;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DB_RDM.SALESTERRITORY 
SELECT	*
		FROM DB_STG2.SALESTERRITORY;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO     DB_RDM.SPECIALOFFERPRODUCT    
SELECT	*
FROM DB_STG2.SPECIALOFFERPRODUCT;
 
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO     DB_RDM.CREDITCARD
SELECT	*
FROM DB_STG2.CREDITCARD;
     
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESREASON	
SELECT	*
 FROM DB_STG2.SALESREASON;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESORDERHEADER	
SELECT	BUSINESSENTITYID, SALESORDERID, REVISIONNUMBER, ORDERDATE,
		DUEDATE, SHIPDATE, STATUS, ONLINEORDERFLAG, SALESORDERNUMBER,
		PURCHASEORDERNUMBER, ACCOUNTNUMBER,CustomerID,
		SalesPersonID,TERRITORYID, BILLTOADDRESSID, SHIPTOADDRESSID, SHIPMETHODID,
		CREDITCARDID, CREDITCARDAPPROVALCODE, CURRENCYRATEID, SUBTOTAL,
		TAXAMT, FREIGHT, TOTALDUE, COMMENT_, ROWGUID
		,CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
FROM DB_STG2.SALESORDERHEADER;	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESPERSONQUOTAHISTORY	
SELECT	*
FROM DB_STG2.SALESPERSONQUOTAHISTORY;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESPERSON	
SEL *
FROM DB_STG2.SALESPERSON;	

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.PERSONCREDITCARD	
SELECT	*
FROM DB_STG2.PERSONCREDITCARD;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESORDERHEADERSALESREASON	
SELECT	*
FROM DB_STG2.SALESORDERHEADERSALESREASON;	

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO 	DB_RDM.SALESORDERDETAIL	
SELECT	*

FROM DB_STG2.SALESORDERDETAIL;
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.LOGOFF ;
	
	
	
	
	
