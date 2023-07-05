const express = require("express");
const router = express.Router();
const IndustryIssueController = require("../controllers/IndustryIssueController");
const checkTopic = require('../middlewares/helpers').checkTopic
const checkSearch = require("../middlewares/helpers").checkSearch;



router.get("/add", IndustryIssueController.createIndustryIssue);
router.get("/search", IndustryIssueController.viewSearch);
router.get("/:id", IndustryIssueController.viewIndustryIssue);
router.get("/edit/:id", IndustryIssueController.editIndustryIssue);
router.get("/download-pdf/:id", IndustryIssueController.downloadPDF);
router.post("/add", checkTopic, IndustryIssueController.createIndustryIssueSave);
router.post("/search", checkSearch, IndustryIssueController.searchIndustryIssue);
router.post("/update", IndustryIssueController.updateIndustryIssueSave);

module.exports = router;
