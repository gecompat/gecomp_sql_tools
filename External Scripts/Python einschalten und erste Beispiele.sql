/*
sp_configure 'external scripts enabled', 1
reconfigure
*/


exec sp_execute_external_script @language=N'Python', @script = N'
import sys
print (sys.version)
'
go 

-- 
exec sp_execute_external_script @language=N'R', @script = N'
a <- 1
print (a)
'
go 
