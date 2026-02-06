CREATE DATABASE hospital_db;
USE hospital_db;

## Total patients

SELECT COUNT(DISTINCT patient_id) AS total_patients
FROM admission;

## Average Length of Stay (ALOS)
SELECT 
    AVG(DATEDIFF(Discharge_Time, Admission_Time)) AS avg_length_of_stay
FROM admission;

## Admission Count by Department
SELECT Department, COUNT(*) AS total_admissions
FROM admission
GROUP BY department;

##Emergency vs Scheduled Cases
SELECT 
    emergency_flag,
    COUNT(*) AS cases
FROM admissions
GROUP BY emergency_flag;

## total bed days
SELECT SUM(bed_days) AS total_bed_days
FROM resources;

##Branch Comparison
SELECT branch, COUNT(*) AS admissions
FROM admission
GROUP BY branch;

## Readmission Rate (30 days)
SELECT 
    (SUM(readmission_30d) * 100.0 / COUNT(*)) AS readmission_rate
FROM outcome;

## Average Cost per Department
SELECT a.department, AVG(b.total_cost) AS avg_cost
FROM admission as a
JOIN billing  as b ON a.Admission_ID = b.Admission_ID
GROUP BY a.department;

### Insurance Claim Status
SELECT insurance_claim_status, COUNT(*) AS cases
FROM billing
GROUP BY insurance_claim_status;

##8. ICU Usage Rate
SELECT 
    (SUM(icu_used) * 100.0 / COUNT(*)) AS icu_usage_percent
FROM resources;

## Doctor Utilization Average
SELECT AVG(Doctor_Utilization ) AS avg_doctor_utilization
FROM staff;

## Outcome Distribution
SELECT outcome, COUNT(*) AS total
FROM outcome
GROUP BY outcome;

## Monthly Trend
SELECT 
    MONTH(admission_time) AS month,
    COUNT(*) AS admission
FROM admission
GROUP BY MONTH(admission_time)
ORDER BY month;

## Insurance Claim Status
SELECT insurance_claim_status, COUNT(*) AS cases
FROM billing
GROUP BY insurance_claim_status;

## Total Patients by Gender
SELECT gender, COUNT(*) AS total_patients
FROM patients
GROUP BY gender;

##Age Group Distribution
SELECT age_group, COUNT(*) AS total
FROM patients
GROUP BY age_group
ORDER BY total DESC;

##Insurance Type Breakdown
SELECT insurance_type, COUNT(*) AS patients
FROM patients
GROUP BY insurance_type;

##Peak Admission Hour
SELECT HOUR(admission_time) AS hour, COUNT(*) AS cases
FROM admission
GROUP BY HOUR(admission_time)
ORDER BY cases DESC;

##Department Workload
SELECT department, COUNT(*) AS workload
FROM admission
GROUP BY department
ORDER BY workload DESC;

##ICU Usage Count
SELECT SUM(icu_used) AS icu_cases
FROM resources;

