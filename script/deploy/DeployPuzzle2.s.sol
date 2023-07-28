// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import { F1A9 } from "@/contracts/puzzles/puzzle-02/F1A9.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle2 is DeployPuzzleBase {

    F1A9 public f1A9;

    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        f1A9 = new F1A9();
        ICurta(CURTA_ADDR).addPuzzle(f1A9, 1);


        console.log("Puzzle Address: ", address(f1A9));

        vm.stopBroadcast();
    }
}
