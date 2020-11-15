/* SQLINES DEMO *** 
*/

CREATE SEQUENCE Site_seq;

CREATE TABLE Site(
	SiteId int DEFAULT NEXTVAL ('Site_seq') NOT NULL,
	TenantId int NOT NULL,
	Name Varchar(200) NOT NULL,
	LogoFileId int NULL,
	FaviconFileId int NULL,
	DefaultThemeType Varchar(200) NOT NULL,
	DefaultLayoutType Varchar(200) NOT NULL,
	DefaultContainerType Varchar(200) NOT NULL,
	PwaIsEnabled Boolean NOT NULL,
	PwaAppIconFileId int NULL,
	PwaSplashIconFileId int NULL,
	AllowRegistration Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_Site PRIMARY KEY 
  (
	SiteId
  )
);

CREATE SEQUENCE Page_seq;

CREATE TABLE Page(
	PageId int DEFAULT NEXTVAL ('Page_seq') NOT NULL,
	SiteId int NOT NULL,
	Path Varchar(50) NOT NULL,
	Name Varchar(50) NOT NULL,
	Title Varchar(200) NULL,
	ThemeType Varchar(200) NULL,
	Icon Varchar(50) NOT NULL,
	ParentId int NULL,
	OrderVal int NOT NULL,
	IsNavigation Boolean NOT NULL,
	Url Varchar(500) NULL,
	LayoutType Varchar(200) NOT NULL,
	EditMode Boolean NOT NULL,
	UserId int NULL,
	IsPersonalizable Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_Page PRIMARY KEY 
  (
	PageId
  )
);

CREATE SEQUENCE Module_seq;

CREATE TABLE Module(
	ModuleId int DEFAULT NEXTVAL ('Module_seq') NOT NULL,
	SiteId int NOT NULL,
	ModuleDefinitionName Varchar(200) NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Module PRIMARY KEY 
  (
	ModuleId
  )
);

CREATE SEQUENCE PageModule_seq;

CREATE TABLE PageModule(
	PageModuleId int DEFAULT NEXTVAL ('PageModule_seq') NOT NULL,
	PageId int NOT NULL,
	ModuleId int NOT NULL,
	Title Varchar(200) NOT NULL,
	Pane Varchar(50) NOT NULL,
	OrderVal int NOT NULL,
	ContainerType Varchar(200) NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_PageModule PRIMARY KEY 
  (
	PageModuleId
  )
);

CREATE SEQUENCE User_seq;

CREATE TABLE "user"(
	UserId int DEFAULT NEXTVAL ('User_seq') NOT NULL,
	Username Varchar(256) NOT NULL,
	DisplayName Varchar(50) NOT NULL,
	Email Varchar(256) NOT NULL,
	PhotoFileId int NULL,
	LastLoginOn Timestamp(3) NULL,
	LastIPAddress Varchar(50) NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_User PRIMARY KEY 
  (
	UserId
  )
);

CREATE SEQUENCE Role_seq;

CREATE TABLE Role(
	RoleId int DEFAULT NEXTVAL ('Role_seq') NOT NULL,
	SiteId int NULL,
	Name Varchar(256) NOT NULL,
	Description Varchar(50) NOT NULL,
	IsAutoAssigned Boolean NOT NULL,
	IsSystem Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Role PRIMARY KEY 
  (
	RoleId
  )
);

CREATE SEQUENCE UserRole_seq;

CREATE TABLE UserRole(
	UserRoleId int DEFAULT NEXTVAL ('UserRole_seq') NOT NULL,
	UserId int NOT NULL,
	RoleId int NOT NULL,
	EffectiveDate Timestamp(3) NULL,
	ExpiryDate Timestamp(3) NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_UserRole PRIMARY KEY 
  (
	UserRoleId
  )
);

CREATE SEQUENCE Permission_seq;

CREATE TABLE Permission(
	PermissionId int DEFAULT NEXTVAL ('Permission_seq') NOT NULL,
	SiteId int NOT NULL,
	EntityName Varchar(50) NOT NULL,
	EntityId int NOT NULL,
	PermissionName Varchar(50) NOT NULL,
	RoleId int NULL,
	UserId int NULL,
	IsAuthorized Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Permission PRIMARY KEY 
  (
	PermissionId
  )
);

CREATE SEQUENCE Setting_seq;

CREATE TABLE Setting(
	SettingId int DEFAULT NEXTVAL ('Setting_seq') NOT NULL,
	EntityName Varchar(50) NOT NULL,
	EntityId int NOT NULL,
	SettingName Varchar(50) NOT NULL,
	SettingValue Text NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Setting PRIMARY KEY 
  (
	SettingId
  )
);

CREATE SEQUENCE Profile_seq;

CREATE TABLE Profile(
	ProfileId int DEFAULT NEXTVAL ('Profile_seq') NOT NULL,
	SiteId int NULL,
	Name Varchar(50) NOT NULL,
	Title Varchar(50) NOT NULL,
	Description Varchar(256) NULL,
	Category Varchar(50) NOT NULL,
	ViewOrder int NOT NULL,
	MaxLength int NOT NULL,
	DefaultValue Varchar(2000) NULL,
	IsRequired Boolean NOT NULL,
	IsPrivate Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_Profile PRIMARY KEY 
  (
	ProfileId
  )
);


CREATE SEQUENCE Log_seq;

CREATE TABLE Log (

   LogId int DEFAULT NEXTVAL ('Log_seq') NOT NULL,
   SiteId int NULL,
   LogDate Timestamp(3) NOT NULL,
   PageId int NULL,
   ModuleId int NULL,
   UserId int NULL,
   Url Varchar(2048) NOT NULL,
   Server Varchar(200) NOT NULL,
   Category Varchar(200) NOT NULL,
   Feature Varchar(200) NOT NULL,
   Function Varchar(20) NOT NULL,
   Level Varchar(20) NOT NULL,
   Message Text NOT NULL,
   MessageTemplate Text NOT NULL,
   Exception Text NULL,
   Properties Text NULL,
   CONSTRAINT PK_Log PRIMARY KEY 
   (
     LogId
   ) 
);

CREATE SEQUENCE Notification_seq;

CREATE TABLE Notification(
	NotificationId int DEFAULT NEXTVAL ('Notification_seq') NOT NULL,
    SiteId int NOT NULL,
	FromUserId int NULL,
	ToUserId int NULL,
	ToEmail Varchar(256) NOT NULL,
	Subject Varchar(256) NOT NULL,
	Body Text NOT NULL,
	ParentId int NULL,
	CreatedOn Timestamp(3) NOT NULL,
	IsDelivered Boolean NOT NULL,
	DeliveredOn Timestamp(3) NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_Notification PRIMARY KEY 
  (
	NotificationId
  )
);

CREATE SEQUENCE Folder_seq;

CREATE TABLE Folder(
	FolderId int DEFAULT NEXTVAL ('Folder_seq') NOT NULL,
	SiteId int NOT NULL,
	Path Varchar(50) NOT NULL,
	Name Varchar(50) NOT NULL,
	ParentId int NULL,
	OrderVal int NOT NULL,
	IsSystem Boolean NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_Folder PRIMARY KEY 
  (
	FolderId
  )
);

CREATE SEQUENCE File_seq;

CREATE TABLE File(
	FileId int DEFAULT NEXTVAL ('File_seq') NOT NULL,
	FolderId int NOT NULL,
	Name Varchar(250) NOT NULL,
	Extension Varchar(50) NOT NULL,
	Size int NOT NULL,
	ImageHeight int NOT NULL,
	ImageWidth int NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
	DeletedBy Varchar(256) NULL,
	DeletedOn Timestamp(3) NULL,
	IsDeleted boolean NOT NULL,
  CONSTRAINT PK_File PRIMARY KEY 
  (
	FileId
  )
);

CREATE SEQUENCE HtmlText_seq;

CREATE TABLE HtmlText(
	HtmlTextId int DEFAULT NEXTVAL ('HtmlText_seq') NOT NULL,
	ModuleId int NOT NULL,
	Content Text NOT NULL,
	CreatedBy Varchar(256) NOT NULL,
	CreatedOn Timestamp(3) NOT NULL,
	ModifiedBy Varchar(256) NOT NULL,
	ModifiedOn Timestamp(3) NOT NULL,
  CONSTRAINT PK_HtmlText PRIMARY KEY 
  (
	HtmlTextId
  )
);

/* SQLINES DEMO ***  key relationships

*/
ALTER TABLE Module ADD CONSTRAINT FK_Module_Site FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE Page ADD CONSTRAINT FK_Page_Site FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE PageModule ADD CONSTRAINT FK_PageModule_Module FOREIGN KEY(ModuleId)
REFERENCES Module (ModuleId);
 

ALTER TABLE PageModule ADD CONSTRAINT FK_PageModule_Page FOREIGN KEY(PageId)
REFERENCES Page (PageId)
ON DELETE CASCADE;
 

ALTER TABLE Role ADD CONSTRAINT FK_Role_Site FOREIGN KEY (SiteId) 
REFERENCES Site (SiteId) 
ON DELETE CASCADE; 
 

ALTER TABLE UserRole ADD CONSTRAINT FK_UserRole_User FOREIGN KEY (UserId) 
REFERENCES "user" (UserId) 
ON DELETE CASCADE; 
 

ALTER TABLE UserRole ADD CONSTRAINT FK_UserRole_Role FOREIGN KEY (RoleId) 
REFERENCES Role (RoleId); 
 

ALTER TABLE Permission ADD CONSTRAINT FK_Permission_Site FOREIGN KEY (SiteId) 
REFERENCES Site (SiteId) 
ON DELETE CASCADE; 
 

ALTER TABLE Permission ADD CONSTRAINT FK_Permission_User FOREIGN KEY (UserId) 
REFERENCES "user" (UserId); 	
 

ALTER TABLE Permission ADD CONSTRAINT FK_Permission_Role FOREIGN KEY (RoleId) 
REFERENCES Role (RoleId); 
 

ALTER TABLE Profile ADD CONSTRAINT FK_Profile_Sites FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE Log ADD CONSTRAINT FK_Log_Site FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE Notification ADD CONSTRAINT FK_Notification_Site FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE Folder ADD CONSTRAINT FK_Folder_Site FOREIGN KEY(SiteId)
REFERENCES Site (SiteId)
ON DELETE CASCADE;
 

ALTER TABLE File ADD CONSTRAINT FK_File_Folder FOREIGN KEY(FolderId)
REFERENCES Folder (FolderId)
ON DELETE CASCADE;
 

ALTER TABLE HtmlText ADD CONSTRAINT FK_HtmlText_Module FOREIGN KEY(ModuleId)
REFERENCES Module (ModuleId)
ON DELETE CASCADE;
 

CREATE UNIQUE INDEX IX_Setting ON Setting
	(
	EntityName,
	EntityId,
	SettingName
	)
;

CREATE UNIQUE INDEX IX_User ON "user"
	(
	Username
	)
;

CREATE UNIQUE INDEX IX_Permission ON Permission
	(
	SiteId,
	EntityName,
	EntityId,
	PermissionName,
	RoleId,
	UserId
	)
;

CREATE UNIQUE INDEX IX_Page ON Page
	(
	SiteId,
	Path,
	UserId
	)
;

CREATE UNIQUE INDEX IX_UserRole ON UserRole
	(
	RoleId,
	UserId
	)
;

CREATE UNIQUE INDEX IX_Folder ON Folder
	(
	SiteId,
	Path
	)
;

CREATE TABLE "AspNetUsers"(
	Id Varchar(450) NOT NULL,
	UserName Varchar(256) NULL,
	NormalizedUserName Varchar(256) NULL,
	Email Varchar(256) NULL,
	NormalizedEmail Varchar(256) NULL,
	EmailConfirmed Boolean NOT NULL,
	PasswordHash Text NULL,
	SecurityStamp Text NULL,
	ConcurrencyStamp Text NULL,
	PhoneNumber Text NULL,
	PhoneNumberConfirmed Boolean NOT NULL,
	TwoFactorEnabled Boolean NOT NULL,
	LockoutEnd Timestamp(6) WITH TIME ZONE NULL,
	LockoutEnabled Boolean NOT NULL,
	AccessFailedCount int NOT NULL,
 CONSTRAINT PK_AspNetUsers PRIMARY KEY (Id));

CREATE SEQUENCE AspNetUserClaims_seq;

CREATE TABLE "AspNetUserClaims"(
	Id int DEFAULT NEXTVAL ('AspNetUserClaims_seq') NOT NULL,
	UserId Varchar(450) NOT NULL,
	ClaimType Text NULL,
	ClaimValue Text NULL,
 CONSTRAINT PK_AspNetUserClaims PRIMARY KEY 
(
	Id
))
;

CREATE INDEX IX_AspNetUserClaims_UserId ON "AspNetUserClaims"
(
	UserId
)
;

CREATE INDEX EmailIndex ON "AspNetUsers"
(
	NormalizedEmail
)
;

CREATE UNIQUE INDEX UserNameIndex ON "AspNetUsers"
(
	NormalizedUserName
)
WHERE (NormalizedUserName IS NOT NULL)
;

ALTER TABLE "AspNetUserClaims" ADD CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId FOREIGN KEY(UserId)
REFERENCES "AspNetUsers" (Id)
ON DELETE CASCADE;
 

/*
ALTER TABLE AspNetUserClaims ADD CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId;
*/
