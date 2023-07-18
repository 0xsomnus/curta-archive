// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/Test.sol";

contract DeployLabyrinth {
  function deploy() public {
    // Deploy a new instance of src/test/contracts/Number.huff
    address addr = HuffDeployer.deploy("/puzzles/Puzzle-12/Labyrinth");
    console.log("Labyrinth address: ", addr);
  }
}