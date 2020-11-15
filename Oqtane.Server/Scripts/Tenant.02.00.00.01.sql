/*  

Version 2.0.0 Tenant migration script

*/

ALTER TABLE Page ALTER Path TYPE varchar(256);
ALTER TABLE Page ALTER Path SET NOT NULL;
ALTER TABLE Profile ADD Options varchar(2000) NULL;