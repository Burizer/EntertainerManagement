/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*
MERGE INTO Course AS Target 
USING (VALUES 
        (1, 'Economics', 3), 
        (2, 'Literature', 3), 
        (3, 'Chemistry', 4)
) 
AS Source (CourseID, Title, Credits) 
ON Target.CourseID = Source.CourseID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Title, Credits) 
VALUES (Title, Credits);
*/

MERGE INTO Address AS TARGET
USING (VALUES
		(1,'Corscot','A',16,3,'Taloy','2422','Philippines'),
		(2,'Tony','A',16,2,'Massaranduba','89108-000','Brazil'),
		(3,'Springview','B',27,3,'El Pao','','Venezuela' ),
		(4,'Laurel','D',21,3,'Padre Nabeto','2950-107','Portugal'),
		(5,'Coleman','E',24,1,'Lenešice','439 23','Czech Republic') ,
		(6,'Aberg','E',14,1,'Bobowa','38-350','Poland' ),
		(7,'Schiller','B',18,3,'Rogów','95-063','Poland') ,
		(8,'Fuller','D',22,3,'Guinsang-an','9508','Philippines' ),
		(9,'Cambridge','D',20,1,'Al Manşūrah','','Syria' ),
		(10,'Fieldstone','A',15,1,'Kunheda Woerzu Manzu','','China' ),
		(11,'Packers','D',18,3,'Stakhanov','','Ukraine') ,
		(12,'Blue Bill Park','B',17,3,'Niugan','3014','Philippines' ),
		(13,'Hazelcrest','D',15,1,'Ban Bang Kadi Pathum Thani','82160','Thailand' ),
		(14,'Nova','D',32,1,'Nanhai','','China') ,
		(15,'Crownhardt','D',16,2,'Gerdu','','Indonesia' ),
		(16,'Hovde','D',7,3,'Chiquinquirá','154648','Colombia' ),
		(17,'Montana','E',23,1,'Castelo','6120-705','Portugal' ),
		(18,'Rockefeller','A',20,3,'Xarag','','China' ),
		(19,'Dexter','C',17,2,'Aigínio','','Greece' ),
		(20,'Kinsman','A',13,3,'Nantes','44265 CEDEX 2','France')		
)
AS SOURCE (Address_ID,
Address_address,
Address_addressBuilding,
Address_addressNo,
Address_addressNoRange,
Address_city,
Address_zipcode,
Address_country)
ON Target.Address_ID = Source.Address_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Address_address,
Address_addressBuilding,
Address_addressNo,
Address_addressNoRange,
Address_city,
Address_zipcode,
Address_country)
VALUES (Address_address,
Address_addressBuilding,
Address_addressNo,
Address_addressNoRange,
Address_city,
Address_zipcode,
Address_country);

MERGE INTO Agency AS TARGET
USING (VALUES
		(1,'Rock and Roll studios'),
		(2,'The Lion and the Witch'),
		(3,'The New Generation'),
		(4,'Big Business'),
		(5,'Troupe')	
)
AS SOURCE (Agency_ID,
Agency_name)
ON Target.Agency_ID = Source.Agency_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Agency_name)
VALUES (Agency_name);

MERGE INTO OfficeContactInformation AS TARGET
USING (VALUES
		(1,'14389283','+45','lionandwitch@gmail.com','O'),
		(2,'33829548','+42','','P'),
		(3,'5549327132','+41','matrenos@hotmail.po','O'),
		(4,'3849382','+48','rocking_out2@hotmail.uk','O'),
		(5,'','','bigbznz@bznz.us','O')
)
AS SOURCE (ContactInfo_ID,ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type)
ON Target.ContactInfo_ID = Source.ContactInfo_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type)
VALUES (ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type);

MERGE INTO AgentContactInformation AS TARGET
USING (VALUES
		(1,'48332123','+45','','Public'),
		(2,'','','joemarkusson@gmail.com','Private'),
		(3,'3491223174','+44','boblarsen@edumail.dk','Public'),
		(4,'439213','+52','','Private'),
		(5,'88372931','+45','sarahjoergensen@gmail.dk','Private')	
)
AS SOURCE (FK_AgentID,ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type)
ON Target.FK_AgentID = Source.FK_AgentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (FK_AgentID,ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type)
VALUES (FK_AgentID,ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type);

MERGE INTO Agent AS TARGET
USING (VALUES
		(1,'Joseph','Steiner',2000,'20140903',2),
		(2,'Jan','Karlson',250.53,'20071014',4),
		(3,'Marianne','Smith',400.74,'20180808',2),
		(4,'Sabrina','Kriegsdottir',223.9,'9991229',3),
		(5,'Kris','Lawrence',510.2,'20160102',1)	
)
AS SOURCE (Agent_ID, Agent_fName, Agent_lName, Agent_salary, Agent_hiringDate, FK_agencyOfficeID)
ON Target.Agent_ID = Source.Agent_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Agent_fName,Agent_lName,Agent_salary,Agent_hiringDate,FK_agencyOfficeID)
VALUES (Agent_fName,Agent_lName,Agent_salary,Agent_hiringDate,FK_agencyOfficeID);

/*
BULK INSERT Agent
FROM '/enterManaMockData/AgentBulk.csv'
WITH ( FORMAT='CSV');
BULK INSERT Sales.Orders
FROM '\\SystemX\DiskZ\Sales\data\orders.csv'
WITH ( FORMAT='CSV');
/*
MERGE INTO AS TARGET
USING (VALUES
		( ),
		(),
)
AS SOURCE ( )
ON Target. = Source.
WHEN NOT MATCHED BY THEN THEN
INSERT ( )
VALUES ();
MERGE INTO AS TARGET
USING (VALUES
		( ),
		(),
)
AS SOURCE ( )
ON Target. = Source.
WHEN NOT MATCHED BY THEN THEN
INSERT ( )
VALUES ();*/*/