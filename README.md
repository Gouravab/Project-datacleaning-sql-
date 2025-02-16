# Layoff Data Cleaning Project  

## 📌 Project Overview  
This project focuses on **cleaning and preprocessing layoff data** to ensure accuracy, consistency, and usability for further analysis. The dataset contains records of company layoffs, including details like company name, location, industry, total layoffs, and funding. The data was cleaned using **SQL** to remove duplicates, standardize formats, and fix inconsistencies.  

## 🗂 Dataset  
The dataset includes the following key columns:  
- `company` – Name of the company  
- `location` – Company location  
- `industry` – Industry sector  
- `total_laid_off` – Number of employees laid off  
- `percentage_laid_off` – Percentage of workforce laid off  
- `date` – Layoff date  
- `stage` – Growth stage of the company  
- `country` – Country of the company  
- `funds_raised_millions` – Funds raised by the company  

## 🔍 Data Cleaning Steps  

### **1️⃣ Removing Duplicates**  
- Created a staging table `layoff_stage` for processing.  
- Used `ROW_NUMBER()` to identify duplicate records based on **company, location, industry, layoffs, and funding**.  
- Deleted duplicate records to retain only the first occurrence.  

### **2️⃣ Trimming and Standardizing Text Data**  
- Removed **leading/trailing spaces** from `company` names.  
- Standardized **industry names** (e.g., converting `crypto%` to `crypto`).  
- Fixed **country names** (e.g., removing trailing dots from `United States.`).  

### **3️⃣ Date Format Standardization**  
- Converted `date` from **text format** to a proper **DATE type** using `STR_TO_DATE()`.  
- Altered the column type in `layoff_stage3` to store **date values correctly**.  

### **4️⃣ Handling Missing Values**  
- Checked for `NULL` values in `industry` and `total_laid_off`.  
- Removed records where both `total_laid_off` and `percentage_laid_off` were `NULL` (considered as unusable data).  

### **5️⃣ Schema Optimization**  
- Dropped unnecessary columns like `row_num` after removing duplicates.  
- Ensured all transformations were applied to `layoff_stage3`, which serves as the final cleaned dataset.  

## 🛠 Tools Used  
- **SQL (MySQL)**  
- **MySQL Workbench**  

## 📊 Final Output  
After performing all cleaning operations, the dataset is now:  
✅ Free from duplicates  
✅ Standardized in formatting  
✅ Ready for further analysis  

## 🚀 How to Use  
1. Clone this repository or copy the SQL scripts.  
2. Run the SQL queries in **MySQL Workbench** or any SQL client.  
3. Use the cleaned `layoff_stage3` table for analysis.  

---

## 💡 Future Improvements  
🔹 Further validation checks for incorrect entries.  
🔹 Automating the cleaning process using **stored procedures**.  
🔹 Exploring **data visualization** for deeper insights.  

📩 **Questions? Suggestions?** Feel free to reach out! 😊  
