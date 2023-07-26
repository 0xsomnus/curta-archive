// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/Test.sol";

import { ICurta } from "@/contracts/interfaces/ICurta.sol";

contract DeployPuzzleBase is Script {
    // replace this with the curta address from DeployFork.s.sol
    ICurta constant CURTA_ADDR = ICurta(0x00000000eCf2b58C296B47caC8C51467c0e307cE);
}