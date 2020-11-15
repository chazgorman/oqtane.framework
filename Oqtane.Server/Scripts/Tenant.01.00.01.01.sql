/* SQLINES DEMO *** Notification migration script

*/

ALTER TABLE Notification ADD COLUMN SendOn timestamp NULL;

UPDATE Notification SET SendOn = CreatedOn WHERE SendOn IS NULL;
 