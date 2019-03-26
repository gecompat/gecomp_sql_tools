USE master;
go

-- enable External Script 
if not exists (select * from sys.configurations where name = 'external scripts enabled' and value = 1)
begin 
	EXEC sp_configure  'external scripts enabled', 1;
	RECONFIGURE WITH OVERRIDE;
end 

-- check
select value_in_use, * from sys.configurations where name = 'external scripts enabled' 

---> SQL Server Restart

-- check
select value_in_use, * from sys.configurations where name = 'external scripts enabled' 





-- create database testdb

use testdb
go 
EXECUTE sp_execute_external_script  
  @language = N'R',
  @script = N'OutputDataSet <- data.frame(.libPaths());'
WITH RESULT SETS (([DefaultLibraryName] VARCHAR(MAX) NOT NULL));
go

--- und schon ist aus - 1x konnte ich abfragen, jetzt bekomme ich immer 
/*
Msg 39021, Level 16, State 1, Line 26
Unable to launch runtime for 'R' script. Please check the configuration of the 'R' runtime.
Msg 39019, Level 16, State 2, Line 26
An external script error occurred: 
Unable to launch the runtime. ErrorCode 0x80070490: 1168(Element not found.).
*/



-- For any version of SQL Server, run the following statement to verify the default R package library for the current instance:
EXECUTE sp_execute_external_script  
  @language = N'R',
  @script = N'OutputDataSet <- data.frame(.libPaths());'
WITH RESULT SETS (([DefaultLibraryName] VARCHAR(MAX) NOT NULL));
GO


-- Returns the path of the instance library and the version of RevoScaleR used by SQL Server:
EXECUTE sp_execute_external_script
  @language =N'R',
  @script=N'
  sql_r_path <- rxSqlLibPaths("local")
  print(sql_r_path)
  version_info <-packageVersion("RevoScaleR")
  print(version_info)'

-- This script returns package name and version fields in the DESCRIPTION file, only the name is returned.
EXECUTE sp_execute_external_script
  @language=N'R',
  @script = N'str(OutputDataSet);
  packagematrix <- installed.packages();
  Name <- packagematrix[,1];
  Version <- packagematrix[,3];
  OutputDataSet <- data.frame(Name, Version);',
  @input_data_1 = N''
WITH RESULT SETS ((PackageName nvarchar(250), PackageVersion nvarchar(max) ))

-- This example looks for and loads the RevoScaleR library, if available.
EXECUTE sp_execute_external_script  
  @language =N'R',
  @script=N'require("RevoScaleR")'
GO
