pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    //Adopting fish
    function adopt(uint fishId) public returns (uint){
        require(fishId >= 0 && fishId <= 15);

        adopters[fishId] = msg.sender;

        return fishId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

}