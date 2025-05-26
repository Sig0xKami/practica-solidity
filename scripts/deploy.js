const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Desplegando el contrato con la cuenta:", deployer.address);

  const MiContrato = await ethers.getContractFactory("Enums");
  const contrato = await MiContrato.deploy();
  await contrato.waitForDeployment();

  console.log("Contrato desplegado en:", contrato.target); // Usar .target en lugar de .address con Hardhat 2.17+
  // cuanto se gasto
  
}

main().catch((error) => {
  console.error("Error al desplegar el contrato:", error);
  process.exit(1); // Salida con código de error
});