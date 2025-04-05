module feline_gene::dna_nft {
    use sui::display;
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    use std::string::{Self, utf8, String};

    public struct DNA_Witness has drop {}

    public struct DNA_NFT has key, store {
        id: UID,
        name: String,
        image_url: String
    }

    fun init(otw: DNA_Witness, ctx: &mut TxContext) {
        assert!(is_one_time_witness(&otw), 0);

        let publisher = package::claim(otw, ctx);
        
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"Collar NFT"),
            utf8(b"https://example.com/default.png")
        ];
        
        let mut display = display::new_with_fields<DNA_NFT>(
            &publisher, keys, values, ctx
        );
        display::update_version(&mut display);

        transfer::public_transfer(publisher, ctx.sender());
        transfer::transfer(display, ctx.sender());
    }

    /*
    public entry fun mint(
        name: String,
        image_url: String,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = DNA_NFT {
            id: object::new(ctx),
            name,
            image_url
        };
        transfer::public_transfer(nft, recipient);
    }
    */

    public entry fun mint(
        parent_left: DNA_NFT,
        parent_right: DNA_NFT,
        recipient: address,
        ctx: &mut TxContext
    ){
        
    }
}