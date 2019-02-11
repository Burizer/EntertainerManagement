MERGE INTO Agent AS TARGET
USING (VALUES
		(1,'Joseph','Steiner',2000,'20140903',2),
		(2,'Jan','Karlson',250.53,'20071014',4),
		(3,'Marianne','Smith',400.74,'20180808',2),
		(4,'Sabrina','Kriegsdottir',223.9,'19991229',3),
		(5,'Kris','Lawrence',510.2,'20160102',1)	
)
AS SOURCE (Agent_ID, Agent_fName, Agent_lName, Agent_salary, Agent_hiringDate, FK_agencyOfficeID)
ON Target.Agent_ID = Source.Agent_ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Agent_fName,Agent_lName,Agent_salary,Agent_hiringDate,FK_agencyOfficeID)
VALUES (Agent_fName,Agent_lName,Agent_salary,Agent_hiringDate,FK_agencyOfficeID);