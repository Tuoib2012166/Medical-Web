const db = require('../db'); // Adjust the path as necessary
const bcrypt = require('bcrypt');

exports.getPatients = async (req, res) => {
    console.log("Get patients request received");
    const { doctorId } = req.query;
    try {
        let selectPatientsSql = `
            SELECT
                p.id,
                u.username,
                u.role,
                u.status,
                u.created_at,
                p.fullname,
                p.phone,
                p.address,
                p.gender,
                p.birth_year,
                p.email  -- Thêm email vào truy vấn
            FROM
                patients p
                    LEFT JOIN
                users u ON p.user_id = u.id
                ${doctorId ? `LEFT JOIN booking_appointments b ON b.user_id = p.id` : `` }
            WHERE TRUE 
        `;
        if (doctorId) {
            selectPatientsSql += ` AND b.doctor_id = ${doctorId}`;
        }
        
        const [patients,] = await db.query(selectPatientsSql);
        res.status(200).json(patients);
    } catch (error) {
        console.log("Failed to retrieve patients", error);
        return res.status(500).json({ message: "An error occurred while fetching the patients" });
    }
};


exports.addPatient = async (req, res) => {
    console.log("Add patient request received", req.body);
    const { username, password, fullname, phone, address, gender, birth_year, email } = req.body;

    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const hashedPassword = bcrypt.hashSync(password, 10);
        const insertUserSql = 'INSERT INTO users (username, password, role, status) VALUES (?, ?, "patient", 1)';
        const [userResult] = await connection.execute(insertUserSql, [username, hashedPassword]);

        const userId = userResult.insertId;

        const insertPatientSql = 'INSERT INTO patients (user_id, fullname, phone, address, gender, birth_year, email, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())';
        await connection.execute(insertPatientSql, [userId, fullname, phone, address, gender, birth_year, email]);

        await connection.commit();

        console.log("Patient added successfully");
        return res.status(200).json({ message: "Patient added successfully" });
    } catch (error) {
        await connection.rollback();
        console.log("Failed to add patient", error);
        return res.status(500).json({ message: "An error occurred while adding the patient" });
    } finally {
        connection.release();
    }
};


exports.updatePatient = async (req, res) => {
    const { fullname, phone, address, gender, birth_year, email } = req.body;
    const { id } = req.params;
    console.log('Updating patient with data:', { fullname, phone, address, gender, birth_year, email, id });

    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const selectUserIdSql = 'SELECT user_id FROM patients WHERE id = ?';
        const [rows] = await connection.execute(selectUserIdSql, [id]);

        if (rows.length === 0) {
            await connection.rollback();
            console.log("Patient not found");
            return res.status(404).json({ message: "Patient not found" });
        }

        const userId = rows[0].user_id;

        const updatePatientSql = 'UPDATE patients SET fullname = ?, phone = ?, address = ?, gender = ?, birth_year = ?, email = ? WHERE id = ?';
        await connection.execute(updatePatientSql, [fullname, phone, address, gender, birth_year, email, id]);
        await connection.commit();

        console.log("Patient updated successfully");
        return res.status(200).json({ message: "Patient updated successfully" });
    } catch (error) {
        await connection.rollback();
        console.log("Failed to update patient", error);
        return res.status(500).json({ message: "An error occurred while updating the patient" });
    } finally {
        connection.release();
    }
};


exports.deletePatient = async (req, res) => {
    console.log("Delete patient request received", req.params);
    const { id } = req.params;
    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const selectUserIdSql = 'SELECT user_id FROM patients WHERE id = ?';
        const [rows] = await connection.execute(selectUserIdSql, [id]);

        if (rows.length === 0) {
            await connection.rollback();
            console.log("Patient not found");
            return res.status(404).json({ message: "Patient not found" });
        }

        const userId = rows[0].user_id;

        const deleteUserSql = 'DELETE FROM users WHERE id = ?';
        const deletePatientSql = 'DELETE FROM patients WHERE id = ?';
        await connection.execute(deleteUserSql, [userId]);
        await connection.execute(deletePatientSql, [id]);
        await connection.commit();

        console.log("Patient deleted successfully");
        return res.status(200).json({ message: "Patient deleted successfully" });
    } catch (error) {
        await connection.rollback();
        console.log("Failed to delete patient", error);
        return res.status(500).json({ message: "An error occurred while deleting the patient" });
    } finally {
        connection.release();
    }
};

exports.getPatientById = async (req, res) => {
    const patientId = req.params.id;  // Lấy ID từ params
    console.log("Get patient by ID request received", patientId);
    
    try {
        const selectPatientSql = `
            SELECT
                p.id,
                u.username,
                u.role,
                u.status,
                u.created_at,
                p.fullname,
                p.phone,
                p.address,
                p.gender,
                p.birth_year
            FROM
                patients p
            LEFT JOIN
                users u ON p.user_id = u.id
            WHERE p.id = ?
        `;
        const [patient] = await db.query(selectPatientSql, [patientId]);

        if (patient.length > 0) {
            console.log("Patient data retrieved", patient[0]);
            return res.json(patient[0]);
        } else {
            return res.status(404).json({ message: "Patient not found" });
        }
    } catch (error) {
        console.log("Failed to retrieve patient", error);
        return res.status(500).json({ message: "An error occurred while fetching the patient" });
    }
};
