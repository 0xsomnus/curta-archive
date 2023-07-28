// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./DeployPuzzleBase.s.sol";
import {TwoTimesFourIsEight} from "@/contracts/puzzles/puzzle-01/TwoTimesFourIsEight.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle1 is DeployPuzzleBase {

    TwoTimesFourIsEight public twoTimesFourIsEight;

    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        twoTimesFourIsEight = new TwoTimesFourIsEight();
        ICurta(CURTA_ADDR).addPuzzle(twoTimesFourIsEight, 1);

        console.log("Puzzle Address: ", address(twoTimesFourIsEight));

        vm.stopBroadcast();
    }
}