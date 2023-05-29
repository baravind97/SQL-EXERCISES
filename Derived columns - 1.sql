SELECT 
       [PersonType]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Person Title] = [FirstName] + '' +[LastName]+'-'+[PersonType]
  FROM [AdventureWorks2022].[Person].[Person]

  --Question - 2 
  SELECT  
       --[SalariedFlag],
	   [BusinessEntityID],
	   [VacationHours],
	   [SickLeaveHours],
	   [Total Timeoff] =  [VacationHours] + [SickLeaveHours]
	   ,[Total daysoff] = (([VacationHours] + [SickLeaveHours])*1)/8
	   from [HumanResources].[Employee]
	   WHERE [SalariedFlag] = 0
	   ORDER BY [Total Timeoff]

-- Question - 3
SELECT [BusinessEntityID],
       [Rate],
	   [Weekly Pay] = [Rate]*40.0
	  ,[Amount per paycheck] = [PayFrequency]*[Rate]*40.0
from [HumanResources].[EmployeePayHistory]
ORDER BY [Amount per paycheck] DESC