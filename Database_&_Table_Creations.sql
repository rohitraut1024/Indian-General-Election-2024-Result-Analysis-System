

-- ---------------------------------------------------------------------------------------------------------------------------



-- 1) SQL Query to CREATE a DATABASE named 'Indian_General_Election_2024_Result_Analysis' IF NOT EXISTS already

CREATE DATABASE IF NOT EXISTS Indian_General_Election_2024_Result_Analysis;


-- ---------------------------------------------------------------------------------------------------------------------------


-- 2) SQL Query to USE a Database named 'Indian_General_Election_2024_Result_Analysis' for further operations

USE Indian_General_Election_2024_Result_Analysis;


-- ---------------------------------------------------------------------------------------------------------------------------



-- 3) SQL Query to CTEATE a TABLE named 'Constituency_Wise_Details' IF NOT EXISTS already

CREATE TABLE IF NOT EXISTS Constituency_Wise_Details (
	Sr_No INT NOT NULL,
    Candidate_Name VARCHAR(200) NOT NULL,
    Political_Party VARCHAR(200),
    EVM_Votes INT NOT NULL,
    Postal_Votes INT NOT NULL,
    Total_Votes INT NOT NULL,
    Votes_Percantage DECIMAL(5,2) NOT NULL,
    Constituency_Id VARCHAR(5) NOT NULL
);



-- ---------------------------------------------------------------------------------------------------------------------------


-- 4) SQL Query to LOAD the DATA IN FILE named 'constituencywise_details.csv'
--    INTO TABLE named 'Constituency_Wise_Details'

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/constituencywise_details.csv'
INTO TABLE Constituency_Wise_Details
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 5) SQL Query to SELECT and view the data (rows & columns) stored in table named 'Constituency_Wise_Details'

SELECT * FROM Constituency_Wise_Details;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 6) SQL Query to CTEATE a TABLE named 'Constituency_Wise_Results' IF NOT EXISTS already

CREATE TABLE IF NOT EXISTS Constituency_Wise_Results (
	Sr_No INT NOT NULL,
    Parliament_Constituency VARCHAR(200),
    Constituency_Name VARCHAR(200) NOT NULL,
    Winning_Candidiate_Name VARCHAR(200) NOT NULL,
    Total_Votes_Received INT,
    Winning_Margin INT,
    Constituency_Id VARCHAR(5),
    Party_Id INT,
    PRIMARY KEY(Parliament_Constituency,Constituency_Id)
);




-- ---------------------------------------------------------------------------------------------------------------------------




-- 7) SQL Query to LOAD the DATA IN FILE named 'constituencywise_results.csv'
--    INTO TABLE named 'Constituency_Wise_Results'

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/constituencywise_results.csv'
INTO TABLE Constituency_Wise_Results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 8) SQL Query to SELECT and view the data (rows & columns) stored in table named 'Constituency_Wise_Results'

SELECT * FROM Constituency_Wise_Results;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 9) SQL Query to CTEATE a TABLE named 'Party_Wise_Results' IF NOT EXISTS already

CREATE TABLE IF NOT EXISTS Party_Wise_Results (
	Political_Party_Name VARCHAR(200) NOT NULL,
    Total_Seats_Won INT NOT NULL,
    Party_Id INT,
    PRIMARY KEY (Party_Id)
);




-- ---------------------------------------------------------------------------------------------------------------------------




-- 10) SQL Query to LOAD the DATA IN FILE named 'partywise_results.csv'
--     INTO TABLE named 'Party_Wise_Results'

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/partywise_results.csv'
INTO TABLE Party_Wise_Results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 11) SQL Query to SELECT and view the data (rows & columns) stored in table named 'Party_Wise_Results'

SELECT * FROM Party_Wise_Results;


-- ---------------------------------------------------------------------------------------------------------------------------




-- 12) SQL Query to CTEATE a TABLE named 'State_Wise_Results' IF NOT EXISTS already

CREATE TABLE IF NOT EXISTS State_Wise_Results (
	Constituency_Name VARCHAR(200) NOT NULL,
    Constituency_No INT NOT NULL,
    Parliament_Constituency VARCHAR(100),
    Leading_Candidate_Name VARCHAR(200),
    Trailing_Candidate_Name VARCHAR(200),
    Vote_Margin INT,
    Current_Status VARCHAR(50) NOT NULL,
    State_Id VARCHAR(5) NOT NULL,
    State_Name VARCHAR(200) NOT NULL,         -- Deleted Column (after creation)
    PRIMARY KEY (Parliament_Constituency)
);




-- ---------------------------------------------------------------------------------------------------------------------------




-- 13) SQL Query to LOAD the DATA IN FILE named 'statewise_results.csv'
--     INTO TABLE named 'State_Wise_Results'

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySql Server 8.4/Uploads/statewise_results.csv'
INTO TABLE State_Wise_Results
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 14) SQL Query to SELECT and view the data (rows & columns) stored in table named 'State_Wise_Results'

SELECT * FROM State_Wise_Results;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 15) The 'State_Name' column in this 'State_Wise_Results' Table contain wrong(misleading) Content/Information 
--     So Delete that Column Only

ALTER TABLE State_Wise_Results
DROP COLUMN State_Name;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 16) SQL Query to SELECT and view the data (rows & columns) stored in table named 'State_Wise_Results'

SELECT * FROM State_Wise_Results;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 17) SQL Query to CTEATE a TABLE named 'States' IF NOT EXISTS already

CREATE TABLE IF NOT EXISTS States (
	State_Id VARCHAR(5) PRIMARY KEY,
    State_Name VARCHAR(100) NOT NULL
);



-- ---------------------------------------------------------------------------------------------------------------------------



-- 18) SQL Query to LOAD the DATA IN FILE named 'states.csv'
--     INTO TABLE named 'States'

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/states.csv'
INTO TABLE States
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 19) SQL Query to SELECT and view the data (rows & columns) stored in table named 'States'

SELECT * FROM States;

-- SELECT * FROM States WHERE State_Name = 'Uttar Pradesh';

-- This SQL Query fails to return the rows:
--                  SELECT * FROM States WHERE State_Name = 'Uttar Pradesh';

-- Because, I'm able to retrieve data by only 'State_Id' column, but not by 'State_Name' column.

-- Probable Reason :- Suspected Hidden Characters

-- We suspected that, invisible characters (like carriage return \r) might be present
-- in the 'State_Name' values from the CSV file that we loaded in the 'State' Table.

-- Diagnosed with HEX() and LENGTH()
-- We can use the following SQL Diagnostic Query :

SELECT 
  State_Name,
  LENGTH(State_Name) AS CharLength,
  CHAR_LENGTH(State_Name) AS VisibleLength,
  HEX(State_Name) AS HexCode
FROM States
WHERE State_Name LIKE '%Uttar%';

-- Output:
--        State_Name       CharLength      VisibleLength      HexCode
--      ---------------------------------------------------------------------------------------
--        Uttar Pradesh    14              14                 557474617220507261646573680D
--        Uttarakhand      12              12                 5574746172616B68616E640D

-- We get '0D' at the end of the HexCode's of the State_Name's and
-- '0D' is the Hex Code for '\r (carriage return)'
-- Meaning, the actual value is 'Uttar Pradesh\r', not just 'Uttar Pradesh'.

-- Infact, the entire 'State_Name' column values are stored with a carriage return character (\r or 0D in HexCode) at the end,
-- like this:
--              Uttar Pradesh\r
--              Uttarakhand\r
-- and so on.

-- Solution: Remove the Carriage Return Character (\r or 0D in HexCode) from all 'State_Name' column values

-- Try to Fix it Using REPLACE() and TRIM() methods

-- But 'UPDATE' is Blocked by the 'Safe Update Mode'
-- so, We first disabled it:

SET SQL_SAFE_UPDATES = 0;

-- then, Fix it Using REPLACE() and TRIM() by running following SQL Query

UPDATE States
SET State_Name = TRIM(REPLACE(State_Name, '\r', ''));

-- This SQL Query:
--                 Removed all \r characters
--                 Trimmed any leading/trailing whitespace

-- Then, Re-Enabled the Safe Update Mode :

SET SQL_SAFE_UPDATES = 1;

-- Varify, this solution to our problem works or not:

SELECT * FROM States WHERE State_Name = 'Uttar Pradesh';

-- Yeah, It works Properly.




-- ---------------------------------------------------------------------------------------------------------------------------




-- 20) SQL query to add a new column named 'Alliance' to the 'Party_Wise_Results' table  
--     to specify the alliance (N.D.A. / I.N.D.I.A. / OTHER) each political party is associated with.

ALTER TABLE Party_Wise_Results
ADD COLUMN Alliance VARCHAR(50);




-- ---------------------------------------------------------------------------------------------------------------------------




-- 21) SQL Query to SELECT and view the data (rows & columns) stored in table named 'Party_Wise_Results'
--     To varify that the new column 'Alliance' is added successfully or not

SELECT * FROM Party_Wise_Results;





-- Since, the new column named 'Alliance' has been successfully added
-- and currently contains 'NULL' values for all rows,
-- we now need to UPDATE this column with the alliance name (NDA / INDIA / OTHERS)
-- to which each political party belongs.



-- ---------------------------------------------------------------------------------------------------------------------------




-- 22) Temporarily Disable the Safe Update Mode
--     Before running the UPDATE Query, Disabling the Safe Updates :

SET SQL_SAFE_UPDATES = 0;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 23) Now, first,
--     The SQL Query to UPDATE the 'Alliance' column by setting its value to 'I.N.D.I.A.'
--     for all the political parties that are part of the INDIA alliance.

UPDATE Party_Wise_Results
SET Alliance = 'I.N.D.I.A.'
WHERE Political_Party_Name IN (
	'Indian National Congress - INC',
	'Aam Aadmi Party - AAAP',
	'All India Trinamool Congress - AITC',
	'Bharat Adivasi Party - BHRTADVSIP',
	'Communist Party of India  (Marxist) - CPI(M)',
	'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
	'Communist Party of India - CPI',
	'Dravida Munnetra Kazhagam - DMK',
	'Indian Union Muslim League - IUML',
	'Nat`Jammu & Kashmir National Conference - JKN',
	'Jharkhand Mukti Morcha - JMM',
	'Jammu & Kashmir National Conference - JKN',
	'Kerala Congress - KEC',
	'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
	'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
	'Rashtriya Janata Dal - RJD',
	'Rashtriya Loktantrik Party - RLTP',
	'Revolutionary Socialist Party - RSP',
	'Samajwadi Party - SP',
	'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
	'Viduthalai Chiruthaigal Katchi - VCK'
);




-- ---------------------------------------------------------------------------------------------------------------------------



-- 24) Now, next,
--     The SQL Query to UPDATE the 'Alliance' column by setting its value to 'N.D.A.'
--     for all the political parties that are part of the NDA alliance.

UPDATE Party_Wise_Results
SET Alliance = 'N.D.A.'
WHERE Political_Party_Name IN (
    'Asom Gana Parishad - AGP',
    'AJSU Party - AJSUP',
    'Bharatiya Janata Party - BJP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janata Dal  (United) - JD(U)',
    'Janasena Party - JnP',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM',
    'Telugu Desam - TDP',
    'Apna Dal (Soneylal) - ADAL',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Shiv Sena - SHS',
    'Janata Dal  (Secular) - JD(S)'
);


-- ---------------------------------------------------------------------------------------------------------------------------



-- 25) Finally,
--     the SQL query to update the 'Alliance' column by setting its value to 'OTHER'
--     for all remaining political parties that are not part of either the N.D.A. or I.N.D.I.A. alliances.

UPDATE Party_Wise_Results
SET Alliance = 'OTHER' 
WHERE Alliance IS NULL; 



-- ---------------------------------------------------------------------------------------------------------------------------




-- 26) SQL query to SELECT and view the data (rows and columns) from the 'Party_Wise_Results' table  
--     to verify that all the UPDATE operations on the new 'Alliance' column were executed successfully


SELECT * FROM Party_Wise_Results;




-- ---------------------------------------------------------------------------------------------------------------------------





-- 27) Re-enable Safe Update Mode, which was turned off in Query No. 22 (at line number 319 in the same file)

SET SQL_SAFE_UPDATES = 1;



-- ---------------------------------------------------------------------------------------------------------------------------
