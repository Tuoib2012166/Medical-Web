const db = require('../db'); // Adjust the path as necessary
const moment = require('moment-timezone');

exports.bookAppointment = async (req, res) => {
    console.log("Book appointment request received", req.body);
    await db.query("START TRANSACTION");
    const { fullname, phone, address, gender, birthYear, appointmentDate, appointmentTime, doctorId, content, userId } = req.body;
    try {
        const insertBookingSql = 'INSERT INTO booking_appointments (fullname, phone, address, gender, birth_year, appointment_date, appointment_time, doctor_id, content, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
        await db.execute(insertBookingSql, [fullname, phone, address, gender, birthYear, appointmentDate, appointmentTime, doctorId, content, userId]);

        await db.query("COMMIT");
        console.log("Appointment booked successfully");
        return res.status(200).json({ message: "Appointment booked successfully" });
    } catch (error) {
        console.log("Failed to book appointment", error);
        await db.query("ROLLBACK");
        return res.status(500).json({ message: "An error occurred while booking the appointment" });
    }
};

exports.getUniqueAppointments = async (req, res) => {
    console.log("Get unique appointments request received");
    try {
        const selectUniqueAppointmentsSql = `
            SELECT DISTINCT
                doctor_id,
                user_id,
                appointment_date,
                appointment_time
            FROM
                booking_appointments
        `;
        const [uniqueAppointments,] = await db.query(selectUniqueAppointmentsSql);

        // Convert appointment_date to Vietnam timezone
        const convertedAppointments = uniqueAppointments.map(appointment => {
            appointment.appointment_date = moment(appointment.appointment_date).tz('Asia/Ho_Chi_Minh').format('YYYY-MM-DD');
            return appointment;
        });

        console.log("Unique appointments retrieved", convertedAppointments);
        return res.json(convertedAppointments);
    } catch (error) {
        console.log("Failed to retrieve unique appointments", error);
        return res.status(500).json({ message: "An error occurred while fetching the unique appointments" });
    }
};

exports.getAppointments = async (req, res) => {
    const { today, benhNhanId, doctorId } = req.query; // Expect 'today' as a query parameter (e.g., ?today=2024-11-18)
    console.log("Get appointments request received");

    try {
        let selectAppointmentsSql = `
            SELECT
                ba.id,
                ba.user_id,
                ba.fullname,
                ba.phone,
                ba.address,
                ba.gender,
                ba.birth_year,
                ba.appointment_date,
                ba.appointment_time,
                HOUR(ba.appointment_time) AS hour, -- Extract the hour from appointment_time
                ba.status,
                d.fullname AS doctor_name,
                d.id AS doctor_id,
                s.name AS specialty,
                ba.content,
                ba.created_at,
                ba.user_id as patient_id
            FROM
                booking_appointments ba
                    JOIN
                doctors d ON ba.doctor_id = d.id
                  LEFT  JOIN
                specialties s ON d.specialty = s.id
            WHERE TRUE 
        `;

        const params = [];

        // Add the date filter if 'today' is passed in the query
        if (today) {
            selectAppointmentsSql += `
                AND DATE(CONVERT_TZ(ba.appointment_date, '+00:00', '+07:00')) = ?
            `;
            params.push(today);
        }

        if (doctorId) {
            selectAppointmentsSql += `
                AND ba.doctor_id = ${doctorId}
            `;
            params.push(doctorId);
        }

        if (benhNhanId) {
            selectAppointmentsSql += `
                AND ba.user_id = ${benhNhanId}
            `;
            params.push(benhNhanId);
        }
        // Execute the query with parameterized inputs
        const [appointments] = await db.query(selectAppointmentsSql, params);

        return res.json(appointments);
    } catch (error) {
        console.error("Failed to retrieve appointments", error);
        return res.status(500).json({
            message: "An error occurred while fetching the appointments",
            error: error.message,
        });
    }
};




exports.confirmAppointment = async (req, res) => {
    console.log("Confirm appointment request received", req.params);
    const { id } = req.params;

    try {
        const updateStatusSql = 'UPDATE booking_appointments SET status = ? WHERE id = ?';
        await db.execute(updateStatusSql, ['accept', id]);

        console.log("Appointment confirmed successfully");
        return res.status(200).json({ message: "Appointment confirmed successfully" });
    } catch (error) {
        console.log("Failed to confirm appointment", error);
        return res.status(500).json({ message: "An error occurred while confirming the appointment", error: error.message });
    }
};

exports.rejectAppointment = async (req, res) => {
    console.log("Reject appointment request received", req.params);
    const { id } = req.params;

    try {
        const updateStatusSql = 'UPDATE booking_appointments SET status = ? WHERE id = ?';
        await db.execute(updateStatusSql, ['reject', id]);

        console.log("Appointment rejected successfully");
        return res.status(200).json({ message: "Appointment rejected successfully" });
    } catch (error) {
        console.log("Failed to reject appointment", error);
        return res.status(500).json({ message: "An error occurred while rejecting the appointment", error: error.message });
    }
};

exports.updateAppointment = async (req, res) => {
    console.log("Update appointment request received", req.body);
    const { id } = req.params;
    const { doctor_id, appointment_date, appointment_hour, patient_name, patient_phone, patient_address, patient_gender, patient_birth_year, appointment_reason } = req.body;
    try {
        const updateAppointmentSql = 'UPDATE hour_appointments SET doctor_id = ?, appointment_date = ?, appointment_hour = ?, patient_name = ?, patient_phone = ?, patient_address = ?, patient_gender = ?, patient_birth_year = ?, appointment_reason = ? WHERE id = ?';
        await db.execute(updateAppointmentSql, [doctor_id, appointment_date, appointment_hour, patient_name, patient_phone, patient_address, patient_gender, patient_birth_year, appointment_reason, id]);

        console.log("Appointment updated successfully");
        return res.status(200).json({ message: "Appointment updated successfully" });
    } catch (error) {
        console.log("Failed to update appointment", error);
        return res.status(500).json({ message: "An error occurred while updating the appointment" });
    }
};

exports.deleteAppointment = async (req, res) => {
    console.log("Delete appointment request received", req.params);
    const { id } = req.params;
    try {
        const deleteAppointmentSql = 'DELETE FROM hour_appointments WHERE id = ?';
        await db.execute(deleteAppointmentSql, [id]);

        console.log("Appointment deleted successfully");
        return res.status(200).json({ message: "Appointment deleted successfully" });
    } catch (error) {
        console.log("Failed to delete appointment", error);
        return res.status(500).json({ message: "An error occurred while deleting the appointment" });
    }
};