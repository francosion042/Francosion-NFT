//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract FrancosionNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor () ERC721 ("Francosion NFT", "FNFT") {
        console.log('Hello, this is Francosion NFT');
    }

     // A function our user will hit to get their NFT.
    function mintNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(newItemId, 'https://gateway.pinata.cloud/ipfs/QmReH3b5GX2uMJh54zPuMzPBhHJSXkqL2ZVN1rjbsBR6pg/FNFT.json');

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();

        console.log("An NFT with ID %s has been minted to %s", newItemId, msg.sender);
    }
}
