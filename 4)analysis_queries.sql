USE hospital_analytics;

## Total Number of Patients
SELECT
    COUNT(*) AS Total_Patients
FROM hospital_dataset3;
## Average Patient Age
SELECT
    ROUND(AVG(`AGE`), 2) AS Average_Age
FROM hospital_dataset3;

  ##Gender-wise Patient Count
SELECT
    `GENDER`,
    COUNT(*) AS Patient_Count
FROM hospital_dataset3
GROUP BY `GENDER`
ORDER BY Patient_Count DESC;
 ##Department-wise Patient Count
SELECT
    `DEPARTMENT`,
    COUNT(*) AS Patient_Count
FROM hospital_dataset3
GROUP BY `DEPARTMENT`
ORDER BY Patient_Count DESC;

##Diagnosis-wise Patient Count
SELECT
    `DIAGNOSIS`,
    COUNT(*) AS Patient_Count
FROM hospital_dataset3
GROUP BY `DIAGNOSIS`
ORDER BY Patient_Count DESC;
## Average Billing Amount by Department
SELECT
    `DEPARTMENT`,
    ROUND(AVG(`BILLING_AMOUNT`), 2) AS Average_Billing
FROM hospital_dataset3
GROUP BY `DEPARTMENT`
ORDER BY Average_Billing DESC;
### Total Billing Amount by Insurance Type
SELECT
    `INSURANCE TYPE`,
    ROUND(SUM(`BILLING_AMOUNT`), 2) AS Total_Billing
FROM hospital_dataset3
GROUP BY `INSURANCE TYPE`
ORDER BY Total_Billing DESC;
##Average Hospital Stay in Days
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y'),
                STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y')
            )
        ),
        2
    ) AS Average_Stay_Days
FROM hospital_dataset3
WHERE
    STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y') IS NOT NULL
    AND STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y') IS NOT NULL
    AND STR_TO_DATE(`DISCHARGE_DATE`, '%d-%m-%Y')
        >= STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y');

##Monthly Patient Admissions
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS Admission_Month,
    COUNT(*) AS Patient_Count
FROM hospital_dataset3
WHERE STR_TO_DATE(`ADMISSION_DATE`, '%d-%m-%Y') IS NOT NULL
GROUP BY Admission_Month
ORDER BY Admission_Month;
##Top 5 Diagnoses
SELECT
    `DIAGNOSIS`,
    COUNT(*) AS Patient_Count
FROM hospital_dataset3
GROUP BY `DIAGNOSIS`
ORDER BY Patient_Count DESC
LIMIT 5;


