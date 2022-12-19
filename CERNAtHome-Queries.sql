SELECT * FROM Projects
SELECT * FROM Accelerators
SELECT * FROM ProjectsAccelerators
SELECT * FROM ScientificPapers
SELECT * FROM Countries
SELECT * FROM Cities
SELECT * FROM Hotels
SELECT * FROM Scientists
SELECT * FROM PapersAuthors

---Query 1 - Names, Publication dates and Authors for each Scientific paper---

SELECT
	sp.Name, sp.PublicationDate, 
	(SELECT 
	 	STRING_AGG(CONCAT(s.Surname,' ,',LEFT(s.Name,1),'.'),'; ') 
	 FROM 
	 	Scientists s
	 WHERE
	 	(SELECT 
		 	COUNT(*) 
		 FROM 
		 	PapersAuthors pa
		 WHERE
			pa.AuthorId = s.ScientistId AND pa.PaperId = sp.PaperId) > 0)
	AS Authors
FROM
	ScientificPapers sp






















