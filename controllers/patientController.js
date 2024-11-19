const db = require('../db'); // Adjust the path as necessary
const bcrypt = require('bcrypt');

exports.getPatients = async (req, res) => {
    console.log("Get patients request received");
    try {
        const selectPatientsSql = `
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
        `;
        const [patients,] = await db.query(selectPatientsSql);

        console.log("Patients retrieved", patients);
        return res.json(patients);
    } catch (error) {
        console.log("Failed to retrieve patients", error);
        return res.status(500).json({ message: "An error occurred while fetching the patients" });
    }
};

exports.addPatient = async (req, res) => {
    console.log("Add patient request received", req.body);
    const { username, password, fullname, phone, address, gender, birth_year } = req.body;

    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const hashedPassword = bcrypt.hashSync(password, 10);
        const insertUserSql = 'INSERT INTO users (username, password, role, status) VALUES (?, ?, "patient", 1)';
        const [userResult] = await connection.execute(insertUserSql, [username, hashedPassword]);

        const userId = userResult.insertId;

        const insertPatientSql = 'INSERT INTO patients (user_id, fullname, phone, address, gender, birth_year, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())';
        await connection.execute(insertPatientSql, [userId, fullname, phone, address, gender, birth_year]);

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
    const { fullname, username, phone, address, gender, birth_year } = req.body;
    const { id } = req.params;
    console.log('Updating patient with data:', { fullname, username, phone, address, gender, birth_year, id });

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

        const updateUserSql = 'UPDATE users SET username = ? WHERE id = ?';
        const updatePatientSql = 'UPDATE patients SET fullname = ?, phone = ?, address = ?, gender = ?, birth_year = ? WHERE id = ?';
        await connection.execute(updateUserSql, [username, userId]);
        await connection.execute(updatePatientSql, [fullname, phone, address, gender, birth_year, id]);
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