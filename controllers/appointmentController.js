const db = require('../db'); // Adjust the path as necessary
const moment = require('moment-timezone');

exports.bookAppointment = async (req, res) => {
    console.log("Book appointment request received", req.body);
    await db.query("START TRANSACTION");
    const { fullname, phone, address, gender, birthYear, appointmentDate, appointmentTime, doctorId, content, userId, email } = req.body; // Lấy email từ req.body
    try {
        const insertBookingSql = 'INSERT INTO booking_appointments (fullname, phone, address, gender, birth_year, appointment_date, appointment_time, doctor_id, content, user_id, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'; // Thêm email vào câu lệnh SQL
        await db.execute(insertBookingSql, [fullname, phone, address, gender, birthYear, appointmentDate, appointmentTime, doctorId, content, userId, email]);

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
    const { today, benhNhanId, doctorId } = req.query;
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
                HOUR(ba.appointment_time) AS hour,
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
                    LEFT JOIN
                specialties s ON d.specialty = s.id
            WHERE ba.status = 'pending' -- Lọc trạng thái pending
        `;

        const params = [];

        if (today) {
            selectAppointmentsSql += `
                AND DATE(CONVERT_TZ(ba.appointment_date, '+00:00', '+07:00')) = ?
            `;
            params.push(today);
        }

        if (doctorId) {
            selectAppointmentsSql += ` AND ba.doctor_id = ? `;
            params.push(doctorId);
        }

        if (benhNhanId) {
            selectAppointmentsSql += ` AND ba.user_id = ? `;
            params.push(benhNhanId);
        }

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

exports.getAppointmentsList = async (req, res) => {
    const { today, benhNhanId, doctorId } = req.query;
    console.log("Get appointments request received");

    try {
        let selectAppointmentsSql = `
            SELECT
                ba.id,
                ba.user_id,
                ba.fullname,
                ba.phone,
                ba.email,
                ba.address,
                ba.gender,
                ba.birth_year,
                ba.appointment_date,
                ba.appointment_time,
                HOUR(ba.appointment_time) AS hour,
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
                    LEFT JOIN
                specialties s ON d.specialty = s.id
        `;

        const params = [];

        if (today) {
            selectAppointmentsSql += `
                AND DATE(CONVERT_TZ(ba.appointment_date, '+00:00', '+07:00')) = ?
            `;
            params.push(today);
        }

        if (doctorId) {
            selectAppointmentsSql += ` AND ba.doctor_id = ? `;
            params.push(doctorId);
        }

        if (benhNhanId) {
            selectAppointmentsSql += ` AND ba.user_id = ? `;
            params.push(benhNhanId);
        }

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

const nodemailer = require('nodemailer');

exports.rejectAppointment = async (req, res) => {
    console.log("Reject appointment request received", req.params);
    const { id } = req.params;

    try {
        // Lấy thông tin bệnh nhân và email từ cơ sở dữ liệu
        const getPatientEmailSql = 'SELECT ba.fullname, ba.phone, DATE_FORMAT(ba.appointment_date, "%Y-%m-%d") AS appointment_date, ba.appointment_time, ba.email FROM booking_appointments ba WHERE ba.id = ?';
        const [patientData] = await db.query(getPatientEmailSql, [id]);

        if (patientData.length === 0) {
            return res.status(404).json({ message: "Appointment not found" });
        }

        const patient = patientData[0];

        // Cập nhật trạng thái cuộc hẹn
        const updateStatusSql = 'UPDATE booking_appointments SET status = ? WHERE id = ?';
        await db.execute(updateStatusSql, ['reject', id]);

        // Gửi email thông báo cho bệnh nhân
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'tuoinguyen106@gmail.com', // Thay bằng email của bạn
                pass: 'rhhz seou sikp cbss', // Thay bằng mật khẩu email của bạn
            },
        });

        const mailOptions = {
            from: 'tuoinguyen106@gmail.com',
            to: patient.email,  // Email của bệnh nhân
            subject: 'Thông báo về cuộc hẹn bị hủy',
            text: `Kính gửi ${patient.fullname},\n\n
            Chúng tôi rất tiếc phải thông báo rằng cuộc hẹn của bạn với phòng khám Dental Care vào ngày ${patient.appointment_date} lúc ${patient.appointment_time} đã bị hủy. \n
            Lý do cuộc hẹn không thể được xác nhận có thể do một số yếu tố về lịch trình của bác sĩ hoặc tình trạng khác.\n

            Chúng tôi hiểu rằng điều này có thể gây ra sự bất tiện cho bạn và xin lỗi về sự thay đổi này. Nếu bạn muốn đặt lại lịch hẹn, vui lòng truy cập trang web của chúng tôi để kiểm tra các lịch hẹn mới và thực hiện đặt lịch lại.\n

            [Đặt lại lịch hẹn ngay tại đây](http://localhost:3000/AppointmentForm) \n

            Nếu bạn có bất kỳ câu hỏi nào hoặc cần hỗ trợ thêm, xin vui lòng liên hệ với chúng tôi qua email này hoặc gọi điện đến số hỗ trợ khách hàng của chúng tôi.\n

            Trân trọng,\n
            Đội ngũ Dental Care`
        };

        await transporter.sendMail(mailOptions);

        console.log("Appointment rejected and email sent successfully");
        return res.status(200).json({ message: "Cuộc hẹn đã bị từ chối và email đã được gửi" });
    } catch (error) {
        console.log("Failed to reject appointment or send email", error);
        return res.status(500).json({ message: "Có lỗi xảy ra khi từ chối cuộc hẹn hoặc gửi email", error: error.message });
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
        const deleteAppointmentSql = 'DELETE FROM booking_appointments WHERE id = ?';
        await db.execute(deleteAppointmentSql, [id]);

        console.log("Appointment deleted successfully");
        return res.status(200).json({ message: "Appointment deleted successfully" });
    } catch (error) {
        console.log("Failed to delete appointment", error);
        return res.status(500).json({ message: "An error occurred while deleting the appointment" });
    }
};