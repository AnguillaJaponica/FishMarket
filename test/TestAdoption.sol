pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint expectedFishId = 8;

    //The expected owner of adopted fish is this contract
    address expectedAdopter = address(this);

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedFishId);

        Assert.equal(returnedId, expectedFishId, "Adoption of the expected fish should match what is returned.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedFishId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected fish should be this contract");
    }

    // Testing retrieval of all fish owners
    function testGetAdopterAddressByFishIdInArray() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedFishId], expectedAdopter, "Owner of the expected fish should be this contract");
    }
}
