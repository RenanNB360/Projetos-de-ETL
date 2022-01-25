-- -----------------------------------------------------
-- Create database
-- -----------------------------------------------------
CREATE DATABASE DW_Company

USE DW_Company

-- -----------------------------------------------------
-- Table Dim_Account
-- -----------------------------------------------------
CREATE TABLE Dim_Account (
  AccountKey INT NOT NULL,
  ParentAccountCodeAlternateKey INT NOT NULL,
  AccountDescription VARCHAR(50) NOT NULL,
  AccountType VARCHAR(50) NOT NULL,
  Operator VARCHAR(10) NOT NULL,
  ValueType VARCHAR(50) NOT NULL,
  PRIMARY KEY (AccountKey))


-- -----------------------------------------------------
-- Table Dim_Date
-- -----------------------------------------------------
CREATE TABLE Dim_Date (
  DateKey VARCHAR(10) NOT NULL,
  FullDateAlternateKey DATE NOT NULL,
  DayNumberOfWeek INT NOT NULL,
  EnglishDayNameOfWeek VARCHAR(50) NOT NULL,
  DayNumberOfMonth INT NOT NULL,
  EnglishMonthName VARCHAR(50) NOT NULL,
  MonthNumberOfYear INT NOT NULL,
  CalendarYear INT NOT NULL,
  PRIMARY KEY (DateKey))



-- -----------------------------------------------------
-- Table Dim_Department
-- -----------------------------------------------------
CREATE TABLE Dim_Department (
  DepartmentGroupKey INT NOT NULL,
  ParentDepartmentGroupKey INT NOT NULL,
  DepartmentGroupName VARCHAR(50) NOT NULL,
  PRIMARY KEY (DepartmentGroupKey))


-- -----------------------------------------------------
-- Table Dim_Organization
-- -----------------------------------------------------
CREATE TABLE Dim_Organization (
  OrganizationKey INT NOT NULL,
  PercentageOfOwnership INT NOT NULL,
  OrganizationName VARCHAR(50) NOT NULL,
  CurrencyKey INT NOT NULL,
  PRIMARY KEY (OrganizationKey))


-- -----------------------------------------------------
-- Table Dim_Scenario
-- -----------------------------------------------------
CREATE TABLE Dim_Scenario (
  ScenarioKey INT NOT NULL,
  ScenarioName VARCHAR(50) NOT NULL,
  PRIMARY KEY (ScenarioKey))


-- -----------------------------------------------------
-- Table Fact_Company
-- -----------------------------------------------------
CREATE TABLE Fact_Company (
  Dim_Department_DepartmentGroupKey INT NOT NULL,
  Dim_Account_AccountKey INT NOT NULL,
  Dim_Date_DateKey VARCHAR(10) NOT NULL,
  Dim_Scenario_ScenarioKey INT NOT NULL,
  Dim_Organization_OrganizationKey INT NOT NULL,
  Amount float NOT NULL,
  PRIMARY KEY (Dim_Department_DepartmentGroupKey, Dim_Account_AccountKey, Dim_Date_DateKey, Dim_Scenario_ScenarioKey, Dim_Organization_OrganizationKey),
    FOREIGN KEY (Dim_Department_DepartmentGroupKey) REFERENCES Dim_Department (DepartmentGroupKey),
    FOREIGN KEY (Dim_Account_AccountKey) REFERENCES Dim_Account (AccountKey),
    FOREIGN KEY (Dim_Date_DateKey) REFERENCES Dim_Date (DateKey),
    FOREIGN KEY (Dim_Scenario_ScenarioKey) REFERENCES Dim_Scenario (ScenarioKey),
    FOREIGN KEY (Dim_Organization_OrganizationKey) REFERENCES Dim_Organization (OrganizationKey))


