--Using Right function
SELECT [CreditCardID]
      ,[CardType]
      ,[CardNumber]
	  ,[Last 4 didgit] = RIGHT([CardNumber],4)
	  
FROM [AdventureWorks2022].[Sales].[CreditCard]

--REPLACE Function
SELECT 
     [ReviewerName]
	,[Comments]
	,[Cleaned comments] = REPLACE([Comments],',','')
FROM [Production].[ProductReview]

--CHARACTER LENGTH FUNCTION
SELECT 
      [FirstName],
	  [MiddleName]
FROM [Person].[Person]
WHERE LEN([FirstName]) >= 10
ORDER BY LEN([FirstName]) DESC
