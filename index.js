const express = require('express');
const exphbs = require('express-handlebars');
require('custom-env').env('development.local');

const app = express();

//Connection
const connection = require('./db/connection');

//Models
const SwebokChapter = require('./models/SwebokChapter'); 
/* const SwebokTopic = require('./models/SwebokTopic');
const IndustryIssue = require('./models/IndustryIssue');
const IssueEvidence = require('./models/IssueEvidence');
const Evidence = require('./models/Evidence'); */

//Routes

const SwebokChapterRoutes = require('./routes/SwebokChapterRoutes');
const SwebokTopicRoutes = require('./routes/SwebokTopicRoutes');
const IndustryIssueRoutes = require('./routes/IndustryIssueRoutes');
const EvidenceRoutes = require('./routes/EvidenceRoutes');
const IssueEvidenceRoutes = require("./routes/IssueEvidenceRoutes");

//Template Engine
app.engine('handlebars', exphbs.engine());

app.set('view engine', 'handlebars');

//Static Files
app.use(express.static('public'));

//Get body
app.use(
  express.urlencoded({
    extended: true,
  }),
);

app.use(express.json());

//Routes

app.use('/swebokchapter', SwebokChapterRoutes);
app.use('/sweboktopic', SwebokTopicRoutes);
app.use('/industryissue', IndustryIssueRoutes);
app.use('/evidence', EvidenceRoutes);
app.use("/issueevidence", IssueEvidenceRoutes);
app.get('/', async (_req, res) => {
  const chapters = await SwebokChapter.findAll({ raw: true });

  res.render('swebokchapter/dashboard', { chapters });
});

connection.sync(/* { force: true } */ ).then(() => {
  app.listen(process.env.PORT, 'localhost',() => {
    console.log(`Aplicação em execução na porta ${process.env.PORT}`);
  });
});
