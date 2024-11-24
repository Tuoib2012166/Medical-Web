const db = require('../db');

function formatQuery(query, params) {
    return query.replace(/\?/g, () => params.shift());
}

exports.getMedicalRecords = async (req, res) => {
    try {
        const query = `
            SELECT
                medical_records.id,
                patients.id AS patient_id,
                patients.fullname AS patient_name,
                patients.address,
                patients.phone,
                CASE
                    WHEN medical_records.gender = 'male' THEN 'Nam'
                    WHEN medical_records.gender = 'female' THEN 'Nữ'
                    ELSE 'Khác'
                END AS gender,
                patients.birth_year,
                doctors.id AS doctor_id,
                doctors.fullname AS doctor_name,
                specialties.name AS specialty_name,
                medical_records.diagnosis,
                medical_records.treatment,
                medical_records.record_date,
                services.name AS service_name,
                medical_records.quantity,
                medical_records.unit_price,
                medical_records.total_price,
                medical_records.prescription
            FROM medical_records
                JOIN patients ON medical_records.patient_id = patients.id
                JOIN doctors ON medical_records.doctor_id = doctors.id
                JOIN specialties ON doctors.specialty = specialties.id
                JOIN services ON medical_records.service = services.id
        `;
        const [medicalRecords] = await db.query(query);
        res.json(medicalRecords);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch medical records' });
    }
};


exports.addMedicalRecord = async (req, res) => {
    const {
        patient_id, doctor_id, diagnosis, treatment,
        record_date, address, phone, gender, birth_year,
        specialty, service, quantity, unit_price,
        total_price, prescription
    } = req.body;

    const date = new Date(record_date);

    const formattedDate = date.toISOString().slice(0, 19).replace('T', ' ');
    try {
        const query = `
            INSERT INTO medical_records (
                patient_id, doctor_id, diagnosis, treatment,
                record_date, address, phone, gender, birth_year,
                specialty, service, quantity, unit_price,
                total_price, prescription
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const params = [
            patient_id, doctor_id, diagnosis, treatment,
            formattedDate, address, phone, gender, birth_year,
            specialty, service, quantity, unit_price,
            total_price, prescription
        ];

        console.log('Executing query:', query, params);

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
