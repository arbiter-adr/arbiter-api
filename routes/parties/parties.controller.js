var utils = require('./parties.utils');

/**
*
*/

exports.newParty = (req, res, next) => {
  utils.new(req.body.party).then((data) => {
    res.status(200).send(data);
  }).catch((error) => {
    var err = new Error();
    err.message = error.toString();
    err.status = 500;
    res.status(err.status).send(err);
  })
}
