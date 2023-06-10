--WINDOW FUNCTIONS OVER()
SELECT
    A.[FirstName],
	A.[LastName],
    B.[JobTitle],
    C.[Rate],
	[Avg.rate] = Avg(C.[Rate])over(),
	[MaximumRate] = Max(C.[Rate])over(),
	[DiffFromAvgRate] = Avg(C.[Rate])over() - C.[Rate],
	[PercentOfMaxRate]  = (C.[Rate]/Max(C.[Rate])over())*100 

from [Person].[Person] A JOIN   [HumanResources].[Employee] B
ON A.[BusinessEntityID] = B.[BusinessEntityID] JOIN [HumanResources].[EmployeePayHistory] C
ON C.[BusinessEntityID] = B.[BusinessEntityID]

--EXAMPLE-2 - PARTITION BY
SELECT
     A.[Name] AS [ProductName],
	 A.[ListPrice],
	 B.[Name] as [ProductSubcategory],
	 C.[Name] as [ProductCategory],
	 [AvgPriceByCategory] = avg(A.[ListPrice])over(PARTITION BY C.[Name],B.[Name] ),
	 [ProductVsCategoryPriceDelta] =  A.[ListPrice] - avg(A.[ListPrice])over(PARTITION BY C.[Name])
FROM [Production].[Product]A JOIN [Production].[ProductSubcategory]B
ON A.[ProductSubcategoryID] = B.[ProductSubcategoryID] JOIN [Production].[ProductCategory]C
ON B.[ProductCategoryID] = C.[ProductCategoryID]

--EXAMPLE -3 - ROW_NUMBER()
 SELECT
     A.[Name] AS [ProductName],
	 A.[ListPrice],
	 B.[Name] as [ProductSubcategory],
	 C.[Name] as [ProductCategory],
	 [PriceRank] = ROW_NUMBER()OVER(ORDER BY A.[ListPrice] DESC),
	 [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC),
	 [Top5PriceInCategory] = 
	 CASE
	 WHEN ROW_NUMBER() OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC) BETWEEN 1 AND 5 THEN 'YES'
	 WHEN RANK() OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC) BETWEEN 1 AND 5 THEN 'YES'
	 ELSE 'NO'
	 END
FROM [Production].[Product]A JOIN [Production].[ProductSubcategory]B
ON A.[ProductSubcategoryID] = B.[ProductSubcategoryID] JOIN [Production].[ProductCategory]C
ON B.[ProductCategoryID] = C.[ProductCategoryID]

--RANK() and DENSE_RANK()----
---COMPARING RANK() AND ROW_NUMBER()----
SELECT
     A.[Name] AS [ProductName],
	 A.[ListPrice],
	 B.[Name] as [ProductSubcategory],
	 C.[Name] as [ProductCategory],
	 [PriceRank] = ROW_NUMBER()OVER(ORDER BY A.[ListPrice] DESC),
	 [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC),
	 [Category Price Rank with RANK()] = RANK()OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC),
	 [Top5PriceInCategory] = 
	 CASE
	 WHEN ROW_NUMBER() OVER(PARTITION BY C.[Name] ORDER BY A.[ListPrice] DESC) BETWEEN 1 AND 5 THEN 'YES'
	 ELSE 'NO'
	 END
FROM [Production].[Product]A JOIN [Production].[ProductSubcategory]B
ON A.[ProductSubcategoryID] = B.[ProductSubcategoryID] JOIN [Production].[ProductCategory]C
ON B.[ProductCategoryID] = C.[ProductCategoryID]

----
