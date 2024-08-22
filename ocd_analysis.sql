# Viewing the dataset
SELECT * FROM ocd.ocd_data
LIMIT 5;

# Total number of patients recorded
SELECT COUNT(*) AS total_count FROM ocd_data;

# Count and percentages of Males vs Females and average score by gender
WITH total_counts AS (
    SELECT COUNT(*) AS total_count FROM ocd_data
) # The WITH Common table expression calculates the total number of patients in datasets
SELECT 
  Gender, # Retrieves the Gender column
  COUNT(Patient_ID) AS patient_count, # Counts the number of patients for each gender
  (COUNT(Patient_ID) / total_counts.total_count) * 100 AS percentage, # Calculates the percentage of each gender. total_counts.total_count is used to access the total number of patients in the CTE
  AVG(YBOCS_Score_Obsessions) AS avg_obs_score # Calculates the average obsession score
FROM 
  ocd_data, total_counts
GROUP BY 
  Gender, total_counts.total_count # Groups the results by gender and includes total_counts.total_count in the GROUP BY clause to comply with the ONLY_FULL_GROUP_BY SQL mode.. 
ORDER BY 
  patient_count; # Orders by patient count in ascending order


# Count of Patients by Ethnicity and their respective Average Obsession Score
SELECT Ethnicity, COUNT(Patient_ID) AS patient_count, AVG(YBOCS_Score_Obsessions) as avg_obs_score
FROM ocd_data
GROUP BY Ethnicity
ORDER BY patient_count;


# Number of people diagnosed with OCD each day
SELECT OCD_Diagnosis_Date as date, count(Patient_ID) as patient_count
FROM ocd_data
GROUP BY date
ORDER BY date; 

# What is the most common Obsession Type (Count) & it's respective Average Obsession Score
SELECT Obsession_Type, COUNT(Patient_ID) as patient_count, 
AVG(YBOCS_Score_Obsessions) as avg_obs_score
FROM ocd_data
GROUP BY Obsession_Type
ORDER BY patient_count;


# What is the most common Compulsion type (Count) & it's respective Average Obsession Score
SELECT Compulsion_Type, COUNT(Patient_ID) as patient_count, 
AVG(YBOCS_Score_Compulsions) as avg_comp_score
FROM ocd_data
GROUP BY Compulsion_Type
ORDER BY patient_count;

SELECT *
FROM ocd_data
LIMIT 5;

