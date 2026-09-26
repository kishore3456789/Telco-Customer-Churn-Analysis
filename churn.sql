CREATE DATABASE telco_analysis;
USE telco_analysis;

CREATE TABLE telco_churn (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(20),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

SELECT COUNT(*) AS total_rows
FROM `wa_fn-usec_-telco-customer-churn`;
SHOW TABLES;
SHOW DATABASES;

RENAME TABLE `wa_fn-usec_-telco-customer-churn`
TO telco1_churn;

DROP TABLE telco_churn;

SELECT COUNT(*) AS total_rows
FROM telco1_churn;


# OVERALL CHURN RATE

SELECT Churn, COUNT(*) AS customers
FROM telco1_churn
GROUP BY Churn;

# Churn by Contract

SELECT Contract, Churn, COUNT(*) AS customers
FROM telco1_churn
GROUP BY Contract, Churn;


# Churn by Internet Service

SELECT InternetService, Churn, COUNT(*) AS customers
FROM telco1_churn
GROUP BY InternetService, Churn;


# Churn by Payment Method

SELECT PaymentMethod, Churn, COUNT(*) AS customers
FROM telco1_churn
GROUP BY PaymentMethod, Churn;


#  Churn by Tech Support

SELECT TechSupport, Churn, COUNT(*) AS customers
FROM telco1_churn
GROUP BY TechSupport, Churn;


# Churn by Tenure

SELECT Churn, AVG(tenure) AS average_tenure
FROM telco1_churn
GROUP BY Churn;

# Customer & Revenue Analysis

SELECT Churn,
       COUNT(*) AS customers,
       AVG(MonthlyCharges) AS average_monthly_charge
FROM telco1_churn
GROUP BY Churn;