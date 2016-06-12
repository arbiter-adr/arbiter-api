var Promise = require('bluebird');
var fs = Promise.promisifyAll(require('fs'));
var settings = require('../../settings');
var IPFS = require('ipfs')
var ipfsNode = new IPFS()

console.log(ipfsNode);

// ipfsNode.isOnline((error, result) => {
//   console.log(error);
//   console.log(result);
// });

exports.addDocument = (doc) => {
  return new Promise((resolve, reject) => {
    fs.readFileAsync(settings.dirname+'/contracts/solidity/Dispute.sol', 'utf8').then((doc) => {
      return ipfsNode.files.add(new Buffer(doc));
    }).then((result) => {
      // var file = .path;
      console.log(result[0]);
      ipfsNode._repo.datastore.get(result[0].path, (error, _file) => {
        if(error){reject(error)}
        resolve(_file);
      });
    }).catch((error) => {
      reject(error);
    });
  });
}


// exports.addDocument(null).then((data) => {
//   console.log(data)
// }).catch((error) => {
//   console.log(error);
// });
