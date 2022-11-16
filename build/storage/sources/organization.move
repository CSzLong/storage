module storage::organization{

    //use sui::object::{Self, ID, UID};
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext};
    //use std::string::{String};
    //use sui::transfer;
    
    struct Organization has key, store{
        id: UID,
        name: vector<u8>,
        code: vector<u8>
    }
    
    const ENOT_MATCH: u64 = 10;

    public fun name(org: &Organization): vector<u8>{
        org.name
    }
    
    public fun code(org: &Organization): vector<u8>{
        org.code
    }
    
    public entry fun create(name: vector<u8>, code: vector<u8>, ctx: &mut TxContext): Organization{
        let org = Organization{
            id: object::new(ctx),
            name: name,
            code: code
        };
        assert!(name(&org) == name && code(&org) == code, ENOT_MATCH);
        org
    }

    #[test]
    public fun test_create(){
        
        use sui::tx_context;
        use std::debug;
        use sui::transfer;
        
        let ctx = tx_context::dummy();
        
        let org = create(b"SWNT-Nantong Plant", b"829", &mut ctx);
        
        let test_id = object::id(&org);
        transfer::transfer(org, tx_context::sender(&ctx));
        debug::print(&test_id);
    }
}