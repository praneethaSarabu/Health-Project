CREATE OR REPLACE PROCEDURE log_vitals (
  p_patient_id IN NUMBER,
  p_bp_high    IN NUMBER,
  p_bp_low     IN NUMBER,
  p_spo2       IN NUMBER
)
AS
BEGIN
  INSERT INTO vitals (patient_id, bp_high, bp_low, spo2, recorded_on)
  VALUES (p_patient_id, p_bp_high, p_bp_low, p_spo2, SYSDATE);
END;
/
