import { getFullnodeUrl, SuiClient } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    devnet: {
      url: getFullnodeUrl("devnet"),
    },
    testnet: {
      url: getFullnodeUrl("testnet"),
      // packageID: "0x2",
      // state: "0x2",
    },
    mainnet: {
      url: getFullnodeUrl("mainnet"),
    },
  });
const suiClient = new SuiClient({
  url: networkConfig.testnet.url,
  // 

})

export { useNetworkVariable, useNetworkVariables, networkConfig, suiClient };
