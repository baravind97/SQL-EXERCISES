---LAG()----

SELECT
     A.[PurchaseOrderID],
     A.[OrderDate],
	 A.[TotalDue],
	 A.[VendorID],
	 B.[Name] AS [VendorName],
	 [PrevOrderFromVendorAmt] = LAG(A.[TotalDue],1)OVER(PARTITION BY A.[VendorID] ORDER BY  A.[OrderDate] )
     FROM [Purchasing].[PurchaseOrderHeader] A JOIN [Purchasing].[Vendor] B
	 ON B.[BusinessEntityID] = A.[VendorID]
WHERE YEAR(A.[OrderDate]) >= 2013 AND
 A.[TotalDue] > 500

 SELECT 
      A.[PurchaseOrderID],
     A.[OrderDate],
	 A.[TotalDue],
	 A.[VendorID],
	 B.[Name] AS [VendorName],
	 ---[PrevOrderFromVendorAmt] = LAG(A.[TotalDue],1)OVER(PARTITION BY A.[VendorID] ORDER BY  A.[OrderDate] ),
	 [NextOrderByEmployeeVendor] = LEAD(B.[Name],1) OVER(PARTITION BY A.[EmployeeID] ORDER BY A.[OrderDate])
     FROM [Purchasing].[PurchaseOrderHeader] A JOIN [Purchasing].[Vendor] B
	 ON B.[BusinessEntityID] = A.[VendorID]
WHERE YEAR(A.[OrderDate]) >= 2013 AND
 A.[TotalDue] > 500

      