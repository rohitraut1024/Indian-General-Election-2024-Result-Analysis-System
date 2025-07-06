
# Indian General Election 2024 – SQL Result Analysis

This project presents a detailed **SQL-based data analysis** of the **2024 Indian General Election** using MySQL 8.4. It includes schema setup, data loading from CSVs, and 48 insightful queries to understand political party performance, alliance-wise trends, vote shares, margins, and much more.

---

## 📁 Project Structure

| File Name                        | Description                                                               |
|----------------------------------|---------------------------------------------------------------------------|
| `Database_&_Table_Creations.sql` | SQL script to create the database, tables, and load data from CSV files   |
| `Basic_Results_Queries.sql`      | 48 essential analytical queries                                           |
| `states.csv`, etc.               | Raw data files (optional for import)                                      |

---

## 🧠 Key Features & Concepts

- ✅ State-wise and Constituency-wise seat distribution
- ✅ Party-wise and Alliance-wise seat tallies
- ✅ Top performing candidates and victory margins
- ✅ Postal vs EVM vote analysis
- ✅ Vote percentage, winning trends, tight contests

---

## 🛠️ Technologies Used

- **Database:** MySQL 8.4
- **Interface:** MySQL Workbench
- **Data Format:** CSV
- **Language:** SQL (Structured Query Language)

---

## 🧾 How to Run the Project

1. Clone or download this repository.
2. Open `MySQL Workbench` and execute `Database_&_Table_Creations.sql` to create schema and import data.
3. Run queries from:
   - `Basic_Results_Queries.sql` – Queries 1 to 48

---

## 📌 Sample Query

> Show the number of seats won by each alliance in each state:

```sql
SELECT 
    S.State_Name AS State,
    SUM(PWR.Alliance = 'N.D.A.') AS NDA,
    SUM(PWR.Alliance = 'I.N.D.I.A.') AS INDIA,
    SUM(PWR.Alliance = 'OTHER') AS OTHER
FROM Constituency_Wise_Results CWR
JOIN Party_Wise_Results PWR ON CWR.Party_Id = PWR.Party_Id
JOIN State_Wise_Results SWR ON CWR.Parliament_Constituency = SWR.Parliament_Constituency
JOIN States S ON SWR.State_Id = S.State_Id
GROUP BY S.State_Name
ORDER BY S.State_Name;
```

---

## 📸 Sample Output

![image](https://github.com/user-attachments/assets/ecac3877-08ba-4f3d-a689-02efd126b8b8)

---

## 👩‍💻 Author

**Rohit Raut**  
📍 Pune, India  
🖇 www.linkedin.com/in/rohitraut1024

---

## ⭐ Feedback / Suggestions

Feel free to fork, star ⭐ this project, and raise issues or suggestions via GitHub.

