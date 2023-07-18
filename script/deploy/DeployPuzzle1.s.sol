// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/Test.sol";

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import {TwoTimesFourIsEight} from "@/contracts/puzzles/puzzle-01/TwoTimesFourIsEight.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeploySolidityPuzzle is Script {

    TwoTimesFourIsEight public twoTimesFourIsEight;
    ICurta constant CURTA_ADDR = ICurta(0x00000000eCf2b58C296B47caC8C51467c0e307cE);


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