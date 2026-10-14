Create database If not exists hospital_analytics;
USE hospital_analytics;
Create Table If Not Exists Patient_records (
Patient_ID INT primary Key,
Name varchar(100),
Age INT,
Gender varchar(20),
Admission_Date DATE,
Discharge_Date DATE,
Department varchar(50),
Doctor_Assigned Varchar(100),
Diagnosis Varchar(100),
Billing_Amount Decimal(12,2),
Insurance_Type varchar(50)
) ;
SHOW TABLES;
