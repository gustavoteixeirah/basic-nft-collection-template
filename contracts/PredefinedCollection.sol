// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YourCollectionNameHere is ERC721, Ownable {
    uint256 public constant MAX_SUPPLY = 100;
    uint256 public tokenCount = 0;

    constructor() ERC721("Your Collection Name Here", "ABBREVIATION") {}

    modifier quantityIsOk(uint256 amount) {
        require(
            tokenCount + amount <= MAX_SUPPLY,
            "Minting would exceed max supply."
        );
        _;
    }
    
    //TODO: Decidir se esse mint será pago ou não
    function mint(uint256 amount) public payable quantityIsOk(amount) {
        for (uint256 i = 0; i < amount; i++) {
            _safeMint(msg.sender, getNextTokenId());
        }
    }

    function getNextTokenId() private returns (uint256) {
        tokenCount += 1;
        return tokenCount;
    }
}
