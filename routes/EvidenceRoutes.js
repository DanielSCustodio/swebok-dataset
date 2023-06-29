const express = require('express');
const router = express.Router();
const EvidenceController = require('../controllers/EvidenceController');

router.get('/add', EvidenceController.createEvidence);
router.get('/edit/:id', EvidenceController.editEvidence);
router.get('/:id', EvidenceController.viewEvidence);
router.get('/', EvidenceController.dashboard);
router.post('/add', EvidenceController.createEvidenceSave);
router.post('/update', EvidenceController.updateEvidenceSave);
router.post('/', EvidenceController.searchEvidence);

module.exports = router;
