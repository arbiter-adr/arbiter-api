var utils = require('./documents.utils');


exports.addDocument = (req, res, next) => {
    console.log(req);
    res.send(req.files);

    utils.addDocument(req.body.doc).then((data) => {
      res.status(200).send(data);
    }).catch((error) => {
      var err = new Error();
      err.message = error.toString();
      err.status = 500;
      res.status(err.status).send(err);
    })
}
