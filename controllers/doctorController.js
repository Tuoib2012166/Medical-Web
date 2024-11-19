const db = require('../db'); // Adjust the path as necessary
const bcrypt = require('bcrypt');
const multer = require('multer');
const path = require('path');

// Set up multer for file uploads
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        cb(null, `${Date.now()}-${file.originalname}`);
    }
});

const upload = multer({ storage });

exports.getDoctors = async (req, res) => {
    console.log("Get doctors request received");
    const { specialtyId, doctorId } = req.query;

    try {
        let selectDoctorsSql = `
            SELECT
                d.id,
                d.user_id,
                d.fullname,
                d.phone,
                d.address,
                d.image,
                d.gender,
                d.birth_year,
                s.name AS specialty_name,
                d.specialty,
                d.created_at,
                u.username,
                u.role,
                u.status,
                u.created_at AS user_created_at
            FROM
                doctors d
                    LEFT JOIN
                users u ON d.user_id = u.id
                    LEFT JOIN
                specialties s ON d.specialty = s.id
            WHERE TRUE
        `;

        const queryParams = [];
        if (specialtyId) {
            selectDoctorsSql += ' AND d.specialty = ?';
            queryParams.push(specialtyId);
        }

        if (doctorId) {
            selectDoctorsSql += ` AND d.id = ${doctorId}`
        }

        const [doctors,] = await db.query(selectDoctorsSql, queryParams);

        console.log("Doctors retrieved", doctors);
        return res.json(doctors);
    } catch (error) {
        console.log("Failed to retrieve doctors", error);
        return res.status(500).json({ message: "An error occurred while fetching the doctors" });
    }
};

exports.addDoctor = async (req, res) => {
    upload.single('image')(req, res, async (err) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        console.log("Add doctor request received", req.body);
        const { username, password, fullname, phone, address, gender, birth_year, specialty } = req.body;
        const image = req.file ? req.file.path : null;

        const connection = await db.getConnection();
        try {
            await connection.beginTransaction();

            // Check if username already exists
            const checkUserSql = 'SELECT * FROM users WHERE username = ?';
            const [existingUsers] = await connection.execute(checkUserSql, [username]);

            if (existingUsers.length > 0) {
                await connection.rollback();
                console.log("Username already exists");
                return res.status(400).json({ message: "Username already exists" });
            }

            const hashedPassword = bcrypt.hashSync(password, 10);
            const insertUserSql = 'INSERT INTO users (username, password, role, status) VALUES (?, ?, "doctor", 1)';
            const [userResult] = await connection.execute(insertUserSql, [username, hashedPassword]);

            const userId = userResult.insertId;

            const insertDoctorSql = 'INSERT INTO doctors (user_id, fullname, phone, address, gender, birth_year, specialty, image, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())';
            await connection.execute(insertDoctorSql, [userId, fullname, phone, address, gender, birth_year, specialty, image]);

            await connection.commit();

            console.log("Doctor added successfully");
            return res.status(200).json({ message: "Doctor added successfully" });
        } catch (error) {
            await connection.rollback();
            console.log("Failed to add doctor", error);
            return res.status(500).json({ message: "An error occurred while adding the doctor" });
        } finally {
            connection.release();
        }
    });
};

exports.updateDoctor = async (req, res) => {
    upload.single('image')(req, res, async (err) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        console.log("Update doctor request received", req.body);
        const { id } = req.params;
        const { fullname, username, phone, address, gender, birth_year, specialty } = req.body;
        const image = req.file ? req.file.path : null;

        const connection = await db.getConnection();
        try {
            await connection.beginTransaction();

            const selectUserIdSql = 'SELECT user_id FROM doctors WHERE id = ?';
            const [rows] = await connection.execute(selectUserIdSql, [id]);

            if (rows.length === 0) {
                await connection.rollback();
                console.log("Doctor not found");
                return res.status(404).json({ message: "Doctor not found" });
            }

            const userId = rows[0].user_id;

            const updateUserSql = 'UPDATE users SET username = ? WHERE id = ?';
            const updateDoctorSql = `
                UPDATE doctors 
                SET fullname = ?, phone = ?, address = ?, gender = ?, birth_year = ?, specialty = ?, image = COALESCE(?, image) 
                WHERE id = ?
            `;
            await connection.execute(updateUserSql, [username, userId]);
            await connection.execute(updateDoctorSql, [fullname, phone, address, gender, birth_year, specialty, image, id]);
            await connection.commit();

            console.log("Doctor updated successfully");
            return res.status(200).json({ message: "Doctor updated successfully" });
        } catch (error) {
            await connection.rollback();
            console.log("Failed to update doctor", error);
            return res.status(500).json({ message: "An error occurred while updating the doctor" });
        } finally {
            connection.release();
        }
    });
};
exports.deleteDoctor = async (req, res) => {
    console.log("Delete doctor request received", req.params);
    const { id } = req.params;
    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const selectUserIdSql = 'SELECT user_id FROM doctors WHERE id = ?';
        const [rows] = await connection.execute(selectUserIdSql, [id]);

        if (rows.length === 0) {
            await connection.rollback();
            console.log("Doctor not found");
            return res.status(404).json({ message: "Doctor not found" });
        }

        const userId = rows[0].user_id;

        const deleteUserSql = 'DELETE FROM users WHERE id = ?';
        const deleteDoctorSql = 'DELETE FROM doctors WHERE id = ?';
        await connection.execute(deleteUserSql, [userId]);
        await connection.execute(deleteDoctorSql, [id]);
        await connection.commit();

        console.log("Doctor deleted successfully");
        return res.status(200).json({ message: "Doctor deleted successfully" });
    } catch (error) {
        await connection.rollback();
        console.log("Failed to delete doctor", error);
        return res.status(500).json({ message: "An error occurred while deleting the doctor" });
    } finally {
        connection.release();
    }
};