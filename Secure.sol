// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/*
    This Secure protocol is a fork of @openzeppelin/Ownable.sol. We added the interaction with the merkle tree method to enhance the security of the ownership.
    By creating hashed mnemonic phrases off-chain we create a key based system to define roles of owner and collaborators, by default the merkletree should contain 2 keys:
    1- The private key only usable by the owner.
    2- A second key to be shared with your collaborators, of course this key is limited compared to the first one.
    With this standard the ownership of the contract is managed in a more agile and secure way. It is also less expansive to share ownership
    of the contract, with this standard you don't have to add a member to a data structure, you just have to share the already created key.

    We offer 2 modifiers to operate:

    noParaxites ==> This is used for limiting a certain function to the owner and collaborators.
    ownerAction ==> This is used for limiting a certain function only to the owner, it won't be accessible even to the collaborators.
*/

abstract contract Secure{
    bytes32 private merkleRoot;
    string private mnemonicForOwner;

    /**
     * @dev Initializes the contract setting the root of the merkle as root
     * and the private hashed mnemonic phrase of the owner as ownerKey
     */
    constructor(
        bytes32 root,
        string ownerKey
    ) {
        setRoot(root);
        setOwnerKey(ownerKey);
    }

    /**
    * @dev This function returns the root of the merkle tree.
    */
    function _getRoot() private view returns(bytes32){
        return merkleRoot;
    }

    /**
    * @dev This function sets the root of the merkle tree,
    * This action is limited to the owner as he's the only one that should manage the keys.
    */
    function setRoot(bytes32 _newRoot, bytes32[] memory _proof)
        public 
        ownerAction(_proof)
    {
        merkleRoot = _newRoot;
    }


    /*
    * @dev This modifier checks if the key passed to use a certain function is valid
    */
    modifier noParaxites(string memory _key, bytes32[] memory _proof){
        bool verification = MerkleProof.verify(_proof, _getRoot(), _key);
        require(verification, "Paraxite identified: if you are the owner check your proof!");
        _;
    }

    /*
    * @dev This modifier checks if the one using the function is the owner of the contract, this is for extremely limited functions
    */

    modifier ownerAction(bytes32[] memory _proof){
        bool verification = MerkleProof.verify(_proof, _getRoot(), mnemonicForOwner);
        require(verification, "Secure protocol: This action is reserved for the owner, if you are the owner check your proof!");
        _;
    }

    // THESE ARE PRIVATE FUNCTIONS FOR THE CONTRACT CONSTRUCTOR

    function setRoot(bytes32 _newRoot) private{
        merkleRoot = _newRoot;
    }

    function setOwnerKey(string memory _newMnemonic) private{
        mnemonicForOwner = _newMnemonic;
    }
}
