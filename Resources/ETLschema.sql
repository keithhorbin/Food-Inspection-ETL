-- Create tables for raw data to be loaded into
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

