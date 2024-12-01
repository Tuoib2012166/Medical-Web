const db = require('../db');

function formatQuery(query, params) {
    return query.replace(/\?/g, () => params.shift());
}

exports.getMedicalRecords = async (req, res) => {
    const { patientId, doctorId } = req.query;
    try {
        // let query = `
        //     SELECT
        //         medical_records.id,
        //         patients.id AS patient_id,
        //         b.fullname AS patient_name,
        //         patients.address,
        //         patients.phone,
        //         CASE
        //             WHEN medical_records.gender = 'male' THEN 'Nam'
        //             WHEN medical_records.gender = 'female' THEN 'Nữ'
        //             ELSE 'Khác'
        //         END AS gender,
        //         patients.birth_year,
        //         doctors.id AS doctor_id,
        //         doctors.fullname AS doctor_name,
        //         specialties.name AS specialty_name,
        //         medical_records.diagnosis,
        //         medical_records.treatment,
        //         medical_records.record_date,
        //         medical_records.treatment AS service_name,
        //         medical_records.quantity,
        //         medical_records.unit_price,
        //         medical_records.total_price,
        //         medical_records.prescription
        //         -- medical_records.services
        //     FROM medical_records
        //         left JOIN patients ON medical_records.patient_id = patients.id
        //         left JOIN doctors ON medical_records.doctor_id = doctors.id
        //         left JOIN specialties ON doctors.specialty = specialties.id
        //         LEFT JOIN booking_appointments b ON b.user_id = patients.id
        //     WHERE TRUE
        // `;


        let query = `select 

        m.id,
        m.patient_id,
        appt.fullname as patient_name,
        appt.address,
        appt.phone,
        CASE
            WHEN m.gender = 'male' THEN 'Nam'
            WHEN m.gender = 'female' THEN 'Nữ'
            ELSE 'Khác'
        END AS gender,
        appt.birth_year,
        d.id AS doctor_id,
        d.fullname AS doctor_name,
        sp.name AS specialty_name,
        m.diagnosis,
        m.treatment,
        m.record_date,
        m.services,
        m.prescription,
        m.appointment_id

        from medical_records m
        join booking_appointments appt on appt.id = m.appointment_id
        join doctors d ON m.doctor_id = d.id
        left JOIN specialties sp ON d.specialty = sp.id
        where true
        `
        if (patientId) {
            query += ` AND m.patient_id=${patientId}`
        }

        if (doctorId) {
            query += ` AND m.doctor_id=${doctorId}`
        }

       
        const [medicalRecords] = await db.query(query);
        return res.status(200).json(medicalRecords);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch medical records' });
    }
};


exports.addMedicalRecord = async (req, res) => {
    const {
        patient_id, doctor_id, diagnosis, treatment,
        record_date, address, phone, gender, birth_year,
        specialty, service, quantity, unit_price,
        total_price, prescription, services, appointment_id
    } = req.body;

    console.log('Record Date:', record_date);

    const date = new Date(record_date);
    if (isNaN(date.getTime())) {
        return res.status(400).json({ error: 'Invalid date format' });
    }

    const formattedDate = date.toISOString().slice(0, 19).replace('T', ' ');

    try {
        const query = `
            INSERT INTO medical_records (
                patient_id, doctor_id, diagnosis, treatment,
                record_date, address, phone, gender, birth_year,
                specialty, service, quantity, unit_price,
                total_price, prescription, appointment_id,
                services
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const params = [
            patient_id, doctor_id, diagnosis, treatment,
            formattedDate, address, phone, gender, birth_year,
            specialty, service, quantity, unit_price,
            total_price, prescription, appointment_id, JSON.stringify(services)
        ];

        console.log('Executing query:', query, params);
        await db.query(query, params);
        return res.status(200).json({ message: 'Medical record added successfully' });
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
