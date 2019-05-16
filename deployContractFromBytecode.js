/****** Deploying new contract to ethereum network via Geth console 			*****/
/****** Using only ABI and BYTEcode of a new contract							*****/
/****** Example created by Vladimir S. Udartsev (https://github.com/udartsev) 	*****/

/* 
 * (1) Connect to your ethereum network via Geth console:
 *
 * @note http://127.0.0.1:8545 - is a default ganache-cli host address, be free to change it
 * USE CLI COMMAND: 
 */
$ geth attach 'http://127.0.0.1:8545' 

/*
 * (2) Set you new contract variables inside Geth:
 *
 * @note contract abi object must be in array [], like: '[{"constant": false}]'
 * @note contract byteCode must start from 0x606060
 */
var abi = '[{"constant": false,"inputs": [{"name": "_winnings","type": "uint256"}],"name": "nothingIsImpossible","outputs": [],"payable": false,  "stateMutability": "nonpayable",  "type": "function"},{  "payable": true,  "stateMutability": "payable",  "type": "fallback"}]';
var byteCode = '0x6060604052341561000f57600080fd5b60db8061001d6000396000f300606060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063241f673d146041575b005b3415604b57600080fd5b605f60048080359060200190919050506061565b005b600081111560ac573373ffffffffffffffffffffffffffffffffffffffff166108fc600283029081150290604051600060405180830381858888f19350505050151560ab57600080fd5b5b505600a165627a7a723058209dccf8f370dde2ae64186418da896aafb9d45bf83b13aeaf0f8710f0a68bb2470029';

/*
 * (3) Unlock your account for deployment:
 *
 * USE COMMAND IN GETH:
 */ 
var accountAddr = web3.eth.accounts[0];
var gas = 5000000;
personal.unlockAccount(accountAddr)

/*
 * (4) Prepare contract data for deployment
 */
var newContractAbi = web3.eth.contract(JSON.parse(abi));
var newContractObject = {from: accountAddr,data: byteCode, gas: gas};

/*
 * (5) Deploy contract
 */
var deployedContract = newContractAbi.new(newContractObject);

/*
 * (6) Check deployment and get delpoyed contract address
 */
var deployedContract = web3.eth.getTransactionReceipt(deployedContract.transactionHash);
var contractAddr = deployedContract.contractAddress;
contractAddr;