pragma solidity ^0.5.7;

/* mapping VS struct */
/* gas costs simulation */

contract Mapping {
    
    mapping (uint256 => uint256) internal id;
    mapping (uint256 => string) internal name;
    mapping (uint256 => address) internal addr;
    
    uint256 totalIds;
    
    function save(
            uint256 _id,
            string memory _name,
            address _addr
        ) 
        public
        returns (bool){
            totalIds++;
            id[totalIds] = _id;
            name[totalIds] = _name;
            addr[totalIds] = _addr;
        return true;
    }
    
    function read(
            uint256 _id
        ) 
        public
        view
        returns (
            uint256,
            string memory,
            address
        ){
        return(   
            id[_id],
            name[_id],
            addr[_id]
        );
    }
    
}

contract Struct {
    
    struct Test {
        uint256 id;
        string name;
        address addr;
    }
    mapping (uint256 => Test) tests;
    
    uint256 totalIds;
    
    function save(
            uint256 _id,
            string memory _name,
            address _addr
        ) 
        public
        returns (bool){
            totalIds++;
            
            tests[totalIds].id = _id;
            tests[totalIds].name = _name;
            tests[totalIds].addr = _addr;
        
        return true;
    }
    
    function read(
            uint256 _id
        ) 
        public
        view
        returns (
            uint256,
            string memory,
            address
        ){
        return(   
            tests[_id].id,
            tests[_id].name,
            tests[_id].addr
        );
    }
      
}
