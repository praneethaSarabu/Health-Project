package com.health.dao;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.util.List;
import com.health.model.Vitals;
import com.health.dao.VitalsDAO;

public class VitalsDAOTest {

    @Test
    public void testInsertVitalsUsingProcedure() {
        Vitals v = new Vitals();
        v.setPatientId(1); // assuming patient with ID 1 exists
        v.setBpHigh(125);
        v.setBpLow(82);
        v.setSpo2(97);

        boolean result = VitalsDAO.addVitalsViaProcedure(v);
        assertTrue(result, "Vitals should be inserted via procedure");
    }

    @Test
    public void testGetAllVitals() {
        List<Vitals> vitalsList = VitalsDAO.getAllVitals();
        assertNotNull(vitalsList, "Vitals list should not be null");
        assertTrue(vitalsList.size() > 0, "Vitals list should contain at least one record");
    }

    @Test
    public void testGetVitalsByPatientId() {
        int patientId = 16; // Replace with your actual test patient ID
        List<Vitals> vitals = VitalsDAO.getVitalsByPatientId(patientId);
        assertNotNull(vitals, "Vitals list should not be null");
        assertFalse(vitals.isEmpty(), "Vitals list should not be empty for patient ID: " + patientId);
    }

    @Test
    public void testDeleteVitals() {
        // Step 1: Insert test record
        Vitals v = new Vitals();
        v.setPatientId(1); // existing patient
        v.setBpHigh(110);
        v.setBpLow(70);
        v.setSpo2(96);
        VitalsDAO.addVitalsViaProcedure(v);

        // Step 2: Get last inserted ID
        List<Vitals> allVitals = VitalsDAO.getAllVitals();
        int lastId = allVitals.get(0).getId(); // assuming descending order

        // Step 3: Delete that record
        boolean deleted = VitalsDAO.deleteVitalById(lastId);
        assertTrue(deleted, "Vitals record should be deleted");

        // Step 4: Re-fetch and confirm deletion
        List<Vitals> updatedList = VitalsDAO.getAllVitals();
        boolean exists = updatedList.stream().anyMatch(x -> x.getId() == lastId);
        assertFalse(exists, "Deleted vitals ID should no longer exist");
    }
}
