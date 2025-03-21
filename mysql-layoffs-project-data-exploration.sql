


-- Data exploration




SELECT * 
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY  funds_raised_millions desc ;

SELECT company , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY  company 
ORDER BY 2 DESC ;



SELECT MIN(date), MAX(date)
FROM layoffs_staging2;


SELECT industry , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY  industry 
ORDER BY 2 DESC ;

SELECT YEAR(date) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 DESC ;



SELECT substring(date ,6,2) as Months , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY months 
order by 2 DESC
;


WITH rolling_total_cte as (
	SELECT substring(date ,1,7) as Months , SUM(total_laid_off) as Total_l_off
	FROM layoffs_staging2
    WHERE substring(date ,1,7) IS NOT NULL
	GROUP BY months 
	order by 1 DESC
)
SELECT months , SUM(total_l_off) over(order by MONTHS) AS rolling_total
FROM Rolling_total_cte;



SELECT * 
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

SELECT substring(date ,1,7) as Months , SUM(total_laid_off) as Total_l_off
	FROM layoffs_staging2
    WHERE substring(date ,1,7) IS NOT NULL
	GROUP BY months 
	order by 1 DESC


WITH rolling_total_cte as (
	SELECT substring(date ,1,7) as Months , SUM(total_laid_off) as Total_l_off
	FROM layoffs_staging2
    WHERE substring(date ,1,7) IS NOT NULL
	GROUP BY months 
	order by 1 asc
)
SELECT months,
        Total_l_off,
        SUM(total_l_off) over(order by MONTHS) AS rolling_total
FROM Rolling_total_cte ;



SELECT company, YEAR(date) , SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY company , YEAR(date)
ORDER BY 3 DESC ;






WITH company_year  ( company , years , total_laid_off) AS(
    SELECT company, YEAR(date) , SUM(total_laid_off)
    FROM layoffs_staging2 
    GROUP BY company , YEAR(date)
), company_year_rank AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS D_RANK
    FROM company_year 
    WHERE years IS NOT NULL
)
SELECT * 
FROM company_year_rank 
 ;











