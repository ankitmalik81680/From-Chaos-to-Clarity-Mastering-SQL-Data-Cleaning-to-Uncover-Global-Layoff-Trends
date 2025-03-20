# PortfolioProjects-

Data Cleaning Portfolio Project: Layoffs
Cleaned and preprocessed a layoffs dataset using SQL, addressing duplicates, standardizing entries, and handling missing values. Transformed raw data into a reliable foundation for analyzing global workforce trends

🔍 **Project Overview**  
Performed comprehensive data cleaning on a layoffs dataset using SQL, ensuring data integrity for analysis. Key steps included:  

- Duplicate Removal: Utilized `ROW_NUMBER()` with partitions to identify and delete duplicates in a staging table.  
- Standardization: Trimmed whitespace, consolidated industries (e.g., "Crypto"), corrected country names, and converted text dates to `DATE` format.  
- Null Handling: Addressed missing `industry` values via self-joins and removed rows with incomplete layoff metrics.  
- Schema Optimization: Dropped redundant columns and ensured consistent data types.  

📌 Skills Highlighted**  
- SQL techniques: CTEs, window functions, string manipulation, self-joins, and schema modification.  
- Attention to detail in data validation and transformation.  

💡 Impact  
Transformed raw data into a clean, analysis-ready dataset, enabling accurate insights into global layoff trends.  

Code available in this repository.
