async function main () {

    // smart contract address
    const address = "0xd9145CCE52D386f254917e481eB44e9943F39138";

    // array got from Remix ABI tab
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUnint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
	];
    // create an instance of the contract
    const contractInstance = new web3.eth.Contract(abiArray, address);
    // call the myUint method from the smart contract
    const methods = await contractInstance.methods.myUint().call();
    console.log(methods)

    // get remix accounts
	const accounts = await web3.eth.getAccounts();

    // call with send the function setMyUint from the contract (using an account)
	await contractInstance.methods.setMyUnint(345).send({from: accounts[0]})
    // call the myUint method again.
	const methods2 = await contractInstance.methods.myUint().call();
    console.log(methods2)

}

main()