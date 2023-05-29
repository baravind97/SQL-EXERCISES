SELECT 
 [Today] = GETDATE()
,[Month] = MONTH(GETDATE())
,[Year]  = YEAR(GETDATE())

--QUESTION
SELECT
     [PurchaseOrderID],
	 [OrderDate],
	 [TotalDue]
FROM [Purchasing].[PurchaseOrderHeader]
WHERE ([OrderDate] BETWEEN DATEFROMPARTS(2011,1,1) AND DATEFROMPARTS(2011,7,31)) AND
      [TotalDue] > 10000

--QUESTION
SELECT 
[Future Date] = GETDATE()+100

--QUESTION
SELECT
[DATE AFTER 6MONTHS] = DATEADD(MONTH,6,GETDATE())

--QUESTION
SELECT 
[OrderDate],
[Cutoff Date] = DATEFROMPARTS(2013,12,25)
,[Lead Days]   = DATEDIFF(DAY,[OrderDate],DATEFROMPARTS(2013,12,25))
FROM [Sales].[SalesOrderHeader]
WHERE [OrderDate] BETWEEN DATEFROMPARTS(2013,12,25) AND DATEADD(DAY,-7,DATEFROMPARTS(2013,12,25))


