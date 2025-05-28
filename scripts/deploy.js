const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Desplegando el contrato con la cuenta:", deployer.address);

  const PugaCoin = await ethers.getContractFactory("PugaCoinCap");

  // Pasamos la dirección del deployer como owner inicial
  const contrato = await PugaCoin.deploy("0x1d38B83c23Be0a1A0beC8b92c0b13f9D3E9EbAeB");
  await contrato.waitForDeployment();

  console.log("Contrato desplegado en:", contrato.target);
}

main().catch((error) => {
  console.error("Error al desplegar el contrato:", error);
  process.exit(1);
});