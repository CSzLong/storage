module storage::onhand{
    
    use sui::object::{Self, ID, UID};
    use sui::tx_context::{TxContext};
    use std::string::{String};
    use sui::transfer;
    
    struct Onhand has key, store{
        id: UID,
        org_code: String,
        subinventory: String,
        locator: String,
        item: String,
        
    }

    const EONHAND_NOT_MATCH: u64 = 10;
    
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
}