/* SQLINES DEMO *** Master migration script

*/

CREATE UNIQUE INDEX IX_Tenant ON Tenant (Name);

CREATE UNIQUE INDEX IX_Alias ON Alias (Name);

CREATE UNIQUE INDEX IX_ModuleDefinition ON ModuleDefinition (ModuleDefinitionName);

CREATE UNIQUE INDEX IX_Job ON Job (JobType);