<h1 align="center">Welcome to Secure protocol solidity 👋</h1>
<p>
</p>

> A standard that secures the contract with a Merkle tree key system

## How does it work???

This code is an updated version of the `Ownable.sol` developed by [@Openzeppelin](https://github.com/OpenZeppelin). Using the [Merkle tree generator](https://github.com/Paraxite/merkle-tree-generator) method off-chain you can create keys to interact with the restricted-to-owner methods.
This way if your wallet gets hacked, your smart contract will be totally safe becouse the hacker won't possess the keys for your functions even if he possesses your wallet.

Of course before uploading the contract you should build a merkle tree and store the relative proofs along with the owner address of the contract.

## Example Usage

Let's say that you have a presale handler and you want to limit those relative actions to the owner of the contract.

```sh
function turnOnPresale (bytes32[] memory key) public view noParaxites(msg.sender) checkKey("turnOnPresale", key){
  //TODO
}
```

The **noParaxite** modifier checks if the user calling the function is actually the owner stored inside the tree.
The **checkKey** modifier checks if the key provided by the user calling the function matches with the id `turnOnPresale` stored inside the tree.


## Author

👤 **Davide Giacò**

* Github: [@Paraxite](https://github.com/Paraxite)
* Linktree: [Paraxite](https://linktr.ee/paraxite)
* Paypal (if this code was useful ❤️): [Granjalf](https://paypal.me/granjalf)

__Shoutout to [NFTchef](https://github.com/nftchef) who reviewd the code and gave me some advices__

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
