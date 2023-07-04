const SwebokTopic = require("../models/SwebokTopic");
const SwebokChpater = require("../models/SwebokChapter");
const IndustryIssue = require("../models/IndustryIssue");
const IssueEvidence = require("../models/IssueEvidence");
const Evidence = require("../models/Evidence");
const puppeteer = require("puppeteer");
const { Op } = require("sequelize");

module.exports = class IndustryIssueController {
  static async createIndustryIssue(_req, res) {
    const chapter = await SwebokChpater.findAll({ raw: true });
    const topic = await SwebokTopic.findAll({ raw: true });
    res.render("industryissue/create", { chapter, topic });
  }
  static async createIndustryIssueSave(req, res) {
    const {
      Question,
      Type,
      Description,
      Claiment,
      File,
      chapterSelect,
      topicSelect,
    } = req.body;

    const id = (await IndustryIssue.findAll({ raw: true })).length + 1;

    const chapter = await SwebokChpater.findOne({
      raw: true,
      where: { Description: chapterSelect },
    });

    const topic = await SwebokTopic.findOne({
      raw: true,
      where: { Description: topicSelect },
    });

    const issue = {
      Question,
      Type,
      Description,
      Claiment,
      File,
      SwebokChapterId: chapter.id,
      SwebokTopicId: topic.id,
    };

    await IndustryIssue.create(issue);
    res.redirect(`/industryissue/${id}`);
  }
  static async viewIndustryIssue(req, res) {
    const { id } = req.params;

    const evidence = await Evidence.findAll({ raw: true });

    const industryIssue = await IndustryIssue.findOne({
      include: IssueEvidence,
      where: { id: id },
    });

    const chapter = await SwebokChpater.findOne({
      raw: true,
      where: { id: industryIssue.SwebokChapterId },
    });

    const topic = await SwebokTopic.findOne({
      raw: true,
      where: { id: industryIssue.SwebokTopicId },
    });

    res.render("industryissue/details", {
      industryIssue: industryIssue.get({ plain: true }),
      chapter,
      topic,
      evidence,
    });
  }
  static viewSearch(_req, res) {
    res.render("industryissue/search");
  }
  static async searchIndustryIssue(req, res) {
    const { type, question, area, topic } = req.body;
    let notFound = false;
    let industryIssue = await IndustryIssue.findAll({
      raw: true,
      include: [
        {
          model: SwebokTopic,
          where: {
            Description: {
              [Op.like]: `%${topic}%`,
            },
          },
        },
        {
          model: SwebokChpater,
          where: {
            Description: {
              [Op.like]: `%${area}%`,
            },
          },
        },
      ],

      where: {
        Type: {
          [Op.like]: `%${type}%`,
        },
        Question: {
          [Op.like]: `%${question}%`,
        },
        /*       SwebokChapterId: swebokArea.id,
        SwebokTopicId: swebokTopic.id, */
      },
    });

    if (industryIssue.length === 0) {
      notFound = true;
    }

    res.render("industryissue/search", { industryIssue, notFound });
  }
  static async downloadPDF(req, res) {
    const { id } = req.params;
    const url = `http://localhost:3000/industryissue/${id}`;

    try {
      const browser = await puppeteer.launch();
      const page = await browser.newPage();

      await page.goto(url, { waitUntil: "networkidle0" });

      await page.evaluate(() => {
        const exportButton = document.querySelector(".export");
        const editButton = document.querySelector(".edit-btn");
        const navbar = document.querySelector("#nav-bar");
        const footer = document.querySelector("#footer");
        const addNewEvidenceButton = document.querySelector("#add-new-evidence");
        const backButton = document.querySelector("#back");

        exportButton.parentNode.removeChild(exportButton);
        navbar.parentNode.removeChild(navbar);
        footer.parentNode.removeChild(footer);
        editButton.parentNode.removeChild(editButton);
        addNewEvidenceButton.parentNode.removeChild(addNewEvidenceButton);
        backButton.parentNode.removeChild(backButton);
      });

      const pdfOptions = {
        format: "A4",
      };

      const pdfBuffer = await page.pdf(pdfOptions);

      await browser.close();

      res.set({
        "Content-Type": "application/pdf",
        "Content-Disposition": 'attachment; filename="industryissue.pdf"',
      });
      res.send(pdfBuffer);
    } catch (error) {
      console.error("Error generating PDF:", error);
      res.status(500).send("Error generating PDF");
    }
  }
  static async editIndustryIssue(req, res) {
    const { id } = req.params;

    const industryIssue = await IndustryIssue.findOne({
      raw: true,
      where: { id: id },
    });

    const chapterSelect = await SwebokChpater.findOne({
      raw: true,
      where: { id: industryIssue.SwebokChapterId },
    });

    const topicSelect = await SwebokTopic.findOne({
      raw: true,
      where: { id: industryIssue.SwebokChapterId },
    });

    const chapter = await SwebokChpater.findAll({ raw: true });
    const chpaterFilter = chapter.filter(
      (item) => chapterSelect.Description != item.Description
    );

    const topic = await SwebokTopic.findAll({ raw: true });
    const topicFilter = topic.filter(
      (item) => topicSelect.Description != item.Description
    );

    console.log(chapterSelect);
    res.render("industryissue/edit", {
      industryIssue,
      chapterSelect,
      chpaterFilter,
      topicSelect,
      topicFilter,
    });
  }

  static async updateIndustryIssueSave(req, res) {
    const {
      id,
      chapterSelect,
      topicSelect,
      Question,
      Type,
      Description,
      Claiment,
      File,
    } = req.body;

    const issue = {
      id,
      chapterSelect,
      topicSelect,
      Question,
      Type,
      Description,
      Claiment,
      File,
    };
    await IndustryIssue.update(issue, { where: { id: id } });
    res.redirect(`/industryissue/${id}`);
  }
};
