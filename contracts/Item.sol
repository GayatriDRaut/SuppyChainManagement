pragma solidity >=0.7.0 <0.9.0;
import "./ItemManager.sol";
contract Item{
    uint public priceInWei;
    uint public index;
    uint public paidAlready;
    ItemManager parentContract;
    constructor(ItemManager _parentContract, uint _priceInWei , uint _index) {
        priceInWei=_priceInWei;
        index =_index;
        parentContract= _parentContract;
    }
    receive() external payable{
        require(paidAlready ==0  , "Price is paid already");
        require(priceInWei== msg.value , "Only full payment allowed");
        paidAlready+=msg.value;
       (bool success,)= address(parentContract).call{value :msg.value}(abi.encodeWithSignature("triggerPayment(uint256)", index));
       require(success, "The transaction wasn't successful , canceling...");
        
    }
    fallback() external{}
}
