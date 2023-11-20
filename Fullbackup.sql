-- Database Backup Script
-- Creator: Shailesh Bataju

-- Set the database to be backed up
USE YourDatabaseName;

-- Set the backup path
DECLARE @BackupPath NVARCHAR(255);
SET @BackupPath = 'C:\Backup\' + CONVERT(NVARCHAR(20), GETDATE(), 112) + '\';

-- Create the backup directory if it doesn't exist
EXEC xp_cmdshell 'mkdir ' + @BackupPath;

-- Set the backup file name
DECLARE @BackupFileName NVARCHAR(255);
SET @BackupFileName = @BackupPath + 'YourDatabaseName_backup_' + REPLACE(CONVERT(NVARCHAR(20), GETDATE(), 120), ':', '') + '.bak';

-- Backup the database
BACKUP DATABASE YourDatabaseName TO DISK = @BackupFileName WITH INIT;

-- Display success message
PRINT 'Backup completed successfully. File saved at: ' + @BackupFileName;
