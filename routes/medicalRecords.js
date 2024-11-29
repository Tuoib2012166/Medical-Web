const express = require('express');
const router = express.Router();
const { getMedicalRecords, addMedicalRecord, updateMedicalRecord, deleteMedicalRecord } = require('../controllers/medicalRecordsController');
const { getMedicalRecordsByUser } = require('../controllers/medicalRecordsController');

router.get('/', getMedicalRecords);
router.post('/', addMedicalRecord);
router.put('/:id', updateMedicalRecord);
router.delete('/:id', deleteMedicalRecord);

module.exports = router;