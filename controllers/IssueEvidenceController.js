const IssueEvidence = require("../models/IssueEvidence");
const Evidence = require("../models/Evidence");
const IndustryIssue = require("../models/IndustryIssue");

module.exports = class EvidenceController {
  static async create(req, res) {
    const { id } = req.params;
    const issue = await IndustryIssue.findOne({
      raw: true,
      where: { id: id },
    });
    const evidence = await Evidence.findAll({ raw: true });
    res.render("issueevidence/create", { id, evidence, issue });
  }

  static async IssueEvidenceSave(req, res) {
    const { IndustryIssueId, Annotation, File, evidenceSelect } = req.body;
    const evidence = await Evidence.findOne({
      raw: true,
      where: { Title: evidenceSelect },
    });

    const response = {
      Annotation,
      File,
      IndustryIssueId: Number(IndustryIssueId),
      EvidenceId: evidence.id,
    };

    await IssueEvidence.create(response);

    res.redirect(`/industryissue/${IndustryIssueId}`);
  }
};
