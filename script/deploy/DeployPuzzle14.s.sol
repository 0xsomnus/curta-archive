// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import "./DeployPuzzleBase.s.sol";

contract DeployPuzzle14 is DeployPuzzleBase {
  function run() public {
    // Deploy a new instance of the puzzle
    address addr = HuffDeployer.deploy("/puzzles/Puzzle-14/SacredGeometry");
    console.log("Labyrinth address: ", addr);

    ICurta(CURTA_ADDR).addPuzzle(IPuzzle(addr), 1);
  }
}
