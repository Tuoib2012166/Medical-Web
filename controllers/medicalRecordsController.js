const db = require('../db');

function formatQuery(query, params) {
    return query.replace(/\?/g, () => params.shift());
}

exports.getMedicalRecords = async (req, res) => {
    try {
        const query = `
            SELECT
                medical_records.id,
                patients.fullname AS patient_name,
                doctors.id AS doctor_id,
                doctors.fullname AS doctor_name,
                medical_records.diagnosis,
                medical_records.treatment,
                medical_records.record_date
            FROM medical_records
                     JOIN patients ON medical_records.patient_id = patients.id
                     JOIN doctors ON medical_records.doctor_id = doctors.id
        `;
        console.log('Executing query:', query);

        const [medicalRecords,] = await db.query(query);
        console.log('Query result:', medicalRecords);

        // Parse the services field from JSON string to array
        // medicalRecords.forEach(record => {
        //     record.services = JSON.parse(record.services);
        // });

        res.json(medicalRecords);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch medical records' });
    }
};

exports.addMedicalRecord = async (req, res) => {
    const { patient_id, doctor_id, diagnosis, treatment } = req.body;
    console.log('Received data:', { patient_id, doctor_id, diagnosis, treatment });
    try {
        const query = 'INSERT INTO medical_records (patient_id, doctor_id, diagnosis, treatment) VALUES (?, ?, ?, ?)';
        const params = [patient_id, doctor_id, diagnosis, treatment];
        console.log('Executing query:', formatQuery(query, [...params]));

        await db.query(query, params);
        return res.json({ message: 'Medical record added successfully' });
    } catch (error) {
        console.error('Error adding medical record:', error);
        res.status(500).json({ error: 'Failed to add medical record', details: error.message });
    }
};

exports.updateMedicalRecord = async (req, res) => {
    const { id } = req.params;
    const { patient_id, doctor_id, diagnosis, treatment, record_date } = req.body;
    try {
        const query = 'UPDATE medical_records SET patient_id = ?, doctor_id = ?, diagnosis = ?, treatment = ?, record_date = ? WHERE id = ?';
        const params = [patient_id, doctor_id, diagnosis, treatment, record_date, id];
        console.log('Executing query:', formatQuery(query, [...params]));
        await db.query(query, params);
        return res.json({ message: 'Medical record updated successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to update medical record' });
    }
};

exports.deleteMedicalRecord = async (req, res) => {
    const { id } = req.params;
    try {
        const query = 'DELETE FROM medical_records WHERE id = ?';
        const params = [id];
        console.log('Executing query:', formatQuery(query, [...params]));

        await db.query(query, params);
        res.json({ message: 'Medical record deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete medical record' });
    }
};