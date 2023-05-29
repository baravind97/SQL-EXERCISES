SELECT DISTINCT
       [FirstName]
      ,[MiddleName]
      ,[LastName]
  FROM [AdventureWorks2022].[Person].[Person]
  WHERE [MiddleName] IS NOT NULL
  ORDER BY [FirstName],[LastName]