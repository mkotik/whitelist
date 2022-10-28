const { ethers } = require("hardhat");

async function main() {
  /**
   * A ContractFactory in ethers.js is an abstraction user to deploy new smart contracts, so whitelistContract here is a factory for instances of our Whitelist contract;
   */

  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // here we deploy the contract
  // 10 is the max number of whitelisted addresses allowed.
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  //print the address of the deployed contract
  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
