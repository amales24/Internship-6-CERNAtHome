SELECT * FROM Projects
SELECT * FROM Accelerators
SELECT * FROM ProjectsAccelerators
SELECT * FROM ScientificPapers
SELECT * FROM Countries
SELECT * FROM Cities
SELECT * FROM Hotels
SELECT * FROM Scientists
SELECT * FROM PapersAuthors

---Query 1 - Name, Publication date and Authors for each Scientific paper---

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

---Query 2 - Name, Surname, Gender, Country and its PPP/capita for each Scientist---

SELECT
	s.Name, s.Surname,
	CASE 
		WHEN s.Gender = 0 THEN 'NEPOZNATO'
		WHEN s.Gender = 1 THEN 'MUŠKI'
		WHEN s.Gender = 2 THEN 'ŽENSKI'
		WHEN s.Gender = 9 THEN 'OSTALO'
	END 
	AS Gender,
	cntr.Name AS Country, cntr.PPPcapita
FROM 
	Scientists s
JOIN 
	Countries cntr ON cntr.CountryId = s.CountryId

---Query 3 - All Project - Accelerator combinations---

SELECT 
	p.Name AS Project_Name,
	CASE 
		WHEN 
			(SELECT COUNT(*) FROM ProjectsAccelerators pa WHERE pa.ProjectId = p.ProjectId) > 0
		THEN
			a.Name
		ELSE
			'NEMA GA'
	END
	AS Accelerator_Name
FROM 
	Projects p
LEFT JOIN 
	ProjectsAccelerators pa ON pa.Projectid = p.Projectid
LEFT JOIN 
	Accelerators a ON pa.AcceleratorId = a.AcceleratorId

---Query 4 - Projects with at least one paper between 2015 and 2017---

SELECT 
	DISTINCT p.Name
FROM
	Projects p
JOIN 
	ScientificPapers sp ON sp.ProjectId = p.ProjectId
WHERE  
	DATE_PART('year', sp.PublicationDate) BETWEEN 2015 AND 2017

---Query 7 - Order Cities by the number of Scientists currently staying there---

SELECT
	c.Name AS City, 
	(SELECT 
	 	COUNT(*)  
	 FROM 
	 	Scientists s 
	 JOIN 
	 	Hotels h ON h.HotelId = s.HotelId
	 WHERE 
	 	h.HotelId = s.HotelId and h.CityId = c.CityId) 
	AS Number_Of_Scientists
FROM 
	Cities c
ORDER BY
	Number_Of_Scientists DESC

---Query 8 - Average number of citations per Accelerator---

SELECT a.Name AS Accelerator, 
	COALESCE
	((SELECT 
	 	 ROUND(AVG(sp.CitationsNumber),2)
	  FROM 
	 	 ScientificPapers sp
	  JOIN
	 	 Projects p ON p.ProjectId = sp.ProjectId
	  JOIN
	 	 ProjectsAccelerators pa ON pa.ProjectId = p.ProjectId
	  WHERE 
	 	 sp.ProjectId = pa.ProjectId AND a.AcceleratorId = pa.AcceleratorId), 0)
	 AS Average_Citations_Number 
FROM 
	Accelerators a
	

















