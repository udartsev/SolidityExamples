pragma solidity ^0.5.6;

contract Project{
    
    struct Person {
        address addr;
        uint funds;
    }
    
    mapping (uint256 => Person) personas;
    uint256 public totalPersonas;
    
    constructor () public {
        personas[0].addr = address(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
        personas[0].funds = 10;
        personas[1].addr = address(0x0);
        personas[1].funds = 20;
        totalPersonas = 2;
    }
    
    function getAllAddreses()
        public
        view
         returns (address[] memory)
    {
        address[] memory addrs = new address[](totalPersonas);
        //address[] memory addrs;
        
        for (uint i = 0; i < totalPersonas; i++) {
            addrs[i] = personas[i].addr;
        }
        
        return (addrs);
    }
}
