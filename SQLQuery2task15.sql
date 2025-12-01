-- 1) SELECT – Retrieve all columns from Doctors
SELECT * FROM Doctors;

-- 2) ORDER BY – List patients in ascending order of their ages
SELECT * FROM Patients
ORDER BY Age ASC;

-- 3) OFFSET FETCH – Retrieve the first 10 patients starting from the 5th record
SELECT * FROM Patients
ORDER BY UR_Number
OFFSET 4 ROWS
FETCH NEXT 10 ROWS ONLY;

-- 4) SELECT TOP – Retrieve the top 5 doctors
SELECT TOP 5 * FROM Doctors;

-- 5) SELECT DISTINCT – Get a list of unique addresses from Patients
SELECT DISTINCT Address FROM Patients;

-- 6) WHERE – Retrieve patients older than 30
SELECT * FROM Patients
WHERE Age > 30;

-- 7) INSERT – Add a new patient
INSERT INTO Patients (UR_Number, Name, Address, Age, Email, Phone, MedicareCardNumber, DoctorID)
VALUES (101, 'Ahmed Ali', 'Cairo', 28, 'ahmed@example.com', '0123456789', 'MC12345', 1);

-- 8) UPDATE – Update the age of a specific patient
UPDATE Patients
SET Age = 29
WHERE UR_Number = 101;

-- 9) DELETE – Remove a specific patient
DELETE FROM Patients
WHERE UR_Number = 101;

-- 10) INNER JOIN – Retrieve patient names along with their doctor names
SELECT Patients.Name AS PatientName, Doctors.Name AS DoctorName
FROM Patients
INNER JOIN Doctors
ON Patients.DoctorID = Doctors.DoctorID;

-- 11) LEFT JOIN – Retrieve all patients and their doctor names (if any)
SELECT Patients.Name AS PatientName, Doctors.Name AS DoctorName
FROM Patients
LEFT JOIN Doctors
ON Patients.DoctorID = Doctors.DoctorID;

-- 12) GROUP BY – Count patients by age
SELECT Age, COUNT(*) AS TotalPatients
FROM Patients
GROUP BY Age;

-- 13) HAVING – Filter groups (e.g., ages with more than 2 patients)
SELECT Age, COUNT(*) AS TotalPatients
FROM Patients
GROUP BY Age
HAVING COUNT(*) > 2;

-- 14) LIKE – Search patients by name pattern
SELECT * FROM Patients
WHERE Name LIKE 'A%';  -- Names starting with 'A'

-- 15) BETWEEN – Retrieve patients within a specific age range
SELECT * FROM Patients
WHERE Age BETWEEN 20 AND 40;

-- 16) JOIN Prescriptions with Patients and Doctors
SELECT P.Name AS PatientName, D.Name AS DoctorName, PR.TradeName, PR.Strength, PR.Date, PR.Quantity
FROM Prescriptions PR
INNER JOIN Patients P ON PR.UR_Number = P.UR_Number
INNER JOIN Doctors D ON PR.DoctorID = D.DoctorID;

-- 17) JOIN Prescriptions with Drugs
SELECT PR.TradeName, PR.Strength, DC.CompanyName, DC.Address
FROM Prescriptions PR
INNER JOIN Drugs DR ON PR.TradeName = DR.TradeName AND PR.Strength = DR.Strength
INNER JOIN PharmaceuticalCompanies DC ON DR.CompanyName = DC.CompanyName;
-- 18) INSERT INTO Drugs – Add a new drug
INSERT INTO PharmaceuticalCompanies (CompanyName, Address, PhoneNumber)
VALUES ('PharmaTech', '123 Nile St, Cairo', '01122334455');

INSERT INTO Drugs (TradeName, Strength, CompanyName)
VALUES ('Paracetamol', '500mg', 'PharmaTech');

-- 19) INSERT INTO Prescriptions – Add a new prescription
INSERT INTO Prescriptions (UR_Number, DoctorID, TradeName, Strength, Date, Quantity)
VALUES (101, 1, 'Paracetamol', '500mg', '2025-12-01', 10);

-- 20) SELECT – Retrieve all prescriptions with patient and doctor details
SELECT PR.Date, P.Name AS PatientName, D.Name AS DoctorName, PR.TradeName, PR.Strength, PR.Quantity
FROM Prescriptions PR
INNER JOIN Patients P ON PR.UR_Number = P.UR_Number
INNER JOIN Doctors D ON PR.DoctorID = D.DoctorID;

-- 21) SELECT – Retrieve all drugs and their company info
SELECT DR.TradeName, DR.Strength, DC.CompanyName, DC.Address, DC.PhoneNumber
FROM Drugs DR
INNER JOIN PharmaceuticalCompanies DC ON DR.CompanyName = DC.CompanyName;

-- 22) UPDATE – Update quantity in a prescription
UPDATE Prescriptions
SET Quantity = 20
WHERE UR_Number = 101 AND DoctorID = 1 AND TradeName = 'Paracetamol' AND Strength = '500mg' AND Date = '2025-12-01';

-- 23) DELETE – Remove a prescription
DELETE FROM Prescriptions
WHERE UR_Number = 101 AND DoctorID = 1 AND TradeName = 'Paracetamol' AND Strength = '500mg' AND Date = '2025-12-01';

-- 24) GROUP BY – Count prescriptions per doctor
SELECT DoctorID, COUNT(*) AS TotalPrescriptions
FROM Prescriptions
GROUP BY DoctorID;

-- 25) HAVING – Doctors with more than 5 prescriptions
SELECT DoctorID, COUNT(*) AS TotalPrescriptions
FROM Prescriptions
GROUP BY DoctorID
HAVING COUNT(*) > 5;

-- 26) JOIN – List patients with the drugs they have been prescribed
SELECT P.Name AS PatientName, PR.TradeName, PR.Strength, PR.Date, PR.Quantity
FROM Patients P
INNER JOIN Prescriptions PR ON P.UR_Number = PR.UR_Number;
-- 27) JOIN – List all prescriptions with patient, doctor, and drug company info
SELECT P.Name AS PatientName, D.Name AS DoctorName, PR.TradeName, PR.Strength, DC.CompanyName
FROM Prescriptions PR
INNER JOIN Patients P ON PR.UR_Number = P.UR_Number
INNER JOIN Doctors D ON PR.DoctorID = D.DoctorID
INNER JOIN Drugs DR ON PR.TradeName = DR.TradeName AND PR.Strength = DR.Strength
INNER JOIN PharmaceuticalCompanies DC ON DR.CompanyName = DC.CompanyName;

-- 28) LIKE – Search for drugs with a specific pattern in TradeName
SELECT * FROM Drugs
WHERE TradeName LIKE 'P%';  -- Drugs starting with 'P'

-- 29) BETWEEN – Retrieve prescriptions within a date range
SELECT * FROM Prescriptions
WHERE Date BETWEEN '2025-12-01' AND '2025-12-31';

-- 30) ORDER BY – List prescriptions ordered by Date descending
SELECT * FROM Prescriptions
ORDER BY Date DESC;
