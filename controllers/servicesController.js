const db = require('../db');


exports.listServices = async (req, res) => {
    const { specialty_id } = req.query;
    try {
        let listServicesSql = 'SELECT * FROM services WHERE TRUE ';
        if (specialty_id) {
            listServicesSql += `and specialty_id = ${specialty_id}`
        }
        const [services] = await db.query(listServicesSql);
        res.status(200).json(services);
    } catch (error) {
        console.error('Failed to list services', error);
        res.status(500).json({ message: "An error occurred while listing the services" });
    }
};

// Controller to create a new service
exports.createService = async (req, res) => {
    const { specialty_id, name, description, price } = req.body;
    try {
        const createServiceSql = 'INSERT INTO services (specialty_id, name, description, price) VALUES (?, ?, ?, ?)';
        await db.execute(createServiceSql, [specialty_id, name, description, price]);
        res.status(201).json({ message: "Service created successfully" });
    } catch (error) {
        console.error('Failed to create service', error);
        res.status(500).json({ message: "An error occurred while creating the service" });
    }
};

// Controller to update an existing service
exports.updateService = async (req, res) => {
    const { id } = req.params;
    const { specialty_id, name, description, price } = req.body;
    try {
        const updateServiceSql = 'UPDATE services SET specialty_id = ?, name = ?, description = ?, price = ? WHERE id = ?';
        await db.execute(updateServiceSql, [specialty_id, name, description, price, id]);
        res.status(200).json({ message: "Service updated successfully" });
    } catch (error) {
        console.error('Failed to update service', error);
        res.status(500).json({ message: "An error occurred while updating the service" });
    }
};

// Controller to delete a service
exports.deleteService = async (req, res) => {
    const { id } = req.params;
    try {
        const deleteServiceSql = 'DELETE FROM services WHERE id = ?';
        await db.execute(deleteServiceSql, [id]);
        res.status(200).json({ message: "Service deleted successfully" });
    } catch (error) {
        console.error('Failed to delete service', error);
        res.status(500).json({ message: "An error occurred while deleting the service" });
    }
};