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
	
---Query 5 - Number od papers and most popular paper by a scientist per country---

SELECT 
	c.Name AS Country, s.Surname AS Scientist, COUNT(*) AS Number_Of_Papers, 
	(SELECT
		sp.Name
	FROM 
		ScientificPapers sp
	JOIN 
	 	PapersAuthors pa ON pa.PaperId = sp.PaperId
	WHERE 
	 	pa.AuthorId = s.ScientistId AND c.CountryId = s.CountryId
	GROUP BY
	 	sp.Name, sp.CitationsNumber
	ORDER BY
		sp.CitationsNumber DESC
	LIMIT 1)
	AS Most_Popular_Paper
FROM 
	ScientificPapers sp
JOIN 
	 PapersAuthors pa ON pa.PaperId = sp.PaperId
JOIN 
	Scientists s ON s.ScientistId = pa.AuthorId 
JOIN 
	Countries c ON c.CountryId = s.CountryId
GROUP BY
	c.CountryId, s.ScientistId
ORDER BY
	c.Name, s.Surname

---Query 6 - First published paper per country---

SELECT 
	c.Name as Country,
	COALESCE(
		(SELECT 
			sp.Name AS Paper
		 FROM
			ScientificPapers sp
		 JOIN 
			PapersAuthors pa ON pa.PaperId = sp.PaperId
		 JOIN
			Scientists s ON s.ScientistId = pa.AuthorId
		 WHERE 
			s.CountryId = c.CountryId
		 ORDER BY
			sp.PublicationDate
		 LIMIT 1
		), 'NEMA GA')
	AS First_Published_Paper
FROM Countries c

---Query 7 - Order Cities by the number of Scientists currently staying there---

SELECT
	c.Name AS City,
	COALESCE(
		(SELECT 
			COUNT(*)  
		 FROM 
			Scientists s 
		 JOIN 
			Hotels h ON h.HotelId = s.HotelId
		 WHERE 
			h.HotelId = s.HotelId and h.CityId = c.CityId), 0)
	AS Number_Of_Scientists
FROM 
	Cities c
ORDER BY
	Number_Of_Scientists DESC

---Query 8 - Average number of citations per Accelerator---

SELECT a.Name AS Accelerator, 
	COALESCE(
	   (SELECT 
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
	
---Query 9 - Number of Scientists per Profession, decade of birth and Gender, ordered by decade---

SELECT 
	SUBSTRING(CAST(DATE_PART('year', s.BirthDate) AS VARCHAR), 1, 3) AS Decade, 
	s.Profession, 
	CASE
		WHEN s.Gender = 0 THEN 'Nepoznato'
	 	WHEN s.Gender = 1 THEN 'Muški'
	 	WHEN s.Gender = 2 THEN 'Ženski'
	 	WHEN s.Gender = 9 THEN 'Ostalo'
	END
	AS Gender, 
	COUNT(*) AS Number_Per_Category
FROM 
	Scientists s
GROUP BY
	s.Profession, Decade, s.Gender
HAVING 
	COUNT(*) >= 20
ORDER BY
	Decade














