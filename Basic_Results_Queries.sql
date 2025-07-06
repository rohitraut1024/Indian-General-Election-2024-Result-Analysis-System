
-- ---------------------------------------------------------------------------------------------------------------------------



-- 1) Query to find the Total no. of constituencies (seats) 

SELECT COUNT( DISTINCT Parliament_Constituency) AS Total_Seats
FROM Constituency_Wise_Results;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 2) Query to find the Total no. of seats available for elections 
--    in each State

-- by INNER JOIN (JOIN) between two tables: 'States' & 'State_Wise_Results'

SELECT 	S.State_Name AS State,
		COUNT( DISTINCT SWR.Parliament_Constituency) AS Total_Seats
FROM States AS S
INNER JOIN State_Wise_Results AS SWR
ON S.State_Id = SWR.State_Id
GROUP BY State_Name
ORDER BY Total_Seats DESC;

-- by INNER JOIN (JOIN) between three tables:
--  'States' & 'State_Wise_Results' & 'Constituency_Wise_Results'

SELECT  S.State_Name AS State,
	    COUNT( DISTINCT CWR.Parliament_Constituency) AS Total_Seats
FROM Constituency_Wise_Results AS CWR
INNER JOIN State_Wise_Results AS SWR
ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
INNER JOIN States AS S
ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name
ORDER BY S.State_Name ASC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 3) Query to find the Total no. of seats won by each Political Party

SELECT DISTINCT Political_Party_Name AS Political_Party,
	   Total_Seats_Won
FROM  Party_Wise_Results
ORDER BY Total_Seats_Won DESC;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 4) Query to find the Total no. of seats won by
--    the N.D.A. (National Democratic Alliance) Alliance

SELECT 
    SUM(Total_Seats_Won) AS Total_Seats_Won_By_NDA_Alliance
FROM Party_Wise_Results
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



-- 5) Query to find the Total no. of seats won by each party in 
--    the N.D.A. (National Democratic Alliance) Alliance

SELECT Political_Party_Name AS Political_Party,
	   Total_Seats_Won
FROM Party_Wise_Results
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
)
ORDER BY Total_Seats_Won DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 6) Query to find the Total no. of seats won by the
--    I.N.D.I.A. (Indian National Developmental Inclusive Alliance) Alliance

SELECT 
    SUM(Total_Seats_Won) AS Total_Seats_Won_By_INDIA_Alliance
FROM Party_Wise_Results
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




-- 7) Query to find the Total no. of seats won by each party in 
--    the I.N.D.I.A. (Indian National Developmental Inclusive Alliance) Alliance

SELECT Political_Party_Name AS Political_Party,
	   Total_Seats_Won
FROM Party_Wise_Results
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
)
ORDER BY Total_Seats_Won DESC;


-- ---------------------------------------------------------------------------------------------------------------------------



-- ✅ The 'Alliance' column has been successfully added to the 'Party_Wise_Results' table,
--    and all rows have been updated with the correct alliance values ('N.D.A.', 'I.N.D.I.A.', or 'OTHER'),
--    based on the political party each row represents.
--    All of these operations were completed in the query file named 'Database_&_Table_Creations'.



-- After completing the above steps,
-- all the previous queries (4, 5, 6, and 7) can now be written in a simpler way
-- by utilizing the newly added 'Alliance' column, as shown below.



-- 4)* Query to find the Total no. of seats won by
--     the N.D.A. (National Democratic Alliance) Alliance

SELECT SUM(Total_Seats_Won) AS Total_Seats_Won_By_NDA_Alliance
FROM Party_Wise_Results
WHERE (Alliance = 'N.D.A.');




-- 5)* Query to find the Total no. of seats won by each party in 
--     the N.D.A. (National Democratic Alliance) Alliance

SELECT Political_Party_Name AS Political_Party,
       Total_Seats_Won AS Seats_Won
FROM Party_Wise_Results
WHERE (Alliance = 'N.D.A.')
ORDER BY Seats_Won DESC;
       



-- 6)* Query to find the Total no. of seats won by the
--     I.N.D.I.A. (Indian National Developmental Inclusive Alliance) Alliance

SELECT SUM(Total_Seats_Won) AS Total_Seats_Won_By_INDIA_Alliance
FROM Party_Wise_Results
WHERE (Alliance = 'I.N.D.I.A.');




-- 7)* Query to find the Total no. of seats won by each party in 
--     the I.N.D.I.A. (Indian National Developmental Inclusive Alliance) Alliance

SELECT Political_Party_Name AS Political_Party,
	   Total_Seats_Won AS Seats_Won
FROM Party_Wise_Results
WHERE (Alliance = 'I.N.D.I.A.')
ORDER BY Seats_Won DESC;



-- ---------------------------------------------------------------------------------------------------------------------------


-- 8) SQL query to show the Overall result of the Indian General Election 2024,  
--    i.e., the total number of seats won by each alliance (NDA / I.N.D.I.A. / OTHER).

SELECT Alliance AS Political_Alliance,
	   SUM(Total_Seats_Won) AS Seats_Won
FROM Party_Wise_Results
GROUP BY Political_Alliance
ORDER BY Seats_Won DESC;


-- ---------------------------------------------------------------------------------------------------------------------------



-- 9) SQL query to select and view a table showing the following details:  
--    Winning candidate name, political party name, total votes received, victory margin,  
--    constituency name, and state name.

SELECT CWR.Winning_Candidiate_Name AS Winning_Candidate,
	   PWR.Political_Party_Name AS Party,
       PWR.Alliance AS Political_Alliance,
       CWR.Total_Votes_Received AS Total_Votes,
       CWR.Winning_Margin AS Victory_Margin,
       CWR.Constituency_Name AS Constituency,
       S.State_Name AS State
FROM Constituency_Wise_Results AS CWR
LEFT JOIN Party_Wise_Results AS PWR
ON CWR.Party_Id = PWR.Party_Id
LEFT JOIN State_Wise_Results AS SWR
ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
INNER JOIN States AS S
ON SWR.State_Id = S.State_Id;

-- We can add conditions using the WHERE clause to filter rows after applying the JOINs.  
-- For example:  
--     WHERE Political_Party_Name = 'Independent - IND'  
--     WHERE CWR.Constituency_Name = 'AGRA'  
-- and so on.



-- ---------------------------------------------------------------------------------------------------------------------------


-- 10) SQL query to show the distribution of EVM votes vs Postal votes  
--     received by all candidates in a specific constituency.

SELECT CWD.Sr_No, CWD.Candidate_Name AS Candidate,
	   CWD.Political_Party AS Party,
       CWD.EVM_Votes, CWD.Postal_Votes,
       CWR.Constituency_Name
FROM Constituency_Wise_Results AS CWR
INNER JOIN Constituency_Wise_Details AS CWD
ON CWD.Constituency_Id = CWR.Constituency_Id
WHERE CWR.Constituency_Name = "BARAMATI"
ORDER BY (CWD.EVM_Votes + CWD.Postal_Votes) DESC;

-- Here, we have written: WHERE CWR.Constituency_Name = "BARAMATI"
-- But this query can be used to view the EVM vs Postal vote distribution  
-- for candidates in **any** constituency — simply replace "BARAMATI" with the desired name.



-- ---------------------------------------------------------------------------------------------------------------------------



-- 11) SQL Query to Show the total no. of seats won by the Political Parties
--     in a specific state (only if they won at least 1 seat)

SELECT 
	S.State_Name AS State,
    PWR.Political_Party_Name AS Political_Party,
    COUNT(CWR.Constituency_Id) AS Seats_Won
FROM 
    Constituency_Wise_Results AS CWR
JOIN      -- INNER JOIN
    Party_Wise_Results AS PWR ON CWR.Party_Id = PWR.Party_Id
JOIN      -- INNER JOIN 
    State_Wise_Results AS SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN      -- INNER JOIN
	States AS S ON SWR.State_Id = S.State_Id
WHERE 
    S.State_Name = 'Andhra Pradesh'
GROUP BY 
    PWR.Political_Party_Name
HAVING
	COUNT(CWR.Constituency_Id) > 0
ORDER BY
    Seats_Won DESC;
    
-- We can do the same for any State; 
-- just change the State Name in : WHERE S.State_Name = 'Andhra Pradesh'
-- Example: S.State_Name = 'Bihar', etc.,




-- ---------------------------------------------------------------------------------------------------------------------------



-- 12) SQL Query to show the total no. of seats won by the political alliances
--     (I.N.D.I.A. / N.D.A. / OTHER) in a specific state

SELECT
	S.State_Name AS State,
    PWR.Alliance AS Political_Alliance,
    COUNT(CWR.Constituency_Id) AS Seats_Won
FROM 
    Party_Wise_Results AS PWR
LEFT JOIN 
    Constituency_Wise_Results AS CWR ON CWR.Party_Id = PWR.Party_Id
LEFT JOIN 
    State_Wise_Results AS SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
LEFT JOIN 
    States AS S ON SWR.State_Id = S.State_Id
WHERE 
    S.State_Name = 'Maharashtra'
GROUP BY 
    PWR.Alliance
ORDER BY 
    Seats_Won DESC;

-- We can do the same for any state;
-- just change the state name in: WHERE S.State_Name = 'Maharashtra'
-- Example: S.State_Name = 'Karnataka', etc.,




-- ---------------------------------------------------------------------------------------------------------------------------



-- 	   We can get the Alliance-wise results for all the states at once as follows:

-- 13) SQL Query to show the total no. of seats won by the political alliances
--     (I.N.D.I.A. / N.D.A. / OTHER) across all the states

SELECT 
    S.State_Name AS State,
    SUM(PWR.Alliance = 'N.D.A.') AS NDA,
    SUM(PWR.Alliance = 'I.N.D.I.A.') AS INDIA,
    SUM(PWR.Alliance = 'OTHER') AS OTHER
FROM 
    Constituency_Wise_Results CWR
JOIN 		-- INNER JOIN
	Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
JOIN        -- INNER JOIN
	State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN        -- INNER JOIN
	States S ON SWR.State_Id = S.State_Id
GROUP BY 
    S.State_Name
ORDER BY 
    S.State_Name;


-- ---------------------------------------------------------------------------------------------------------------------------




-- 14) SQL Query to show the names of the candidates who secured 
--     the highest number of EVM votes in each constituency (Top 10 only)

SELECT 
    CWD.Constituency_Id,
    CWR.Constituency_Name AS Constituency,
    CWD.Candidate_Name AS Candidate,
    CWD.EVM_Votes AS Max_EVM_Votes_Secured
FROM 
    Constituency_Wise_Details CWD
JOIN 
    Constituency_Wise_Results CWR 
    ON CWD.Constituency_Id = CWR.Constituency_Id
WHERE 
    (CWD.Constituency_Id, CWD.EVM_Votes) IN (
        SELECT 
            Constituency_Id, MAX(EVM_Votes)
        FROM 
            Constituency_Wise_Details
        GROUP BY 
            Constituency_Id
    )
ORDER BY 
    Max_EVM_Votes_Secured DESC
LIMIT
	10;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 15) SQL Query to Display the names of both the Winning Candidate 
--     and the Runner-up Candidate for each constituency.

SELECT 
	SWR.Constituency_Name AS Constituency,
	SWR.Leading_Candidate_Name AS Winning_Candidate,
    SWR.Trailing_Candidate_Name AS Runner_up_Candidate,
    SWR.Vote_Margin
FROM State_Wise_Results AS SWR
ORDER BY SWR.Vote_Margin DESC;
    
    


-- ---------------------------------------------------------------------------------------------------------------------------




-- 16) Query to find the candidate who secured the highest total votes in the entire country

SELECT Candidate_Name, Political_Party, Total_Votes
FROM Constituency_Wise_Details
ORDER BY Total_Votes DESC
LIMIT 1;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 17) Query to list top 10 candidates with the highest total votes nationally

SELECT Candidate_Name, Political_Party, Total_Votes
FROM Constituency_Wise_Details
ORDER BY Total_Votes DESC
LIMIT 10;


-- ---------------------------------------------------------------------------------------------------------------------------



-- 18) Query to find the state with the highest number of constituencies

SELECT S.State_Name, COUNT(DISTINCT SWR.Parliament_Constituency) AS Total_Constituencies
FROM State_Wise_Results AS SWR
JOIN States AS S ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name
ORDER BY Total_Constituencies DESC
LIMIT 1;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 19) Query to find the political party with the most total votes (aggregated from all candidates)

SELECT Political_Party, SUM(Total_Votes) AS Total_Votes
FROM Constituency_Wise_Details
GROUP BY Political_Party
ORDER BY Total_Votes DESC
LIMIT 1;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 20) Query to find average voter turnout percentage per constituency

SELECT Constituency_Id,
	   AVG(Votes_Percantage) AS Avg_Vote_Percentage
FROM Constituency_Wise_Details
GROUP BY Constituency_Id;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 21) Query to list all Independent candidates and their total votes

SELECT Candidate_Name, Political_Party, Total_Votes
FROM Constituency_Wise_Details
WHERE Political_Party LIKE '%Independent%'
ORDER BY Total_Votes DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 22) Query to find candidates who received more than 10 Thousand postal votes

SELECT Candidate_Name, Political_Party, Postal_Votes
FROM Constituency_Wise_Details
WHERE Postal_Votes > 10000
ORDER BY Postal_Votes DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 23) Query to find all constituencies where victory margin was less than 1000 votes

SELECT Constituency_Name, Winning_Candidiate_Name, Winning_Margin
FROM Constituency_Wise_Results
WHERE Winning_Margin < 1000
ORDER BY Winning_Margin ASC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 24) Query to list all parties with 0 seats won

SELECT Political_Party_Name
FROM Party_Wise_Results
WHERE Total_Seats_Won = 0;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 25) Query to find total number of votes cast in the country

SELECT SUM(Total_Votes) AS Total_Votes_Cast
FROM Constituency_Wise_Details;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 26) Query to find which party had the highest number of runner-up finishes (trailing candidates)

SELECT CWD.Political_Party, COUNT(*) AS Runner_Up_Count
FROM State_Wise_Results SWR
JOIN Constituency_Wise_Details CWD ON SWR.Trailing_Candidate_Name = CWD.Candidate_Name
GROUP BY CWD.Political_Party
ORDER BY Runner_Up_Count DESC
LIMIT 1;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 27) Query to count how many parties belong to each alliance

SELECT Alliance, COUNT(*) AS Number_of_Parties
FROM Party_Wise_Results
GROUP BY Alliance;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 28) Query to list alliances with total seats > 50

SELECT Alliance, SUM(Total_Seats_Won) AS Total_Seats
FROM Party_Wise_Results
GROUP BY Alliance
HAVING Total_Seats > 50;





-- ---------------------------------------------------------------------------------------------------------------------------




-- 29) Query to find top 3 constituencies with highest total voter turnout

SELECT Constituency_Id, SUM(Total_Votes) AS Total_Votes
FROM Constituency_Wise_Details
GROUP BY Constituency_Id
ORDER BY Total_Votes DESC
LIMIT 3;




-- ---------------------------------------------------------------------------------------------------------------------------





-- 30) Query to display all candidates with vote percentage Greater than 50%

SELECT Candidate_Name, Constituency_Id, Votes_Percantage
FROM Constituency_Wise_Details
WHERE Votes_Percantage > 50.00;




-- ---------------------------------------------------------------------------------------------------------------------------





-- 31) Query to count total candidates contested in each state

SELECT S.State_Name, COUNT(CWD.Sr_No) AS Total_Candidates
FROM Constituency_Wise_Details CWD
JOIN Constituency_Wise_Results CWR ON CWD.Constituency_Id = CWR.Constituency_Id
JOIN State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN States S ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name
ORDER BY Total_Candidates DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 32) Query to calculate average votes per candidate by party

SELECT Political_Party, ROUND(AVG(Total_Votes), 2) AS Avg_Votes
FROM Constituency_Wise_Details
GROUP BY Political_Party
ORDER BY Avg_Votes DESC;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 33) Query to show top 5 constituencies with highest winning margin

SELECT Constituency_Name, Winning_Candidiate_Name, Winning_Margin
FROM Constituency_Wise_Results
ORDER BY Winning_Margin DESC
LIMIT 5;




-- ---------------------------------------------------------------------------------------------------------------------------




-- 34) Query to count number of constituencies won by each party per state

SELECT S.State_Name, PWR.Political_Party_Name, COUNT(*) AS Seats_Won
FROM Constituency_Wise_Results CWR
JOIN Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
JOIN State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN States S ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name, PWR.Political_Party_Name
ORDER BY S.State_Name;



-- ---------------------------------------------------------------------------------------------------------------------------





-- 35) Query to find average postal votes across all candidates

SELECT ROUND(AVG(Postal_Votes), 2) AS Avg_Postal_Votes
FROM Constituency_Wise_Details;



-- ---------------------------------------------------------------------------------------------------------------------------





-- 36) Query to list candidates with more than 70% votes in their constituency

SELECT Candidate_Name, Votes_Percantage
FROM Constituency_Wise_Details
WHERE Votes_Percantage > 70
ORDER BY Votes_Percantage DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 37) Query to find state-wise total votes cast

SELECT S.State_Name, SUM(CWD.Total_Votes) AS Total_Votes
FROM Constituency_Wise_Details CWD
JOIN Constituency_Wise_Results CWR ON CWD.Constituency_Id = CWR.Constituency_Id
JOIN State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN States S ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name
ORDER BY Total_Votes DESC;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 38) Query to find party that contested in the most constituencies

SELECT Political_Party, COUNT(DISTINCT Constituency_Id) AS Constituencies_Contested
FROM Constituency_Wise_Details
WHERE Political_Party NOT IN ('None of the Above', "Independent")
GROUP BY Political_Party
ORDER BY Constituencies_Contested DESC
LIMIT 1;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 39) Query to get total candidates contested by each party

SELECT Political_Party, COUNT(*) AS Total_Candidates
FROM Constituency_Wise_Details
WHERE Political_Party NOT IN ('None of the Above', "Independent")
GROUP BY Political_Party
ORDER BY Total_Candidates DESC;




-- ---------------------------------------------------------------------------------------------------------------------------





-- 40) Query to find all parties that won at least one seat in Bihar

SELECT DISTINCT PWR.Political_Party_Name
FROM Constituency_Wise_Results CWR
JOIN Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
JOIN State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN States S ON SWR.State_Id = S.State_Id
WHERE S.State_Name = 'Bihar';




-- ---------------------------------------------------------------------------------------------------------------------------





-- 41) Query to find alliance with maximum total votes (aggregated from candidates)

SELECT PWR.Alliance, SUM(CWD.Total_Votes) AS Total_Votes
FROM Constituency_Wise_Details CWD
JOIN Constituency_Wise_Results CWR ON CWD.Constituency_Id = CWR.Constituency_Id
JOIN Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
GROUP BY PWR.Alliance
ORDER BY Total_Votes DESC;



-- ---------------------------------------------------------------------------------------------------------------------------


-- 42) Query to list all parties whose average vote percentage is more than 40%

SELECT Political_Party, ROUND(AVG(Votes_Percantage), 2) AS Avg_Percentage
FROM Constituency_Wise_Details
GROUP BY Political_Party
HAVING Avg_Percentage > 40
ORDER BY Avg_Percentage DESC;


-- ---------------------------------------------------------------------------------------------------------------------------




-- 43) Query to count number of candidates per constituency

SELECT Constituency_Id, COUNT(*) AS Candidates_Contested
FROM Constituency_Wise_Details
GROUP BY Constituency_Id
ORDER BY Candidates_Contested DESC;


-- ---------------------------------------------------------------------------------------------------------------------------




-- 44) Query to find party with most candidates finishing in second place

SELECT CWD.Political_Party, COUNT(*) AS Runner_Up_Count
FROM State_Wise_Results SWR
JOIN Constituency_Wise_Details CWD ON SWR.Trailing_Candidate_Name = CWD.Candidate_Name
GROUP BY CWD.Political_Party
ORDER BY Runner_Up_Count DESC;



-- ---------------------------------------------------------------------------------------------------------------------------



-- 45) Query to show how many constituencies had more than 10 candidates

SELECT Constituency_Id, COUNT(*) AS Candidate_Count
FROM Constituency_Wise_Details
GROUP BY Constituency_Id
HAVING Candidate_Count > 10
ORDER BY Candidate_Count DESC;


-- ---------------------------------------------------------------------------------------------------------------------------




-- 46) Query to find total number of unique political parties contested

SELECT COUNT(DISTINCT Political_Party_Name) AS Unique_Parties
FROM Party_Wise_Results
WHERE Political_Party_Name NOT IN ('None of the Above', "Independent");


-- ---------------------------------------------------------------------------------------------------------------------------



-- 47) Query to find top 3 alliances by average vote percentage of their candidates

SELECT PWR.Alliance, ROUND(AVG(CWD.Votes_Percantage), 2) AS Avg_Percentage
FROM Constituency_Wise_Details CWD
JOIN Constituency_Wise_Results CWR ON CWD.Constituency_Id = CWR.Constituency_Id
JOIN Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
GROUP BY PWR.Alliance
ORDER BY Avg_Percentage DESC
LIMIT 3;



-- ---------------------------------------------------------------------------------------------------------------------------




-- 48) Query to list all candidates with EVM votes greater than postal votes

SELECT Candidate_Name, EVM_Votes, Postal_Votes
FROM Constituency_Wise_Details
WHERE EVM_Votes > Postal_Votes;




-- ---------------------------------------------------------------------------------------------------------------------------
