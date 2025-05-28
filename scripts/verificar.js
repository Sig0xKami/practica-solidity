const { ethers } = require("hardhat");

async function main() {
  const contractAddress = "0xF9a00d6d056E0275C4A7545CA2Ea547b199A2178";
  const walletAddress = "0x49052B2538cb736f5dc884aA97e17F62AD13cFb2";
  

  const PugaCoin = await ethers.getContractFactory("PugaCoin");
  const contrato = await PugaCoin.attach(contractAddress);

  const balance = await contrato.balanceOf(walletAddress);
  console.log(`Balance en PGU: ${ethers.formatUnits(balance, 18)}`);
}

main();