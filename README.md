# ADW-2017

![Teradata](https://img.shields.io/badge/Teradata-F37440?style=for-the-badge&logo=teradata&logoColor=white)
![data-warehouse](https://img.shields.io/badge/Data_Warehouse-%23E57373?style=for-the-badge&logo=cloud&logoColor=white)
![ETL](https://img.shields.io/badge/ETL-%2381C784?style=for-the-badge&logo=cloud&logoColor=white)

### **Overview**  
This architecture centralizes data from diverse sources into a data warehouse, enabling efficient querying and reporting. The key components are:- 
- **ETL Processes**: Automated workflows for data extraction, transformation, and loading.  
- **Data Modeling**: Dimensional models designed for optimized data retrieval and reporting.
- **Data Integration**: Harmonizing diverse data formats and ensuring consistency across systems.
  
### **ETL Processes**  
The ETL processes utilize **Teradata BTEQ** (Basic Teradata Query) for:  
- **Data Cleansing**: Ensuring data quality by removing duplicates and inconsistencies.  
- **Transformation Logic**: Applying business rules to transform raw data into meaningful information.  
- **Data Loading**: Transferring processed data into the data warehouse.  


### **ETL Implementation**  
The ETL pipeline employs Teradata BTEQ scripts for streamlined data management. Key responsibilities include:
- Mapping raw data from CSV files into a normalized relational schema, ensuring efficient storage and retrieval.
- Applying transformation logic and business rules to adapt the data to the warehouse schema.
- Validating data integrity at each stage to maintain quality.
- Leveraging Teradata FastLoad for rapid ingestion of large datasets during the initial load process.

## Technologies Used  
- **Teradata Studio**: Core ETL scripting tool for data extraction, transformation, and loading.  
- **Teradata BTEQ**: Core ETL scripting tool for data extraction, transformation, and loading.  
- **Teradata FastLoad**: Specialized utility for rapid loading of large datasets into the database.  


![LMu4W](https://github.com/Redgerd/ADW-2017/assets/117646793/226ebe9c-a632-4875-8c95-161813f148f7)
