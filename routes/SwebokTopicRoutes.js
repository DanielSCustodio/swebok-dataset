const express = require('express');
const router = express.Router();
const SwebokTopicController = require('../controllers/SwebokTopicController');

router.get('/:id', SwebokTopicController.viewSwebokTopic);
router.post('/add', SwebokTopicController.createSwebokTopicSave);

module.exports = router;
