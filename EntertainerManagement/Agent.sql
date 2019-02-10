CREATE TABLE [dbo].[Agent]
(
	[Agent_ID] INT IDENTITY(1,1) NOT NULL, 
    [Agent_fName] NVARCHAR(50) NOT NULL, 
    [Agent_lName] NVARCHAR(50) NOT NULL,
	[Agent_salary] money not null,
	[Agent_hiringDate] date  NOT NULL ,
    [FK_agencyOfficeID] int  NOT NULL ,
    CONSTRAINT [FK_AgencyOffice] FOREIGN KEY (FK_agencyOfficeID)
		REFERENCES AgencyOffice (FK_addressID) ON DELETE NO ACTION,
	CONSTRAINT [PK_Agent] PRIMARY KEY (
        [Agent_ID] ASC
    ),
	CONSTRAINT [Agent_salary] CHECK([Agent_salary] > 0),
	CONSTRAINT [Agent_fName] CHECK(LEN([Agent_fName]) > 0),
	CONSTRAINT [Agent_lName] CHECK(LEN([Agent_lName]) > 0)

);

