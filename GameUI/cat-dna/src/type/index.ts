import { suiClient } from "@/networkConfig";

export const queryState = async (stateID: string) => {
    const state = await suiClient.getObject({
        id: stateID,
        options: {
            showContent: true,
        }
    })
    return state
}
