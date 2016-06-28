const rp = require('request-promise');
const config = require('../../../config.js');
const Promise = require('bluebird');
const fs = Promise.promisifyAll(require('fs'));


exports.addDocument = (doc) => {
  return new Promise((resolve, reject) => {
    var options = {
      method : 'POST',
      uri : `${config.apiURI}/documents/add`,
      body : {
        doc : null // doc
      },
      files : 'testdoc.pdf',
      json : true
    };


    rp(options).then((response) =>{
      resolve(response);
    }).catch((error) => {
      reject(error);
    });
  })
}



fs.readFileAsync(__dirname+'/testdoc.pdf').then((buf) => {
  return exports.addDocument(buf);
}).then((ipfsHash) => {
  console.log(ipfsHash);
}).catch((error) => {
  console.log(error);
});
