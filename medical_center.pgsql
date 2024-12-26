DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    specialty TEXT
);

INSERT INTO doctors (first_name, last_name, specialty) VALUES
('John', 'Doe', 'Cardiology'),
('Jane', 'Smith', 'Pediatrics');


CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    date_of_birth DATE,
    contact_info TEXT
);

INSERT INTO patients (first_name, last_name, date_of_birth, contact_info) VALUES
('Alice', 'Brown', '1980-05-15', '123-456-7890'),
('Bob', 'Davis', '1992-07-22', '987-654-3210');


CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

INSERT INTO diseases (name, description) VALUES
('Diabetes', 'A chronic condition affecting the body''s ability to produce insulin'),
('Hypertension', 'High blood pressure');


CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    patient_id INTEGER REFERENCES patients(patient_id),
    visit_date DATE
);

INSERT INTO visits (doctor_id, patient_id, visit_date) VALUES
(1, 1, '2024-12-15'),
(2, 2, '2024-12-16');


CREATE TABLE diagnoses (
    visit_id INTEGER REFERENCES visits(visit_id),
    disease_id INTEGER REFERENCES diseases(disease_id),
    PRIMARY KEY (visit_id, disease_id)
);

INSERT INTO diagnoses (visit_id, disease_id) VALUES
(1, 1),
(2, 2);