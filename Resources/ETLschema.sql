CREATE TABLE Resturant_DataFrame (
  Id INT ,
  License_no INT,
  Inspect_date VARCHAR
  City TEXT,
  State TEXT,
  Zip INT PRIMARY KEY
  
);

CREATE TABLE Census (
  Zipcode INT FOREIGN KEY,
  Population INT,
  Median Age INT,
  Household Income INT,
  Per Capita Income INT,
  Poverty Count INT, 
  Poverty Rate INT,
  Unemployment Rate INT,
  
);


