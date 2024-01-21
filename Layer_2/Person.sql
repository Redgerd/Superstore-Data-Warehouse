.LOGON 192.168.18.94 /dbc,dbc;
Drop Table DB_STG2.Person;

Create Table DB_STG2.Person
(
	BusinessEntityID INTEGER
	,PersonType VARCHAR(5)
	,NameStyle BYTEINT
	,PersonTitle VARCHAR(5)
	,FirstName VARCHAR(15)
	,MiddleName VARCHAR(5)
	,LastName VARCHAR(15)
	,Suffix VARCHAR(10)
	,EmailPromotion BYTEINT
	,AdditionalContactInfo VARCHAR(500)
	,Demographics VARCHAR(400)
	,Rowguid VARCHAR(40)
	,ModifiedDate DATE FORMAT 'YYYY-MM-DD'
)
PRIMARY INDEX (BusinessEntityID);


.IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;

SELECT * FROM DB_STG2.person
Sample 1;
.IF ACTIVITYCOUNT <> 0 THEN .GOTO InsertData;

.IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;

.Label InsertData
Insert into DB_STG2.PERSON
Select * from DB_STG1.person;

.IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;
.LOGOFF;





3:30 pm 13/07/2023

11:33 pm 14/07/2023

12:35 am 15/07/2023
