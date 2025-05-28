// scripts/burn.js
const hre = require("hardhat");

async function main() {
  const [signer] = await hre.ethers.getSigners();

  // Cambia esta dirección por la del contrato desplegado
  const tokenAddress = "0xTuDireccionDeContrato";

  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const token = await MyToken.attach(tokenAddress);

  const burnAmount = hre.ethers.parseUnits("10", 18); // 10 tokens (asumiendo 18 decimales)

  // Antes de quemar, asegurate que el signer tenga suficientes tokens.
  const balance = await token.balanceOf(signer.address);
  console.log(`Balance antes del burn: ${balance}`);

  const tx = await token.burn(burnAmount);
  await tx.wait();

  const newBalance = await token.balanceOf(signer.address);
  console.log(`Balance después del burn: ${newBalance}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});