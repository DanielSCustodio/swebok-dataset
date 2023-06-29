const express = require("express");
const router = express.Router();
const IssueEvidenceController = require("../controllers/IssueEvidenceController");

//Controller

router.get('/add/:id', IssueEvidenceController.create)
router.post("/add/:id", IssueEvidenceController.IssueEvidenceSave);

module.exports = router;
