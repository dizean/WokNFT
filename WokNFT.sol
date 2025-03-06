// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WokNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter = 0;
    
    constructor() ERC721("War of Tokers NFT", "WokNFT") Ownable(msg.sender) {}

    function mint(address recipient, string memory uri) external onlyOwner returns (uint256) {
        require(_tokenIdCounter < 1000, "Max supply reached");
        
        _tokenIdCounter += 1;

        _mint(recipient, _tokenIdCounter);
        _setTokenURI(_tokenIdCounter, uri);

        return _tokenIdCounter;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;
    }
}
