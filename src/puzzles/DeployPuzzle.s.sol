// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/Test.sol";

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { TwoTimesFourIsEight } from "@/contracts/puzzles/Puzzle-01/TwoTimesFourIsEight.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeploySolidityPuzzle is Script {

    TwoTimesFourIsEight public twoTimesFourIsEight;
    ICurta constant CURTA_ADDR;


    function run() public {
        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        twoTimesFourIsEight = new TwoTimesFourIsEight();
        // CURTA_ADDR.addPuzzle(twoTimesFourIsEight, )


        console.log("Puzzle Address: ", address(twoTimesFourIsEight));

        vm.stopBroadcast();
    }
}