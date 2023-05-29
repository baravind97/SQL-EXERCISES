SELECT
       [FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Nick Name] = LOWER(LEFT([FirstName],1) + '' + RIGHT([LastName],3))
  FROM [AdventureWorks2022].[Person].[Person]

--NESTED REPLACE FUNCTION
SELECT 
      [ProductReviewID],
	  [Comments],
	  [Cleaned Comments] = REPLACE(REPLACE([Comments],',',''),'.','')
FROM [Production].[ProductReview]

