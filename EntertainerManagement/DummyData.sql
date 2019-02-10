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
INSERT (ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type)
VALUES (ContactInfo_phoneNo,ContactInfo_phoneNoExt,ContactInfo_email,ContactInfo_type);

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
