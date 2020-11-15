/* SQLINES DEMO *** 
*/
CREATE SEQUENCE Tenant_seq;

CREATE TABLE Tenant(
	TenantId int DEFAULT NEXTVAL ('Tenant_seq') NOT NULL,
	Name Varchar(100) NOT NULL,
	DBConnectionString Varchar(1024) NOT NULL,
	Version Varchar(50) NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Tenant PRIMARY KEY 
  (
	TenantId
  )
);

CREATE SEQUENCE Alias_seq;

CREATE TABLE Alias(
	AliasId int DEFAULT NEXTVAL ('Alias_seq') NOT NULL,
	Name Varchar(200) NOT NULL,
	TenantId int NOT NULL,
	SiteId int NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Alias PRIMARY KEY 
  (
	AliasId
  )
);


CREATE SEQUENCE ModuleDefinition_seq;

CREATE TABLE ModuleDefinition(
	ModuleDefinitionId int DEFAULT NEXTVAL ('ModuleDefinition_seq') NOT NULL,
	ModuleDefinitionName Varchar(200) NOT NULL,
	Name Varchar(200) NULL,
	Description Varchar(2000) NULL,
	Categories Varchar(200) NULL,
	Version Varchar(50) NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_ModuleDefinition PRIMARY KEY 
  (
	ModuleDefinitionId
  )
);

CREATE SEQUENCE Job_seq;

CREATE TABLE Job (
	JobId int DEFAULT NEXTVAL ('Job_seq') NOT NULL,
	Name Varchar(200) NOT NULL,
	JobType Varchar(200) NOT NULL,
	Frequency char(1) NOT NULL,
	Interval int NOT NULL,
	StartDate Timestamp(3) NULL,
	EndDate Timestamp(3) NULL,
	IsEnabled Boolean NOT NULL,
	IsStarted Boolean NOT NULL,
	IsExecuting Boolean NOT NULL,
	NextExecution Timestamp(3) NULL,
	RetentionHistory int NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
    CONSTRAINT PK_Job PRIMARY KEY 
    (
	  JobId
    )
);

CREATE SEQUENCE JobLog_seq;

CREATE TABLE JobLog (
	JobLogId int DEFAULT NEXTVAL ('JobLog_seq') NOT NULL,
	JobId int NOT NULL,
	StartDate Timestamp(3) NOT NULL,
	FinishDate Timestamp(3) NULL,
	Succeeded Boolean NULL,
	Notes Text NULL,
    CONSTRAINT PK_JobLog PRIMARY KEY 
    (
	  JobLogId
    ) 
);

/* SQLINES DEMO ***  key relationships

*/
ALTER TABLE Alias ADD CONSTRAINT FK_Alias_Tenant FOREIGN KEY(TenantId)
REFERENCES Tenant (TenantId)
ON DELETE CASCADE;
 

ALTER TABLE JobLog ADD CONSTRAINT FK_JobLog_Job FOREIGN KEY(JobId)
REFERENCES Job (JobId)
ON DELETE CASCADE;
 


