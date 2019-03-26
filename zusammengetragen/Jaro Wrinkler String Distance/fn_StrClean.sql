CREATE Function [dbo].[fn_StrClean](@p_str1 VARCHAR(MAX)) 
RETURNS VARCHAR(MAX) as 
BEGIN 
 DECLARE @ret_value VARCHAR(MAX)
 SET @ret_value = @p_str1
 SET @ret_value = REPLACE(@ret_value, '.', '')
 SET @ret_value = REPLACE(@ret_value, ',', '') 
 SET @ret_value = REPLACE(@ret_value, '-', '') 
 SET @ret_value = REPLACE(@ret_value, ';', '') 
 SET @ret_value = REPLACE(@ret_value, ':', '') 
 
 RETURN @ret_value
END
GO
-- ****************** Miscellaneous Functions *****************************************************************