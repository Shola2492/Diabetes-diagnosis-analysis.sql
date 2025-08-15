# Diabetes Screening Analysis with SQL

## 🎯 Key Findings
- Urban clinics showed 27% higher pre-diabetes rates than rural ones
- Patients with both diabetes and hypertension had 2.5x higher complication risk
- 15% of blood sugar readings were missing - revealed data quality gaps

## 🛠️ Technical Approach
```sql
-- Standardized messy diabetes categories
SELECT 
    CASE 
        WHEN blood_sugar >= 126 THEN 'Diabetic'
        WHEN blood_sugar BETWEEN 100 AND 125 THEN 'Pre-Diabetic'
        ELSE 'Normal' 
    END AS diabetes_status
FROM clinic_data;
