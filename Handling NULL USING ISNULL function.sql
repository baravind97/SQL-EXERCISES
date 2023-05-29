SELECT 
       [Name]
      ,[Modified color] = ISNULL([Color],'NO COLOR')
      ,[Weight]
      
  FROM [AdventureWorks2022].[Production].[Product]
  WHERE ISNULL([Weight],0) > 10

