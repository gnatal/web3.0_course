async function main() {
    console.log("Accounts abb")

    // get connected accounts (metamask or remix VM)
    const accounts = await web3.eth.getAccounts();
    console.log(accounts);
    // get the balance in WEI
    const balance = await web3.eth.getBalance(accounts[0])
    console.log(balance)
    const balanceInETH = await web3.utils.fromWei(balance, "ether");
    console.log(`${balanceInETH} ETH`)

}