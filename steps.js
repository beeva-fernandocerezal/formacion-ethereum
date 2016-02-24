// Get enode
admin.nodeInfo.enode

// Create new account
personal.newAccount()

// Transfer ether between accounts
eth.sendTransaction({from: '0x0ab1df31c93ecc8758e3e5804d692a0a2cf51cd0', to: 'DESTINATION_ADDR', value: web3.toWei(100, "ether")});

// Create new contract
var source = "DEFINICION_CONTRATO_SIN_SALTOS_DE_LINEA";
var compiled = web3.eth.compile.solidity(source);
var contract = web3.eth.contract(compiled.Question.info.abiDefinition);

var _question = "¿Funciona?";
var _from = "0x0ab1df31c93ecc8758e3e5804d692a0a2cf51cd0";
var _gas = 3000000;
var _data = compiled.Question.code;

var myContract = contract.new(_question, {from: _from, data: _data, gas: _gas}, function(e, contract){
  if(!e) {
    if(!contract.address) {
      console.log("Contract transaction send: TransactionHash: " + contract.transactionHash + " waiting to be mined...");
    } else {
      console.log("Contract mined! Address: " + contract.address);
      console.log(contract);
    }
  }
});

// Call contract
var myContract = web3.eth.contract(ABI_DEFINITION).at(CONTRACT_ADDR);

// Call
myContract.getQuestion.call();

// Transaction
myContract.setResponse.sendTransaction("yes", {from: '0x0ab1df31c93ecc8758e3e5804d692a0a2cf51cd0', value: web3.toWei(1, "ether")});
