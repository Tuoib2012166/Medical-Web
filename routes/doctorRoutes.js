const express = require('express');
const doctorController = require('../controllers/doctorController');

const router = express.Router();

router.get('/', doctorController.getDoctors);
router.post('/', doctorController.addDoctor);
router.put('/:id', doctorController.updateDoctor);
router.delete('/:id', doctorController.deleteDoctor);

module.exports = router;