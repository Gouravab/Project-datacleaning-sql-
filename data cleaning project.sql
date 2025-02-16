-- Data cleaning

SELECT *
FROM layoffs;

CREATE TABLE layoff_stage
LIKE layoffs;

SELECT*
FROM layoff_stage;

INSERT layoff_stage
SELECT *
FROM layoffs;


SELECT*,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off,percentage_laid_off, 'date')AS row_num
FROM layoff_stage;

WITH duplicate_cte AS (
SELECT*,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, 'date', country, funds_raised_millions)AS row_num
FROM layoff_stage)
 
 SELECT*
 FROM duplicate_cte
 WHERE row_num>1; 
 
 CREATE TABLE `layoff_stage3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 	

SELECT*
FROM layoff_stage3;

INSERT INTO layoff_stage3
SELECT*,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, 'date', country, funds_raised_millions)AS row_num
FROM layoff_stage;

DELETE
 FROM layoff_stage3
WHERE row_num >1;

SET SQL_SAFE_UPDATES = 0;

SELECT company,(TRIM(COMPANY)) 
FROM layoff_stage3;

UPDATE layoff_stage3
SET company= TRIM(COMPANY);

SELECT DISTINCT industry
FROM layoff_stage3
ORDER BY 1;


select*
FROM layoff_stage3
WHERE industry LIKE 'crypto%';

UPDATE layoff_stage3
SET industry='crypto'
where industry like 'crypto%';

SELECT DISTINCT location, coutry
FROM layoff_stage3
ORDER BY 1;

UPDATE layoff_stage3
SET industry='crypto'
where industry like 'crypto%';

SELECT DISTINCT country, trim(TRAILING '.' FROM Country)
FROM layoff_stage3
ORDER BY 1; 

UPDATE layoff_stage3
SET country=trim(TRAILING '.' FROM Country)
where country like 'United States%';


SELECT `date`,
str_to_date(`date`,'%m/%d/%Y')
FROM layoff_stage3;

ALTER TABLE layoff_stage3
MODIFY COLUMN `date` DATE;

SELECT*
FROM layoff_stage3
WHERE total_laid_off;

select *
from layoff_stage3
where industry is NuLL
or industry = '';


SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL;


SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Delete Useless data we can't really use
DELETE FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM world_layoffs.layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


SELECT * 
FROM world_layoffs.layoffs_staging2;









 
 
 
 
