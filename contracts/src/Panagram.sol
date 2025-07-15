// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC1155} from  "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol"
import {IVerifier} from "./Verifier.sol";

contract panagram is ERC1155,Ownerable {
    IVerifier public immutable verifier;

   event Panagram_VerifierUpdated(IVerifier verifier);
   constructor(IVerifier _verifier) ERC1155("ipfs://QmcxEUp6MCy2GthBVHomcojs5jBABmr5U39v8XRWeHGKB5/{id}.json") Owner(msg.sender){
        verifier = _verifier;
    }
    
    function setVerifier(IVerifier _verifier)  external onlyOwner {
        verifier = _verifier;
        emit Panagram_VerifierUpdated(_verifier)
    }
   
}