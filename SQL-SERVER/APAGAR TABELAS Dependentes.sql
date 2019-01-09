GO
SET NOCOUNT ON 
GO   
DECLARE @ChaveEstrangeira NVARCHAR(50) 
DECLARE @TabelaFilho NVARCHAR(50) 
DECLARE @TabelaPai NVARCHAR(50) 

DECLARE PS CURSOR FOR 
	SELECT
		Name AS ChaveEstrangeira,
		OBJECT_NAME(Parent_Object_ID) AS TabelaFilho,
		OBJECT_NAME(Referenced_Object_ID) AS TabelaPai
	FROM SYS.FOREIGN_KEYS
	WHERE OBJECT_NAME(Referenced_Object_ID) LIKE '%SPD_IMPORTACAO%'
	ORDER BY 2

	OPEN PS 

	FETCH NEXT FROM PS INTO @ChaveEstrangeira,@TabelaFilho,@TabelaPai

	WHILE @@FETCH_STATUS = 0 
	BEGIN

	EXEC ('DELETE FROM ' + @TabelaFilho)

	PRINT @TabelaFilho + ' OK' 

	FETCH NEXT FROM PS INTO @ChaveEstrangeira,@TabelaFilho,@TabelaPai
END 

CLOSE PS 
DEALLOCATE  PS