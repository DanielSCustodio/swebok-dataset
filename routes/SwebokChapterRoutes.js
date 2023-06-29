const express = require('express');
const router = express.Router();
const SwebokChapterController = require('../controllers/SwebokChapterController');

router.get('/add', SwebokChapterController.createSwebokChapter);
router.post('/add', SwebokChapterController.createSwebokChapterSave);
router.get('/:id', SwebokChapterController.viewSwebokChapter);
router.get('/', SwebokChapterController.dashboard);

module.exports = router;
