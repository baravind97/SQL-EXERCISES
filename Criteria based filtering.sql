--Question-1
SELECT 
      [OrderDate]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
 FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
 WHERE [TotalDue] > 50000 AND
 [Freight] < 1000

 --Question2
 SELECT 
      [OrderDate]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
 FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
 WHERE [TotalDue] > 50000 AND
 [Freight] < 1000 AND
 [SubTotal] between 10000 and 30000