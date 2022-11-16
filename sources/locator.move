module storage::locator{

    use sui::object::{Self, ID, UID};
    use sui::tx_context::{TxContext};
    use std::string::{Self, String};

    struct Locator has key, store{
        id: UID,
        subinv_id: ID,
        segment1: String,
        segment2: String,
        segment3: String,
        segment4: String
    }

    public fun segment1(loc: &Locator): String{
        loc.segment1
    }

    public fun segment2(loc: &Locator): String{
        loc.segment2
    }
    
    public fun segment3(loc: &Locator): String{
        loc.segment3
    }
    
    public fun segment4(loc: &Locator): String{
        loc.segment4
    }

}