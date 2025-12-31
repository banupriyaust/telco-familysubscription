/*
    TELECOM BI PROJECT: FAMILY PLAN ANALYSIS
    Created for Tech Talk Jan 2025
*/

-- ============================================================
-- DATABASE SETUP
-- ============================================================

CREATE DATABASE Telecom_DWH;
GO

USE Telecom_DWH;
GO

-- ============================================================
-- DIMENSION TABLES
-- ============================================================

CREATE TABLE DimCustomer (
    CustomerKey     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID      VARCHAR(10) NOT NULL,
    FullName        VARCHAR(100) NOT NULL,
    FamilyID        INT,                          -- Groups family members
    PlanType        VARCHAR(20) NOT NULL          -- 'Family' or 'Individual'
);
GO

-- ============================================================
-- FACT TABLES
-- ============================================================

CREATE TABLE FactSales (
    SalesKey        INT IDENTITY(1,1) PRIMARY KEY,
    CustomerKey     INT NOT NULL,
    BaseRate        DECIMAL(10,2) NOT NULL,
    DiscountApplied DECIMAL(10,2) NOT NULL,
    FinalRevenue    DECIMAL(10,2) NOT NULL,
    SalesDate       DATE NOT NULL
);
GO

-- ============================================================
-- SAMPLE DATA INSERTION
-- ============================================================

-- Insert Customer Dimension Data
INSERT INTO DimCustomer (CustomerID, FullName, FamilyID, PlanType)
VALUES
    ('T101', 'Alice Johnson',   500, 'Family'),
    ('T102', 'Bob Johnson',     500, 'Family'),
    ('T103', 'Charlie Johnson', 500, 'Family'),
    ('T104', 'David Smith',       0, 'Individual');
GO

-- Insert Sales Fact Data
INSERT INTO FactSales (CustomerKey, BaseRate, DiscountApplied, FinalRevenue, SalesDate)
VALUES
    (1, 100.00, 20.00, 80.00, '2025-01-01'),
    (2, 100.00, 20.00, 80.00, '2025-01-01'),
    (3, 100.00, 20.00, 80.00, '2025-01-01'),
    (4, 100.00,  0.00, 100.00, '2025-01-01');
GO