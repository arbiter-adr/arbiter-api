var express = require('express');
var router = express.Router();
var controller = require('./parties.controller');

module.exports = (app) => {
  app.use('/api/v1/parties', router);
}

// router.get('/:address/openClaims', controller.getOpenClaims);
router.post('/newParty', controller.newParty);

exports.router = router;
