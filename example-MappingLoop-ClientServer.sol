pragma solidity ^0.5.7;

/**
 * Thant example created by Vladimir S. Udartsev
 * That examples shows, how to use Solidity language in smart contract development
 * Origin: https://github.com/udartsev/SolidityExamples
 *
 * @dev Testing the loop mapping
 */
contract MappingLoopServer {
    /*
     * @dev Input sample data in structs and mappings
     */
	constructor() public {
		structs[0][0].amount = 10;
		structs[0][1].amount = 20;
		structs[0][2].amount = 70;
	
		totalStructs[0] = 2;
    }
    
    /*
	 * @dev Struct structure and mapping
	 */
	struct Struct {
		address addr;
		uint256 amount;
	}
	mapping (uint256 => mapping (uint256 => Struct)) internal structs;
    mapping (uint256 => uint256) public totalStructs;
    
    /*
     * @dev Public function
     */
    function getAmount(uint256 mappingId, uint256 structId) public view returns (uint256) {
        require(structs[mappingId][structId].amount > 0);
        return structs[mappingId][structId].amount;
    }
    
	/*
	 * @dev Function looping FOR
	 */
	function simpleLoopFor (uint256 id) public view returns(uint256) {
        require (totalStructs[id] > 0);
       	uint256 totalAmount;
		for(uint8 i=0; i<= totalStructs[id]; i++){
            uint256 amount = structs[id][i].amount;
            totalAmount = totalAmount + amount;
        }
        return totalAmount;
    }
}

/**
 * @dev Testing the loop mapping 1
 */
contract MappingLoopClient{
    
    address addr;
    
    constructor(address serverAddr) public {
       addr = serverAddr;
    }
	/*
	 * @dev Function looping FOR
	 */
	function loopClient (uint256 id, uint256 limit) public view returns(uint256) {
       	uint256 totalAmount;
        uint256 totalStructs;
        totalStructs = MappingLoopServer(addr).totalStructs(id);
		
		for(uint256 i=0; i<= totalStructs; i++){
            uint256 amount = MappingLoopServer(addr).getAmount(id,i);
            
            if (amount > limit) {
                totalAmount = totalAmount + amount;
            }
        }
        return totalAmount;
    }
}
