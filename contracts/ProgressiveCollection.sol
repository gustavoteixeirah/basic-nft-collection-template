// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YourCollectionNameHere is ERC721, Ownable {
    uint256 public tokenCount = 0;

    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("Your Collection Name Here", "ABBREVIATION") {}

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(_exists(tokenId), "URI query for nonexistent token");

        return _tokenURIs[tokenId];
    }

    function mint(string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, getNextTokenId());

        _tokenURIs[tokenCount] = _tokenURI;
    }

    function getNextTokenId() private returns (uint256) {
        tokenCount += 1;
        return tokenCount;
    }
}
