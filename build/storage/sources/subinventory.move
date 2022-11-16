module storage::subinventory{

    use sui::object::{Self, ID, UID};
    use sui::tx_context::{TxContext};
    use std::string::{Self, String};
    //use sui::transfer;
    
    struct Subinventory has key, store{
        id: UID,
        org_id: ID,
        org: String,
        segment: String
    }
    
    const ENOT_MATCH: u64 = 10;
    
    public fun org(subinv: &Subinventory): String{
        subinv.org
    }
    
    public fun segment(subinv: &Subinventory): String{
        subinv.segment
    }
    
    public entry fun create(org_id: ID, org: vector<u8>, segment: vector<u8>, ctx: &mut TxContext): Subinventory{
        let subinv = Subinventory{
            id: object::new(ctx),
            org_id: org_id,
            org: string::utf8(org),
            segment: string::utf8(segment)
        };
        assert!(org(&subinv) == string::utf8(org) && segment(&subinv) == string::utf8(segment), ENOT_MATCH);
        subinv
    }

    #[test]
    public fun test_create(){
        
        use sui::tx_context;
        use std::debug;
        use sui::transfer;
        use storage::organization;

        let ctx = tx_context::dummy();

        let org = organization::create(b"SWNT Nantong Plant", b"829", &mut ctx);
        debug::print(&0);
        debug::print(&object::id(&org));
        
        let subinv = create(object::id(&org), b"829", b"001", &mut ctx);

        debug::print(&subinv);
        
        let test_id = object::id(&subinv);

        transfer::transfer(subinv, tx_context::sender(&ctx));
        transfer::transfer(org, tx_context::sender(&ctx));
        debug::print(&1);
        debug::print(&test_id)
    }
}