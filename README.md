# Food Inspection and Census Information

Food establishments are rated regularly as a condition of being licensed and able to sell to the public. To ensure that all food establishments meet relevant heath standards and codes, the health division inspects once a year and makes follow up visits on high risk establishments. They also conduct inspections in response to complaints of unsanitary conditions or illnesses.

Our interest was in looking at how food inspection ratings related to income levels by zip code. We **extracted** 2017 food inspection data sets for two cities (Boston and Chicago) in the form of CSV's (sourced from healthdata.gov), and census data estimates for 2017 from a built in pandas library with the dataframe output to a CSV file.

Despite the city CSV's coming from similar departments they weren't identical and the **transformation** process started with normalizing the data in each for the like columns that we sought to join for the sake of the project.

From each city CSV we:

  * Pulled license number, inspection date, inspection result, city, state, and zip code.
  * Had to rename the columns that we kept within each dataframe to match each city file for merge along with database standards.
  * Reclassified health inspection results into easily digested categories. Some assumptions exist here since we lacked a key for decrypting Boston's system
  * Dropped null values.
  * Converted Date fields to like format
  * Converted zip codes to string to ensure we capture leading zeros
  * Added said leading zero's to zip codes < 5 digits in length
  * Converted license number to integer to maintain integrity between the two files.

Once completed we merged the two cities file to have one central dataframe.

The Census CSV was in a much more manageable state. For the file we:
  * Converted zip codes to string to ensure we capture leading zeros.
  * Added said leading zero's to zip codes < 5 digits in length.
  * Filtered out all negative household income values. Negative household income amounts correlated to zip codes that had extremely small population samples and would be unreliable for comparison.
  * Renamed all column names to fit database requirements.

Next we embarked on the **load** process. Just to get a visual and ensure there were no issues of how the joined data would look within a database we merged the dataframes in pandas. To load the database and tables we:
  * Connected to the local database with our PgAdmin credentials in Pandas.
  * Subsequently we created a database titled "ETL_Food_Database", containing two tables:
    * "inspections" - a table to house the merged city data
      * Inspections contains a primary key set as serial and in column inspection_id.
    * "census" - a table to house all census data
      * A Foreign Key on zip links the two tables together.
  * We wanted to keep inspection and census data separate since they update in different manners and from different sources. If city data was refreshed or additional cities are added inserting/removing the data from the existing table will be relatively easy thorough filter use of date, city, state.  
  * Once the tables were created we checked the tables in pandas to ensure the connect existed and that the table creation was successful.
  * We ran an engine execute to delete all table contents from both tables to ensure no duplicative data and no primary key concerns.  
  * On the SQL JOIN we did an INNER JOIN to ensure no inspections listed without matching census data
