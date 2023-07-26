// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzleBase} from "./DeployPuzzleBase.s.sol";
import {Chess} from "@/contracts/puzzles/puzzle-10/Chess.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle10 is Script {

    Chess public chess;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        chess = new Chess();
        ICurta(CURTA_ADDR).addPuzzle(chess, 1);


        console.log("Puzzle Address: ", address(chess));

        vm.stopBroadcast();
    }
}