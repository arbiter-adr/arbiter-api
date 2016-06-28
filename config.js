const Web3 = require('web3');
const web3Provider = new Web3.providers.HttpProvider("http://localhost:8545");
var web3 = new Web3(web3Provider);



const contractsDirectory = __dirname+'/contracts';
const solidityDirectory = contractsDirectory+'/solidity';
const compiledDirectory = contractsDirectory+'/compiled';
const deployedDirectory = contractsDirectory+'/deployed';
const librariesDirectory = solidityDirectory+'/libraries';


module.exports = {
  web3Provider : web3Provider,
  web3 : web3,
  apiURI : 'http://localhost:8000/api/v1',
  contractsDirectory : contractsDirectory,
  librariesDirectory : librariesDirectory
};
