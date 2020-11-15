/* SQLINES DEMO *** migration script

*/

ALTER TABLE Role ALTER COLUMN Description TYPE VARCHAR(256);
ALTER TABLE Role ALTER COLUMN Description SET NOT NULL;


ALTER TABLE Page ADD COLUMN DefaultContainerType TEXT NULL;

UPDATE Page SET DefaultContainerType = '';
 

