const db = require('../db'); // Adjust the path as necessary
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

exports.getSpecialties = async (req, res) => {
    try {
        const selectSpecialtiesSql = 'SELECT * FROM specialties';
        const [specialties,] = await db.query(selectSpecialtiesSql);
        return res.json(specialties);
    } catch (error) {
        return res.status(500).json({ message: "An error occurred while fetching the specialties" });
    }
};

exports.addSpecialty = async (req, res) => {
    upload.single('image')(req, res, async (err) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        const { name, description } = req.body;
        const image = req.file ? req.file.path : null;
        try {
            const insertSpecialtySql = 'INSERT INTO specialties (name, description, image, created_at) VALUES (?, ?, ?, NOW())';
            await db.execute(insertSpecialtySql, [name, description, image]);
            return res.status(200).json({ message: "Specialty added successfully" });
        } catch (error) {
            console.error("Error adding specialty:", error);
            return res.status(500).json({ message: "An error occurred while adding the specialty" });
        }
    });
};

exports.updateSpecialty = [
    upload.single('image'),
    async (req, res) => {
        const { id } = req.params;
        const { name, description } = req.body;
        const image = req.file ? req.file.path : null;
        try {
            const updateSpecialtySql = 'UPDATE specialties SET name = ?, description = ?, image = ? WHERE id = ?';
            await db.execute(updateSpecialtySql, [name, description, image, id]);
            return res.status(200).json({ message: "Specialty updated successfully" });
        } catch (error) {
            return res.status(500).json({ message: "An error occurred while updating the specialty" });
        }
    }
];

exports.deleteSpecialty = async (req, res) => {
    const { id } = req.params;
    try {
        const deleteSpecialtySql = 'DELETE FROM specialties WHERE id = ?';
        await db.execute(deleteSpecialtySql, [id]);
        return res.status(200).json({ message: "Specialty deleted successfully" });
    } catch (error) {
        return res.status(500).json({ message: "An error occurred while deleting the specialty" });
    }
};