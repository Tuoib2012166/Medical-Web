const express = require('express');
const router = express.Router();
const servicesController = require('../controllers/servicesController');


router.get('/', servicesController.listServices);

// Route to create a new service
router.post('/', servicesController.createService);

// Route to update an existing service
router.put('/:id', servicesController.updateService);

// Route to delete a service
router.delete('/:id', servicesController.deleteService);

module.exports = router;