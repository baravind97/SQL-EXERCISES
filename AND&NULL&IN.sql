SELECT 
      [PersonType]
      ,[Title]
      ,[FirstName]
	  ,[MiddleName]
      ,[LastName]
	  ,[Suffix]
  FROM [AdventureWorks2022].[Person].[Person]
  where [PersonType] IN ('EM','SP') AND
  ([MiddleName] IS NULL OR
  [Title] IS NULL OR
  [Suffix] IS NULL)
 
