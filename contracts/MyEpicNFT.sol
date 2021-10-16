//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

//Importing OpenSeppelinContracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


// Inherit the imported contract to access the contracts methods
// Counters will keep track of token ID as we increment
contract MyEpicNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

constructor() ERC721 ("KaylahNFT", "KAYLAH") {
  console.log("This is my NFT contract!");
}


//Functions users will hit to claim the NFT
function makeAnEpicNFT() public {
//Get current token id
  uint256 newItemId = _tokenIds.current();

  //Mint the NFT and send to users
  _safeMint(msg.sender, newItemId);

  //Declare NFT data
  _setTokenURI(newItemId, "https://jsonkeeper.com/b/IEV3");

  //Increment the counter fro when the NFT is minted
  _tokenIds.increment();
  }
}
