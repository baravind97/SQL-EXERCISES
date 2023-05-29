--DATETIME WITH NO TIMESTAMP
SELECT 
[JUST DATE NO TIMESTAMP] = CAST(GETDATE()-1 AS DATE)

--
SELECT 
[DAYS BETWEEN] = CAST(DATEDIFF(DAY,GETDATE(),DATEFROMPARTS(YEAR(GETDATE()),12,31))+GETDATE() AS DATE)

--NULL AND CASTING
SELECT
     [BusinessEntityID],
     [Title],
     [FirstName],
     [MiddleName],
     [Suffix],
	 [PersonID] = CAST([BusinessEntityID] AS varchar) + '-' + [PersonType]
	 FROM [Person].[Person]
	 WHERE [MiddleName] IS NOT NULL AND 
	 ([Title] IS NOT NULL OR [Suffix] IS NOT NULL)