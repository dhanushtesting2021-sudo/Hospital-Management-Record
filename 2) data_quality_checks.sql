SELECT
    SUM(`PATIENT ID` IS NULL) AS Missing_Patient_ID,
    SUM(`NAME` IS NULL OR TRIM(`NAME`) = '') AS Missing_Name,
    SUM(`AGE` IS NULL) AS Missing_Age,
    SUM(`GENDER` IS NULL OR TRIM(`GENDER`) = '') AS Missing_Gender,
    SUM(`ADMISSION_DATE` IS NULL OR TRIM(`ADMISSION_DATE`) = '') AS Missing_Admission_Date,
    SUM(`DISCHARGE_DATE` IS NULL OR TRIM(`DISCHARGE_DATE`) = '') AS Missing_Discharge_Date,
    SUM(`DEPARTMENT` IS NULL OR TRIM(`DEPARTMENT`) = '') AS Missing_Department
FROM hospital_dataset3;
USE hospital_analytics;
SELECT
    `PATIENT ID`,
    COUNT(*) AS Duplicate_Count
FROM hospital_dataset3
WHERE `PATIENT ID` IS NOT NULL
GROUP BY `PATIENT ID`
HAVING COUNT(*) > 1;

SELECT
    `PATIENT ID`,
    `ADMISSION_DATE`,
    `DISCHARGE_DATE`
FROM hospital_dataset3
WHERE
    (
        `ADMISSION_DATE` IS NOT NULL
        AND TRIM(`ADMISSION_DATE`) <> ''
        AND STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y') IS NULL
    )
    OR
    (
        `DISCHARGE_DATE` IS NOT NULL
        AND TRIM(`DISCHARGE_DATE`) <> ''
        AND STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y') IS NULL
    )
    OR
    (
        STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y') IS NOT NULL
        AND STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y') IS NOT NULL
        AND STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y')
            < STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y')
    );
    
SELECT
    `PATIENT ID`,
    `NAME`,
    `AGE`
FROM hospital_dataset3
WHERE `AGE` < 0
   OR `AGE` > 120;