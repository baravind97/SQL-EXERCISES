--Question-1

SELECT 
       [OrganizationLevel] AS [Organization Level]
      ,[JobTitle] AS [Job Title]
      ,[VacationHours] AS [Vacation Hours]
      ,[SickLeaveHours] AS [Sick Leave Hours]
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  ORDER BY [Organization Level], [Vacation Hours] DESC