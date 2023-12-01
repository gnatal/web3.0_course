const Spacebear = artifacts.require("Spacebear");
const truffleAssert = require('truffle-assertions');


// You are maybe wondering what's that web3.utils.toBN("0") doing here.
// The problem is that JavaScript integer is using IEEE 754 for representing the numbers. The maximum number where all 
//arithmetic operations work is 9,007,199,254,740,991 (2^53). But solidity uint256 ranges to 2^256, 
// which is much larger. Without going to much in-depth, let me summarizes it by saying, after 9^53 it just doesn't work correctly anymore.
// In order to work with such large numbers, they are automatically converted to be used with a library called Bignumber.js.
// Bignumber.js allows for arbitrary large arithmetic operations. This why all (unsigned) integers are automatically converted and 
// Bignumber is used everywhere.
// Even more problematic, there are several different Bignumber libraries and not all versions of web3 convenience libraries 
// (web3js, etherjs, etc) are using the same Bignumber objects. More on that later...
// Now we have a unit test running, let's see how we can deploy the contract to one of the test networks.

contract("Spacebear", (accounts) => {
    it('should credit an NFT to a specific account', async () => {
        const spacebearInstance = await Spacebear.deployed();
        let txResult = await spacebearInstance.safeMint(accounts[1],"spacebear_1.json");

        truffleAssert.eventEmitted(txResult, 'Transfer', {from: '0x0000000000000000000000000000000000000000', to: accounts[1], tokenId: web3.utils.toBN("0")});

        assert.equal(await spacebearInstance.ownerOf(0), accounts[1], "Owner of Token is the wrong address");
    })
})