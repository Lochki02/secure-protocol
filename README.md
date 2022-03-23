<h1 align="center">Welcome to Secure protocol solidity 👋</h1>
<p>
</p>

> A standard that secures contracts by managing and sharing ownership off-chain.

## How does it work???

This Secure protocol is a fork of [@Openzeppelin/Ownable.sol](https://github.com/OpenZeppelin). We added the interaction with the merkle tree method to enhance the security of the ownership.
By creating hashed mnemonic phrases off-chain we create a key based system to define roles of owner and collaborators, by default the merkletree should contain 2 keys:
  **1-** The private key only usable by the owner.
  **2-** A second key to be shared with your collaborators, of course this key is limited compared to the first one.
With this standard the ownership of the contract is managed in a more agile and secure way. It is also less expansive to share ownership
of the contract, with this standard you don't have to add a member to a data structure, you just have to share the already created key.
We offer 2 modifiers to operate:
noParaxites ==> This is used for limiting a certain function to the owner and collaborators.
ownerAction ==> This is used for limiting a certain function only to the owner, it won't be accessible even to the collaborators.

## Example Usage

Let's say that you have a presale handler and you want to limit those relative actions to the owner and collaborators of the contract.

```sh
function turnOnPresale (bytes32 key, bytes32[] memory keyProof) public view noParaxites(key, keyProof){
  //TODO
}
```
Now let's limit this action just to the owner.

```sh
function turnOnPresale (bytes32[] memory _proof) public view ownerAction(_proof){
  //TODO
}
```

The **noParaxite** modifier checks if the key passed to use a certain function is valid.
The **ownerAction** modifier checks if the one using the function is the owner of the contract, this is for extremely limited functions.


## Author

👤 **Davide Giacò**

* Github: [@Lochki](https://github.com/Lochki02)
* Linktree: [Lochki](https://linktr.ee/lochki)

__Shoutout to [NFTchef](https://github.com/nftchef) who reviewd the code and gave me some advices__

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
