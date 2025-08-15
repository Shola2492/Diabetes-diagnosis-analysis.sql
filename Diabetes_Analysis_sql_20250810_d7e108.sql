-- diabetes_analysis.sql
-- Basic diabetes screening data analysis for public health

-- 1. PATIENTS BY DIABETES STATUS
SELECT 
    diabetes_status,
    COUNT(*) AS patient_count
FROM 
    clinic_patients
GROUP BY 
    diabetes_status;

-- 2. AVERAGE BLOOD SUGAR BY AGE GROUP
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    ROUND(AVG(blood_sugar_level), 1) AS avg_glucose
FROM 
    patient_labs
GROUP BY 
    age_group
ORDER BY 
    avg_glucose DESC;

-- 3. HIGH-RISK PATIENTS (DIABETES + HYPERTENSION)
SELECT 
    COUNT(*) AS high_risk_count
FROM 
    patient_history
WHERE 
    has_diabetes = 1 
    AND has_hypertension = 1;

-- 4. SCREENING RESULTS BY CLINIC
SELECT 
    clinic_name,
    COUNT(*) AS patients_screened,
    SUM(CASE WHEN diabetes_status = 'Pre-Diabetic' THEN 1 ELSE 0 END) AS pre_diabetic,
    SUM(CASE WHEN diabetes_status = 'Diabetic' THEN 1 ELSE 0 END) AS diabetic
FROM 
    screening_program
GROUP BY 
    clinic_name;