// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {

    mapping (uint => address) public  distributionList;
    mapping (address => bool) public  isInList;
    mapping (uint => address) public  paidLotteryPlayers;
    uint public paidLotteryCounter;

    // Natal coin features:
    // fairness everyone gets to have a distribution.
    // initialy 21 Mi
    // 18 decimals
    // games (lotery, you have a shot to win everyweek)
    // 2 loteries, the free one and the paid one.


    //array string keys = [""];

    // mapping (address => uint) public  keys;
    uint public distributionSize;
    uint public MAX_UINT = type(uint).max;
    uint paidLotteryFee = 600;
    address tokenOwner;
    address paidLottery = 0x0000000000000000000000000000000000111111;

    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        _mint(msg.sender, 21000000 * 10 ** decimals());
        tokenOwner = msg.sender;
    }

    // MAX_UINT -> 2^256
    function addToDistributionList (address user) public {
        require(user != tokenOwner, "You can't distribute to yourself");

        // make a way that nobody can register twice, maybe creating keys.
        if(distributionSize < MAX_UINT && !isInList[user]) {
            distributionList[distributionSize] = user;
            isInList[user] = true;
            distributionSize++;
        }
    }

    // 100 * 10^18 (1 eth -> 10^18 wei)
    function distribute () public  {
        uint toBeDistributed = tokenOwner.balance/20000; // 0.5% ->  0.05% -> 10k, 9.9995k .... 0.0 
        for(uint counter = 0; counter < distributionSize; counter++ ) {
            address distributed = distributionList[counter];
            _transfer(tokenOwner, distributed, toBeDistributed/distributionSize);
        }
    }

    // in this function A sells the token to B fro X Eth's  1eth -> 1000
    function sell (address payable seller, uint tokenRate) public payable  {
        require(seller != tokenOwner, "Can't buy from the source");
        seller.transfer(msg.value);
        transfer(msg.sender, msg.value * tokenRate);
    }

    // vendedor, valor token (1 Natalcoin, 0.0005% eth).
    function approve(address spender, uint256 value) public override  virtual returns (bool) {
        require(msg.sender != tokenOwner, "The Source can't create allowances");
        address owner = _msgSender();
        _approve(owner, spender, value); // 10 Natal coins
        return true;
    }

    function signupFreeLottery (uint key, address user) public  {

    }

    function signupPaidLotterey (address user) public  {
        require(_msgSender() == user, "You can't subscribe another person");
        transfer(paidLottery, paidLotteryFee);
        paidLotteryPlayers[paidLotteryCounter] = user;
        paidLotteryCounter++;
    }

    function freeLotteryRun () public {

    }

    function paidLotteryRun () public {
        paidLotteryCounter = 0;
    }

}
