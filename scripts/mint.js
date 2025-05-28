const { ethers } = require("hardhat");

async function main() {
  // Tu dirección (la misma que usaste como owner en el deploy)
  const walletAddress = "0x49052B2538cb736f5dc884aA97e17F62AD13cFb2"; // 👈 reemplazá esto

  // Cantidad a mintear (por ejemplo, 1000 PGU con 18 decimales)
  const amount = ethers.parseUnits("100", 18);

  // Dirección del contrato desplegado (copiala del deploy)
  const contractAddress = "0xF9a00d6d056E0275C4A7545CA2Ea547b199A2178"; // 👈 reemplazá esto

  const PugaCoin = await ethers.getContractFactory("PugaCoin");
  const contrato = await PugaCoin.attach(contractAddress);

  const tx = await contrato.mint(walletAddress, amount);
  console.log("Transacción enviada. Esperando confirmación...");
  await tx.wait();
  console.log(`✅ Mint exitoso: ${amount} tokens enviados a ${walletAddress}`);
}

main().catch((error) => {
  console.error("Error al mintear:", error);
  process.exit(1);
});