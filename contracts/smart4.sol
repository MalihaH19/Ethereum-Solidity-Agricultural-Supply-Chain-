// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract RetailerToCustomer{
 address owner;    
         event StoredValues(
         address RetailerEA,
         address CallerEA,
         address CustomerEA,
         string PurchasedQuant,
         string Price,
         string ContractState,
         string RetailerState,
         string CustomerState
         
         );
    constructor() {
        owner = msg.sender; 
    }
    modifier onlyOwner() {
    require(msg.sender == owner, "Ownable: caller is not the owner");
    _;
}
    mapping(address => bool) whitelistedAddresses;

    function addUser(address _addressToWhitelist) public onlyOwner {
    whitelistedAddresses[_addressToWhitelist] = true;
}
    function verifyUser(address _whitelistedAddress) public view returns(bool) {
    bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
    return userIsWhitelisted;
} 
    
     function Event1( address, bool IsPaid ) external isWhitelisted(msg.sender) WhenPaid(IsPaid) {
        emit StoredValues(
    
           0x17F6AD8Ef982297579C203069C1DbfFE4348c372,
           msg.sender,
           0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678,
           "100 kg",
           "4503 taka",
           "Rice Sold to Customers",
           "Rice sale Successful",
           "Purchase sucessful"
           );
     } 
    modifier isWhitelisted(address _address) {
    require(whitelistedAddresses[_address], "You need to be whitelisted");
  _;
}
    modifier WhenPaid(bool IsPaid){
        require(IsPaid==true,"Payment not successful");
  _;
    }
}