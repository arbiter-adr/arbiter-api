var express = require('express');
var router = express.Router();
var controller = require('./documents.controller');

module.exports = (app) => {
  app.use('/api/v1/documents', router);
}

router.post('/add', controller.addDocument);

exports.router = router;
