// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract FarmerToSeedCompany{
 address owner;    
         event StoredValues(
         address FarmerEA,
         address CallerEA,
         address SeedCompanyEA,
         string RequestedQuant,
         string Price,
         string ContractState,
         string FarmerState,
         string SeedCompanyState,
         uint256 timestamp
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
     function Event1(bool IsPaid, address) external isWhitelisted(msg.sender) WhenPaid(IsPaid) {
        emit StoredValues(
    
           0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
           msg.sender,
           0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
           "100 kg",
           "3643 taka",
           "Seed request submitted",
           "Wait For Seeds",
           "Agree To Sell",
           block.timestamp
           );
     } 
    modifier isWhitelisted(address _address) {
    require(whitelistedAddresses[_address], "You need to be whitelisted");
  _;
}
    modifier WhenPaid(bool IsPaid){
    require(IsPaid==true,"seed price not paid");
     _;
     }

}
