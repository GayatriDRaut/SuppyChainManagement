pragma solidity >=0.7.0 <0.9.0;
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Ownable {
    address payable _owner;
    
    constructor() public{
        _owner = payable(msg.sender);
    }
    modifier onlyOwner(){
        require(isOwner(),"You are not the Owner");
        _;
    }
    function isOwner() public view returns(bool){
        return (msg.sender== _owner);
        
    }
}
