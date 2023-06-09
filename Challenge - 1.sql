SELECT 
	 A.[PurchaseOrderDetailID] AS [OrderDetailID],
	 A.[PurchaseOrderID] AS [Order ID],
	 A.[OrderQty],
	 A.[UnitPrice],
	 A.[LineTotal],
	 B.[OrderDate],
	 C.[Name] as [Product Name],
	 ISNULL(D.[Name],'None') as [Product Sub category],
	 ISNULL(E.[Name],'None') as [Product category],
	 [Purchase/Sales]  = 'Purchase',
	 [Order Size Category] = 
	 CASE
	 WHEN A.[OrderQty] > 500 THEN 'Large'
	 WHEN A.[OrderQty] BETWEEN 50 AND 501 THEN 'Medium'
	 ELSE 'SMALL'
	 END
FROM [Purchasing].[PurchaseOrderDetail] A JOIN [Purchasing].[PurchaseOrderHeader] B
ON A.[PurchaseOrderID] = B.[PurchaseOrderID]
JOIN [Production].[Product] C ON 
A.[ProductID] = C.[ProductID] 
JOIN [Production].[ProductSubcategory] D ON
D.[ProductSubcategoryID] = C.[ProductSubcategoryID]
JOIN [Production].[ProductCategory] E ON
D.[ProductCategoryID] = E.[ProductCategoryID]

WHERE MONTH(B.[OrderDate]) = 12

UNION ALL

SELECT
     F.[SalesOrderDetailID] AS [OrderDetailID],
	 F.[SalesOrderID] AS [OrderID],
     F.[OrderQty],
     F.[UnitPrice],
     F.[LineTotal],
	 E.[OrderDate],
	 G.[Name] AS [Product Name],
	 H.[Name] AS [Product Sub Category],
     I.[Name] AS [Produc Category],
	 [Purchase/Sales]  = 'Sales',
	 [Order Size Category] = 
	 CASE
	 WHEN F.[OrderQty] > 500 THEN 'Large'
	 WHEN F.[OrderQty] BETWEEN 50 AND 501 THEN 'Medium'
	 ELSE 'SMALL'
	 END
     FROM [Sales].[SalesOrderDetail] F JOIN [Sales].[SalesOrderHeader] E
	 ON F.[SalesOrderID] = E.[SalesOrderID] JOIN [Production].[Product] G
	 ON G.[ProductID] = F.[ProductID] JOIN [Production].[ProductSubcategory] H
	 ON H.[ProductSubcategoryID] = G.[ProductSubcategoryID] JOIN [Production].[ProductCategory] I
	 ON I.[ProductCategoryID] = H.[ProductCategoryID]
	 WHERE MONTH(E.[OrderDate]) = 12

	 ORDER BY [OrderDate] DESC
