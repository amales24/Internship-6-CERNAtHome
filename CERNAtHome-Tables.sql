CREATE TABLE Projects(
	ProjectId SERIAL PRIMARY KEY,
	Name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE Accelerators(
	AcceleratorId SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE ProjectsAccelerators(
	ProjectId INT REFERENCES Projects(ProjectId),
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId),
	PRIMARY KEY(ProjectId, AcceleratorId)
);

CREATE TABLE ScientificPapers(
	PaperId SERIAL PRIMARY KEY,
	Name VARCHAR(60) NOT NULL,
	ProjectId INT REFERENCES Projects(ProjectId) NOT NULL,
	PublicationDate TIMESTAMP,
	CitationsNumber INT
);

CREATE TABLE Countries(
	CountryId SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL UNIQUE,
	Population INT NOT NULL,
	PPPcapita MONEY NOT NULL
);

CREATE TABLE Cities(
	CityId SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	CityID INT REFERENCES Cities(CityId),
	Capacity INT NOT NULL,
	UNIQUE(Name, CityId)
);

ALTER TABLE Hotels
	ALTER COLUMN Name TYPE VARCHAR(30);

ALTER TABLE Hotels
	ADD CONSTRAINT CitiIdCannotBeNull CHECK (CityID IS NOT NULL);

CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Surname VARCHAR(20) NOT NULL,
	BirthDate TIMESTAMP NOT NULL,
	CountryId INT REFERENCES Countries(CountryId) NOT NULL,
	Gender INT CHECK (Gender IN (0,1,2,9)),
	Profession VARCHAR(22) CHECK (Profession IN ('programer', 'fizičar', 'inženjer', 'znanstvenik materijala')),
	HotelId INT REFERENCES Hotels(HotelId)
);

CREATE TABLE PapersAuthors(
	PaperId INT REFERENCES ScientificPapers(PaperId),
	AuthorId INT REFERENCES Scientists(ScientistId),
	PRIMARY KEY(PaperId, AuthorId)
);









