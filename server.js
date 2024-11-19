// Import thư viện dotenv để quản lý biến môi trường
require('dotenv').config();

// Import thư viện express để xây dựng ứng dụng web
const express = require('express');

// Import thư viện mysql để kết nối với cơ sở dữ liệu MySQL
const mysql = require('mysql2/promise');

// Import thư viện cors để cho phép các yêu cầu từ các nguồn khác nhau
const cors = require('cors');

// Import thư viện bcrypt để mã hóa mật khẩu
const bcrypt = require('bcrypt');

const jwt = require('jsonwebtoken');

// Import thư viện cookie-parser để xử lý cookie
const cookieParser = require('cookie-parser');

const medicalRecordsRoutes = require('./routes/medicalRecords');
const doctorRoutes = require('./routes/doctorRoutes');
const authRoutes = require('./routes/authRoutes');
const appointmentRoutes = require('./routes/appointmentRoutes');
const patientRoutes = require('./routes/patientRoutes');
const followUpAppointmentsRoutes = require('./routes/followUpAppointmentsRoutes');
const specialtyRoutes = require('./routes/specialtyRoutes');
const servicesRoutes = require('./routes/services');


// Tạo một instance của ứng dụng Express
const app = express();

// Cấu hình middleware để xử lý dữ liệu JSON trong các yêu cầu
app.use(express.json());
app.use(cookieParser());
app.use(cors({
    origin: [
        'http://localhost:3000',
        'http://localhost:3001',
        'https://2287-42-113-157-156.ngrok-free.app',
        'https://nhakhoa-72d284770bf0.herokuapp.com',
        'https://b066-42-114-35-0.ngrok-free.app' // Add this line
    ],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Tạo kết nối đến cơ sở dữ liệu MySQL

let db = null;
async function connectDatabase() {
    db = await mysql.createPool({
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        port: process.env.DB_PORT || 3306,
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'nhakhoa',
        timezone: '+07:00',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    });
    console.log('Database connected');
}
connectDatabase();


// Authentication middleware
function authMiddleware(req, res, next) {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        console.log("No token provided");
        return res.status(401).json({ message: "Chưa đăng nhập" });
    }

    const token = authHeader.split(' ')[1];

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        console.log("Token verified", decoded);
        next();
    } catch (error) {
        console.log("Token verification failed", error);
        return res.status(401).json({ message: "Chưa đăng nhập" });
    }
}
app.use('/auth', authRoutes);
app.use('/medical-records', medicalRecordsRoutes);
app.use('/follow-up-appointments', followUpAppointmentsRoutes);


app.use('/uploads', express.static('uploads'));
app.get('/me', authMiddleware, async (req, res) => {
    console.log("Get user info request received");
    try {
        const selectUserSql = "SELECT * FROM users WHERE id = ?";
        const [selectUserResult,] = await db.query(selectUserSql, [req.user.id]);

        if (selectUserResult.length === 0) {
            console.log("User not logged in");
            return res.status(401).json({ message: "Chưa đăng nhập" });
        }

        const user = selectUserResult[0]; // without password
        delete user.password;

        if (selectUserResult[0].role === 'admin') {
            console.log("Admin user info retrieved");
            return res.json({
                user: selectUserResult[0],
                profile: {
                    fullname: "Admin",
                    'id': 0,
                }
            });
        }

        if (selectUserResult[0].role === 'doctor') {
            const selectDoctorSql = "SELECT * FROM doctors WHERE user_id = ?";
            const [selectDoctorResult,] = await db.query(selectDoctorSql, [req.user.id]);
            console.log("Doctor user info retrieved");
            return res.json({
                user: selectUserResult[0],
                profile: selectDoctorResult[0]
            });
        }

        if (selectUserResult[0].role === 'patient') {
            const selectPatientSql = "SELECT * FROM patients WHERE user_id = ?";
            const [selectPatientResult,] = await db.query(selectPatientSql, [req.user.id]);
            console.log("Patient user info retrieved");
            return res.json({
                user: selectUserResult[0],
                profile: selectPatientResult[0]
            });
        }
    } catch (error) {
        console.log("Failed to retrieve user info", error);
        return res.status(401).json({ message: "Chưa đăng nhập" });
    }
});

app.use('/doctors', doctorRoutes);
app.use('/appointments', appointmentRoutes);
app.use('/patients', patientRoutes);
app.use('/specialties', specialtyRoutes);
app.use('/services', servicesRoutes);


// API to add a new appointment
app.post('/hour_appointments', async (req, res) => {
    console.log("Add appointment request received", req.body);
    const { doctor_id, appointment_date, appointment_hour, patient_name, patient_phone, patient_address, patient_gender, patient_birth_year, appointment_reason } = req.body;
    try {
        const insertAppointmentSql = 'INSERT INTO hour_appointments (doctor_id, appointment_date, appointment_hour, patient_name, patient_phone, patient_address, patient_gender, patient_birth_year, appointment_reason, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())';
        await db.execute(insertAppointmentSql, [doctor_id, appointment_date, appointment_hour, patient_name, patient_phone, patient_address, patient_gender, patient_birth_year, appointment_reason]);

        console.log("Appointment added successfully");
        return res.status(200).json({ message: "Appointment added successfully" });
    } catch (error) {
        console.log("Failed to add appointment", error);
        return res.status(500).json({ message: "An error occurred while adding the appointment" });
    }
});

// API to update an existing appointment
app.put('/hour_appointments/:id', async (req, res) => {
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
});

// API to delete an appointment
app.delete('/hour_appointments/:id', async (req, res) => {
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
});

// Khởi động server và lắng nghe các yêu cầu trên cổng 8080
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}...`);
});