--QUESTION-1
SELECT *
  FROM [AdventureWorks2022].[Person].[Person]
WHERE [FirstName] LIKE '%.'


--Question-2
SELECT *
  FROM [AdventureWorks2022].[Person].[Person]
WHERE [FirstName] LIKE '[TLC]%' AND
[MiddleName] LIKE '[TLC]%' AND
[LastName] LIKE '[TLC]%'

--Question-3
SELECT *
  FROM [AdventureWorks2022].[Person].[Person]
WHERE [FirstName] not LIKE  '[AEIOU]%'



