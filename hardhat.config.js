require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config(); // Asegúrate de usar dotenv si usas variables de entorno

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  // networks: {
  //   polygon: {
  //     url: "https://polygon-rpc.com", // Mainnet
  //     accounts: [process.env.PRIVATE_KEY]
  //   },
  //   amoy: {
  //     url: "https://rpc-amoy.polygon.technology", // Testnet Amoy
  //     accounts: [process.env.PRIVATE_KEY]
  //   }
    
  // }
networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/2b851038fbe5448e8f32586b018efc71", // RPC público
      accounts: 
      [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY, // Obténla en https://etherscan.io/apidashboard
  },

  
};