const express = require('express');
const patientController = require('../controllers/patientController');

const router = express.Router();

router.get('/', patientController.getPatients);
router.post('/', patientController.addPatient);
router.put('/:id', patientController.updatePatient);
router.delete('/:id', patientController.deletePatient);

module.exports = router;