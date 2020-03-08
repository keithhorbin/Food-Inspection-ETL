CREATE TABLE Inspection (
  inspection_id SERIAL Primary Key,
  license_no INT,
  inspect_date VARCHAR,
  results VARCHAR,
  city VARCHAR,
  state VARCHAR,
  zip VARCHAR
);

CREATE TABLE Census (
  zip VARCHAR,
  population REAL,
  median_age REAL,
  household_income REAL,
  per_capita_income REAL,
  poverty_count REAL, 
  poverty_rate REAL,
  unemployment_rate REAL
);

SELECT  inspection.inspection_id, inspection.license_no, inspection.inspect_date, 
		inspection.results, inspection.city, inspection.state, inspection.zip, 
		census.population, census.median_age, census.household_income, 
		census.per_capita_income, census.poverty_count, census.poverty_rate, census.unemployment_rate
FROM inspection
JOIN census
ON census.zip = inspection.zip;


SELECT  inspection.license_no, inspection.inspect_date, inspection.results, inspection.city, 
		inspection.state, inspection.zip, census.zip, census.household_income, 
		census.per_capita_income, census.poverty_rate
FROM inspection
JOIN census
ON census.zip = inspection.zip
WHERE inspection.zip='02134';
