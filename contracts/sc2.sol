// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract test{
mapping(address => bool) public whitelisted;
event StoredValues(
         string MerkleRoot
         );

 modifier _whitelisted() {
    require(whitelisted[msg.sender]);
    _;                                                                                                                                                                                                                                         
}
function foo() _whitelisted public
{
 emit StoredValues(
         "a99f5bde46617b3d7e09efdceac8f8f97c22cc8bf0c4f9422739c080ce01c256"
           );
}
} 