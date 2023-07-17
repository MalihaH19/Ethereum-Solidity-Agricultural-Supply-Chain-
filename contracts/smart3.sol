// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract WholesalerToRetailer{
 address owner;    
         event StoredValues(
         address WholesalerEA,
         address CallerEA,
         address RetailerEA,
         string PurchasedQuant,
         string Price,
         string ContractState,
         string WholesalerState,
         string RetailerState,
         uint256 DateofPurchase
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
     function Event1(bool Agreed, address, bool IsPaid ) external isWhitelisted(msg.sender) WhenAgreed(Agreed) WhenPaid(IsPaid) {
        emit StoredValues(
    
           0x617F2E2fD72FD9D5503197092aC168c91465E7f2,
           msg.sender,
           0x17F6AD8Ef982297579C203069C1DbfFE4348c372,
           "40 kg",
           "2204 taka",
           "Sale Request Agreed",
           "Rice sold to Retailer",
           "Delivered Successfully",
           block.timestamp
           );
     } 
    modifier isWhitelisted(address _address) {
    require(whitelistedAddresses[_address], "You need to be whitelisted");
  _;
}
    modifier WhenAgreed(bool Agreed){
    require(Agreed==true,"Sale reequest not agreed");
     _;
}
    modifier WhenPaid(bool IsPaid){
        require(IsPaid==true,"Patment not successful");
  _;
    }

}
