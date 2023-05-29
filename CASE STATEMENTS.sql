--QUESTION ON SIMPLE CASE STATEMENT

SELECT
      [ListPrice],
      [Name],
	  [Price Category] = 
	  CASE
	  WHEN [ListPrice] > 1000 THEN 'Premium'
	  WHEN [ListPrice] BETWEEN 101 AND 999 THEN 'Mid-Range'
	  ELSE 'Value'
	  END
FROM [Production].[Product]

--COMPLEX CASE STATEMENT
SELECT
      [BusinessEntityID],
      [HireDate],
	  [SalariedFlag],
	  [Employee Tenure] = 
	  CASE
	  WHEN [SalariedFlag] = 1 AND( DATEDIFF(YEAR, CAST([HireDate] AS DATE),CAST(GETDATE() AS DATE)) >= 10) THEN 'Non-Exempt - 10+ Years'
	  WHEN [SalariedFlag] = 1 AND( DATEDIFF(YEAR, CAST([HireDate] AS DATE),CAST(GETDATE() AS DATE)) < 10) THEN 'Non-Exempt - < 10 Years'
	  WHEN [SalariedFlag] = 0 AND( DATEDIFF(YEAR, CAST([HireDate] AS DATE),CAST(GETDATE() AS DATE)) >= 10) THEN 'Exempt - 10+ Years'
	  ELSE 'Exempt - < 10 Years'
	  END
FROM [HumanResources].[Employee]
	 
	 
