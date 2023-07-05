const express = require("express");
const router = express.Router();
const IndustryIssueController = require("../controllers/IndustryIssueController");
const checkTopic = require("../middlewares/helpers").checkTopic;
const checkIssueSearch = require("../middlewares/helpers").checkIssueSearch;

router.get("/add", IndustryIssueController.createIndustryIssue);
router.get("/search", IndustryIssueController.viewSearch);
router.get("/:id", IndustryIssueController.viewIndustryIssue);
router.get("/edit/:id", IndustryIssueController.editIndustryIssue);
router.get("/download-pdf/:id", IndustryIssueController.downloadPDF);
router.post(
  "/add",
  checkTopic,
  IndustryIssueController.createIndustryIssueSave
);
router.post(
  "/search",
  checkIssueSearch,
  IndustryIssueController.searchIndustryIssue
);
router.post("/update", IndustryIssueController.updateIndustryIssueSave);

module.exports = router;
