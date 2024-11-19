const express = require('express');
const specialtyController = require('../controllers/specialtyController');
const router = express.Router();

router.get('/', specialtyController.getSpecialties);
router.post('/', specialtyController.addSpecialty);
router.put('/:id', specialtyController.updateSpecialty);
router.delete('/:id', specialtyController.deleteSpecialty);

module.exports = router;