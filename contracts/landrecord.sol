pragma solidity ^0.6.12;
contract Landrecord{
    
    struct property{
     
     string addr;
     string ownername;
     uint price;
     }
  
     address owner; 
      constructor() public{
        owner = msg.sender;
     }
    
     modifier onlycreater() {
        require(owner == msg.sender);
       _;
    }
    
    mapping(string => property) properties;
   
    function propertydetails(string memory _addr,string memory _ownername, uint _price) public onlycreater {
        properties[_addr].addr = _addr;
        properties[_addr].ownername=_ownername;
        properties[_addr].price = _price;
        }
        
     function changepropertyowner(string memory _addr,string memory _ownername) public onlycreater {
               properties[_addr].ownername=_ownername;
        }    
        
    function getpropertydetails(string memory _addr) public view onlycreater returns(string memory, string memory, uint) {
       return(properties[_addr].addr , properties[_addr].ownername , properties[_addr].price );
        }  
    
    
    function validateIDdetails(string memory _addr) public view returns(bool){
        if(sha256(bytes(properties[_addr].addr)) == sha256 (bytes(_addr)))
        { 
            return true;
        }
         return false;
      }
}//0xd5227e09de544BDD1D6d0d67c4D50142551c2747
