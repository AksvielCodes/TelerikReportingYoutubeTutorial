BEGIN TRANSACTION --COMMIT ROLLBACK

CREATE TABLE [Country] (
    [CountryId] INTEGER NOT NULL,
    [Name] VARCHAR(255) NULL,
    PRIMARY KEY ([CountryId])
);

CREATE TABLE [PersonAddress] (
    [PersonAddressId] INTEGER NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(255) NOT NULL,
	[CountryId] INT NOT NULL REFERENCES Country(CountryId),
    [Address] VARCHAR(255) NOT NULL,
    [Date] DATETIME NOT NULL,
    PRIMARY KEY ([PersonAddressID])
);
GO

INSERT INTO [Country] (CountryId, Name)
VALUES
	(1, 'New Zealand'),
	(2, 'Spain'),
	(3, 'China'),
	(4, 'Canada'),
	(5, 'Peru'),
	(6, 'Germany'),
	(7, 'Ireland'),
	(8, 'Turkey'),
	(9, 'Costa Rica'),
	(10, 'Austria'),
	(11, 'Pakistan'),
	(12, 'United States'),
	(13, 'Italy'),
	(14, 'Belgium'),
	(15, 'Sweden'),
	(16, 'Brazil'),
	(17, 'Chile'),
	(18, 'France'),
	(19, 'Mexico'),
	(20, 'Colombia'),
	(21, 'Norway'),
	(22, 'South Korea'),
	(23, 'India');

INSERT INTO [PersonAddress] (Name, CountryId, Address, Date)
VALUES
  ('Cameron Rowe',1,'216-8305 Ipsum. Rd.','Apr 17, 2019'),
  ('Eleanor Gilbert',2,'254-7994 Dolor St.','Sep 2, 2021'),
  ('Hedley Rutledge',3,'Ap #673-3947 Id St.','Jan 3, 2022'),
  ('Ferdinand Benjamin',4,'Ap #813-5432 Non Avenue','Mar 1, 2018'),
  ('Kenneth King',5,'595-2949 Non St.','Dec 11, 2022'),
  ('Quentin Gaines',6,'948-1950 Imperdiet Street','May 28, 2022'),
  ('Brendan Dalton',7,'Ap #334-2801 Eu, Rd.','May 16, 2021'),
  ('Andrew Decker',8,'Ap #508-8934 Tellus Avenue','Oct 28, 2015'),
  ('Virginia Patrick',9,'915-7787 Vulputate Road','Apr 29, 2021'),
  ('Paul Nelson',3,'703-7150 Sed, Av.','Feb 15, 2011'),
  ('Roth Maxwell',10,'7310 Nunc Street','Oct 23, 2015'),
  ('Lance Ray',11,'Ap #199-2454 Ac Rd.','Jul 29, 2018'),
  ('Otto Lang',12,'919-9817 Arcu. Avenue','Oct 9, 2022'),
  ('Octavius Rogers',6,'3497 Arcu. Street','Sep 24, 2021'),
  ('Xena Johnston',13,'5244 Odio Ave','Oct 13, 2021'),
  ('Bruno Peterson',8,'4684 Quisque Road','Mar 13, 2022'),
  ('Zachery Campbell',9,'P.O. Box 401, 7661 Cum Road','Jul 5, 2016'),
  ('Chantale Orr',1,'368-7705 Sollicitudin Avenue','Mar 28, 2009'),
  ('Wylie Navarro',7,'P.O. Box 122, 3461 Interdum. Road','Jan 25, 2010'),
  ('Brenden Maynard',14,'608-2018 Orci. Avenue','Jun 16, 2012'),
  ('Daniel Waller',15,'Ap #370-9100 Mollis St.','Sep 9, 2002'),
  ('Aristotle Rowland',16,'P.O. Box 281, 2124 Faucibus Road','Jun 25, 2000'),
  ('Kaseem Beard',2,'Ap #869-758 Vitae Rd.','May 3, 2020'),
  ('Xaviera Blair',17,'Ap #692-917 Tincidunt Avenue','Feb 17, 2021'),
  ('Chelsea Velez',2,'388-6893 Nunc St.','Nov 7, 2011'),
  ('Isadora Lara',18,'Ap #305-2996 Varius. Avenue','Feb 13, 2012'),
  ('Amal Acosta',19,'542-707 Diam. Rd.','Sep 3, 2022'),
  ('Jack Mosley',20,'Ap #996-4989 Tempus Rd.','Jul 28, 2011'),
  ('Harlan Kirk',4,'3100 Mus. Av.','Jan 25, 2013'),
  ('Maite Allen',17,'Ap #846-5746 A, St.','Jun 7, 2011'),
  ('Lewis Nunez',11,'229-3654 Nam Avenue','Mar 17, 2022'),
  ('Audrey Juarez',2,'Ap #386-5128 Vitae Avenue','Feb 28, 2009'),
  ('Chava Gallagher',21,'Ap #424-7260 Consectetuer Ave','Feb 28, 2007'),
  ('Patricia Lamb',22,'190-6620 Mus. Ave','Dec 1, 2001'),
  ('Renee Justice',8,'Ap #419-3577 Risus. St.','Sep 8, 2007'),
  ('Xandra Stanley',11,'6779 Leo. St.','Mar 30, 2021'),
  ('Heather Harrell',11,'471-2184 Morbi Rd.','Aug 6, 2012'),
  ('Oleg Booker',3,'Ap #573-6591 Et Ave','Jan 14, 2022'),
  ('Nehru Gregory',3,'200-2249 Quis Ave','Aug 10, 2022'),
  ('Aileen Powers',23,'P.O. Box 631, 8477 Non, Ave','Nov 5, 2013');
GO

CREATE PROCEDURE GetPersonAddress
	@countryId INT = NULL,
	@name VARCHAR(255) = NULL,
	@dateStart DATE = NULL,
	@dateEnd DATE = NULL
AS
BEGIN

	SELECT
		PersonAddress.PersonAddressId,
		PersonAddress.Name [PersonName],
		Country.Name [CountryName],
		PersonAddress.Address,
		FORMAT(PersonAddress.Date,'MMM/dd/yyyy','en') AS [FromDate]
	FROM
		PersonAddress
		INNER JOIN Country ON PersonAddress.CountryId = Country.CountryId
	WHERE
		(@countryId IS NULL OR PersonAddress.CountryId = @countryId)
		AND (@name IS NULL OR PersonAddress.Name LIKE '%' + @name + '%')
		AND (@dateEnd IS NULL OR @dateEnd >= PersonAddress.Date) 
		AND (@dateStart IS NULL OR @dateStart <= PersonAddress.Date)
END
GO
