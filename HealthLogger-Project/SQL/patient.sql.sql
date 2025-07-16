INSERT INTO patient (name, email, phone, age, gender, diagnosis, remarks) VALUES
('John Doe', 'johndoe@example.com', '9876543210', 35, 'Male', 'Hypertension', 'Requires daily monitoring');

INSERT INTO patient (name, email, phone, age, gender, diagnosis, remarks) VALUES
('Praneetha', 'praneethajaJ@gmail.com', '909089066', 23, 'Female', 'Mouth ulcer', 'Negligence');

INSERT INTO patient (name, email, phone, age, gender, diagnosis, remarks) VALUES
('Krishna', 'krishna@gmail.com', '9080908070', 33, 'Male', 'Severe Backpain', 'Require Daily medication');

INSERT INTO patient (name, email, phone, age, gender, diagnosis, remarks) VALUES
('Prem', 'prems@gmail.com', '8989877656', 44, 'Male', 'Sugar', 'Requires insulin');

INSERT INTO patient (name, email, phone, age, gender, diagnosis, remarks) VALUES
('ram', 'ram22@gmail.com', '7890654567', 22, 'Male', 'Severe Headache', 'Require daily medication');
-- Option 2: Ignore it if already inserted
SELECT * FROM patient;
commit;
