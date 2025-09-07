DROP TABLE IF EXISTS
Employee_Attrition CASCADE;
CREATE TABLE Employee_Attrition 
(
    EmployeeID SERIAL PRIMARY
KEY,
    Age INT,
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    MonthlyIncome NUMERIC(10,2),
    DistanceFromHome INT,
    Education INT,
    JobSatisfaction INT,
    EnvironmentSatisfaction INT,
    OverTime VARCHAR(10),
    YearsAtCompany INT,
    Attrition VARCHAR(5),
    PerformanceRating INT
);
INSERT INTO Employee_Attrition
(Age, Department, JobRole, MonthlyIncome, DistanceFromHome,
 Education, JobSatisfaction, EnvironmentSatisfaction, OverTime,
 YearsAtCompany, Attrition, PerformanceRating)
VALUES
(29, 'Sales', 'Sales Executive', 4500.00, 10, 3, 4, 3, 'Yes', 2, 'Yes', 3),
(35, 'Research & Development', 'Research Scientist', 6500.00, 5, 4, 2, 4, 'No', 5, 'No', 4),
(41, 'HR', 'HR Specialist', 4000.00, 2, 2, 3, 2, 'Yes', 8, 'No', 3),
(30, 'Sales', 'Sales Executive', 3000.00, 12, 3, 1, 1, 'Yes', 1, 'Yes', 2),
(45, 'Research & Development', 'Laboratory Technician', 5500.00, 7, 3, 3, 4, 'No', 12, 'No', 4),
(28, 'HR', 'Recruiter', 3200.00, 15, 2, 4, 2, 'No', 3, 'Yes', 3),
(39, 'Research & Development', 'Research Scientist', 7200.00, 6, 4, 2, 3, 'Yes', 9, 'No', 4),
(33, 'Sales', 'Manager', 9500.00, 4, 5, 3, 4, 'No', 11, 'No', 4),
(26, 'Research & Development', 'Laboratory Technician', 3100.00, 20, 3, 2, 2, 'Yes', 1, 'Yes', 2),
(50, 'HR', 'HR Specialist', 6000.00, 8, 2, 3, 3, 'No', 20, 'No', 4),
(36, 'Sales', 'Sales Executive', 4800.00, 3, 3, 4, 4, 'Yes', 7, 'Yes', 3),
(42, 'Research & Development', 'Research Scientist', 8000.00, 9, 4, 2, 3, 'No', 15, 'No', 4),
(31, 'HR', 'Recruiter', 3500.00, 14, 2, 3, 2, 'Yes', 4, 'Yes', 2),
(38, 'Research & Development', 'Laboratory Technician', 5000.00, 5, 3, 2, 3, 'No', 10, 'No', 3),
(29, 'Sales', 'Sales Executive', 4200.00, 11, 3, 1, 2, 'Yes', 2, 'Yes', 2);
SELECT EmployeeID, COUNT(*) 
FROM Employee_Attrition
GROUP BY EmployeeID
HAVING COUNT(*) > 1;
SELECT *
FROM Employee_Attrition
WHERE Age IS NULL
   OR Department IS NULL
   OR MonthlyIncome IS NULL;
SELECT 
    ROUND(COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Attrition_Percentage
FROM Employee_Attrition;
SELECT Department,
       COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
       COUNT(*) AS Total_Employees,
       ROUND(COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM Employee_Attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;
SELECT OverTime,
       COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
       COUNT(*) AS Total_Employees,
       ROUND(COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM Employee_Attrition
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;
SELECT Attrition,
       ROUND(AVG(MonthlyIncome), 2) AS Avg_MonthlyIncome
FROM Employee_Attrition
GROUP BY Attrition;
SELECT JobSatisfaction,
       COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM Employee_Attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
