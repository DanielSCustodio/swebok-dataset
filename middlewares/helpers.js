const SwebokChpater = require("../models/SwebokChapter");
const SwebokTopic = require("../models/SwebokTopic");
const Evidence = require("../models/Evidence");


module.exports.checkTopic = async function (req, res, next) {
  const { chapterSelect, topicSelect } = req.body;

  const chapter = await SwebokChpater.findAll({ raw: true });
  const topic = await SwebokTopic.findAll({ raw: true });
  const chapterSelected = await SwebokChpater.findOne({
    raw: true,
    where: { Description: chapterSelect },
  });

  const topicSelected = await SwebokTopic.findOne({
    raw: true,
    where: { Description: topicSelect },
  });

  if (topicSelected.SwebokChapterId !== chapterSelected.id) {
    let alert = true;
    return res.render("industryissue/create", { alert, chapter, topic });
  }
  next();
};

module.exports.checkIssueSearch = async function (req, res, next) {
  const { type, question, area, topic } = req.body;

  const message = "Minimum of 3 characters required.";

  if (!type && !question && !area && !topic) {
    let emptyFields = true;
    return res.render("industryissue/search", { emptyFields });
  }

  if (area.length >= 1 && area.length <= 2) {
    let checkArea = message;
    return res.render("industryissue/search", { checkArea });
  }

  if (topic.length >= 1 && topic.length <= 2) {
    let checkTopic = message;
    return res.render("industryissue/search", { checkTopic });
  }

  if (type.length >= 1 && type.length <= 2) {
    let checkType = message;
    return res.render("industryissue/search", { checkType });
  }

  if (question.length >= 1 && question.length <= 2) {
    let checkQuestion = message;
    return res.render("industryissue/search", { checkQuestion });
  }

  next();
};

module.exports.checkEvidenceSearch= async function(req, res, next){
  const { search } = req.body;
  const evidence = await Evidence.findAll({ raw: true });
  const message = "Minimum of 3 characters required.";

  if (search.length <= 2) {
    let checkSearch = message;
    return res.render("evidence/dashboard", { checkSearch, evidence });
  }
  next();
}
