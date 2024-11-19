const express = require('express');
const router = express.Router();
const followUpAppointmentsController = require('../controllers/followUpAppointmentsController');

router.get('/', followUpAppointmentsController.getAllFollowUpAppointments);
router.post('/', followUpAppointmentsController.addFollowUpAppointment);
router.put('/:id', followUpAppointmentsController.updateFollowUpAppointment);
router.delete('/:id', followUpAppointmentsController.deleteFollowUpAppointment);

module.exports = router;