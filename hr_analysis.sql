-- HR & Workforce Intelligence Analysis

-- 1. Overall Attrition Count & Rate
SELECT 
    COUNT(EmpID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(EmpID) * 100, 2) AS Attrition_Rate
FROM HR_Analytics;

-- 2. Attrition by Department
SELECT 
    Department,
    COUNT(EmpID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM HR_Analytics
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- 3. Attrition by Job Role & Satisfaction
SELECT 
    JobRole,
    JobSatisfaction,
    COUNT(EmpID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM HR_Analytics
GROUP BY JobRole, JobSatisfaction
ORDER BY JobRole, JobSatisfaction;