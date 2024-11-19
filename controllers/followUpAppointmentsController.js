const db = require('../db');

// Get all follow-up appointments
exports.getAllFollowUpAppointments = async (req, res) => {
    try {
        const sql = `
            SELECT
                f.id,
                f.patient_name as patient_id,
                f.follow_up_date,
                f.time,
                f.notes,
                f.doctor_id,
                d.fullname AS doctor_name,
                p.fullname AS patient_name
            FROM
                follow_up_appointments f
                    LEFT JOIN 
                doctors d ON f.doctor_id = d.id
                    LEFT JOIN
                patients p ON f.patient_name = p.id
        `;
        console.log('SQL Query:', sql);
        const [appointments,] = await db.query(sql);
        return res.json(appointments);
    } catch (error) {
        console.error('Error fetching follow-up appointments:', error);
        return res.status(500).json({ message: 'An error occurred while fetching follow-up appointments' });
    }
};

// Add a new follow-up appointment
exports.addFollowUpAppointment = async (req, res) => {
    const { patientName, followUpDate, time, notes, doctorId } = req.body;
    if (doctorId === undefined) {
        return res.status(400).json({ message: 'Doctor ID is required' });
    }
    try {
        const insertAppointmentSql = 'INSERT INTO follow_up_appointments (patient_name, follow_up_date, time, notes, doctor_id, created_at) VALUES (?, ?, ?, ?, ?, NOW())';
        console.log('SQL Query:', insertAppointmentSql);
        console.log('Request Data:', req.body);
        await db.execute(insertAppointmentSql, [patientName, followUpDate, time, notes, doctorId]);
        return res.status(200).json({ message: 'Follow-up appointment added successfully' });
    } catch (error) {
        console.error('Error adding follow-up appointment:', error);
        return res.status(500).json({ message: 'An error occurred while adding the follow-up appointment' });
    }
};

// Update an existing follow-up appointment
exports.updateFollowUpAppointment = async (req, res) => {
    const { id } = req.params;
    const { patientName, followUpDate, time, notes, doctorId } = req.body;
    try {
        const updateAppointmentSql = 'UPDATE follow_up_appointments SET patient_name = ?, follow_up_date = ?, time = ?, notes = ?, doctor_id = ? WHERE id = ?';
        console.log('SQL Query:', updateAppointmentSql);
        console.log('Request Data:', req.body);
        await db.execute(updateAppointmentSql, [patientName, followUpDate, time, notes, doctorId, id]);
        return res.status(200).json({ message: 'Follow-up appointment updated successfully' });
    } catch (error) {
        console.error('Error updating follow-up appointment:', error);
        return res.status(500).json({ message: 'An error occurred while updating the follow-up appointment' });
    }
};

// Delete a follow-up appointment
exports.deleteFollowUpAppointment = async (req, res) => {
    const { id } = req.params;
    try {
        const deleteAppointmentSql = 'DELETE FROM follow_up_appointments WHERE id = ?';
        console.log('SQL Query:', deleteAppointmentSql);
        console.log('Request Params:', req.params);
        await db.execute(deleteAppointmentSql, [id]);
        return res.status(200).json({ message: 'Follow-up appointment deleted successfully' });
    } catch (error) {
        console.error('Error deleting follow-up appointment:', error);
        return res.status(500).json({ message: 'An error occurred while deleting the follow-up appointment' });
    }
};