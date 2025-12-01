CREATE DATABASE PrescriptionSystem;
USE PrescriptionSystem;



-------------------------------------------------
-- 1) CREATE BASE TABLES FIRST (NO FOREIGN KEYS)
-------------------------------------------------

CREATE TABLE Doctors (
    DoctorID            INT PRIMARY KEY,
    Name                VARCHAR(100),
    Phone               VARCHAR(20),
    Specialty           VARCHAR(100),
    Years_of_Experience INT,
    Email               VARCHAR(100)
);

CREATE TABLE PharmaceuticalCompanies (
    CompanyName   VARCHAR(100) PRIMARY KEY,
    Address       VARCHAR(200),
    PhoneNumber   VARCHAR(20)
);

CREATE TABLE Drugs (
    TradeName     VARCHAR(100),
    Strength      VARCHAR(50),
    CompanyName   VARCHAR(100),
    PRIMARY KEY (TradeName, Strength),
    FOREIGN KEY (CompanyName) REFERENCES PharmaceuticalCompanies(CompanyName)
);

CREATE TABLE Patients (
    UR_Number        INT PRIMARY KEY,
    Name             VARCHAR(100),
    Address          VARCHAR(200),
    Age              INT,
    Email            VARCHAR(100),
    Phone            VARCHAR(20),
    MedicareCardNumber VARCHAR(50),
    DoctorID         INT
);

CREATE TABLE Prescriptions (
    UR_Number    INT,
    DoctorID     INT,
    TradeName    VARCHAR(100),
    Strength     VARCHAR(50),
    Date         DATE,
    Quantity     INT,
    PRIMARY KEY (UR_Number, DoctorID, TradeName, Strength, Date)
);

-------------------------------------------------
-- 2)  ADD FOREIGN KEYS 
-------------------------------------------------

ALTER TABLE Patients
ADD CONSTRAINT fk_patient_doctor
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID);

ALTER TABLE Prescriptions
ADD CONSTRAINT fk_prescription_patient
FOREIGN KEY (UR_Number) REFERENCES Patients(UR_Number);

ALTER TABLE Prescriptions
ADD CONSTRAINT fk_prescription_doctor
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID);

ALTER TABLE Prescriptions
ADD CONSTRAINT fk_prescription_drug
FOREIGN KEY (TradeName, Strength) REFERENCES Drugs(TradeName, Strength);
