module feline_gene::cat_coin {
    use sui::coin::{Self, Coin, TreasuryCap };
    use sui::url::{Self, Url};

    public struct Dried_Fish_Coin has drop{}

    fun init(witness: Dried_Fish_Coin, ctx: &mut TxContext) {
        let (treasurey_cap, metadata) = coin::create_currency<Dried_Fish_Coin>(
            witness,
            12,
            b"DFC",
            b"Dried Fish Coin",
            b"The food for cats",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/49566393")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasurey_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<Dried_Fish_Coin>, 
        amount: u64, 
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(
        treasury_cap: &mut TreasuryCap<Dried_Fish_Coin>,
        coin: Coin<Dried_Fish_Coin>
    ){
        coin::burn(treasury_cap, coin);
    }
}