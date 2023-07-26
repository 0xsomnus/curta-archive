// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

contract DeployPuzzle9 {
  function deploy() public {
    // Deploy a new instance of the puzzle
    address addr = HuffDeployer.deploy("/puzzles/Puzzle-09/Antikythera");
    console.log("Antikythera address: ", addr);
  }
}