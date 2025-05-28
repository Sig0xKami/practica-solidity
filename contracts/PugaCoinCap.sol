// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    uint256 public immutable maxSupply;
    constructor(address initialOwner, uint256 _maxSupplay)
        ERC20("MyToken", "MTK")
        Ownable(initialOwner)
    {
        maxSupply = _maxSupplay;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <=maxSupply, "Max supplay exceeded");
        _mint(to, amount);
    }
}