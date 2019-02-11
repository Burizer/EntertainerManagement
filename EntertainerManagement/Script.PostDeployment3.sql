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
