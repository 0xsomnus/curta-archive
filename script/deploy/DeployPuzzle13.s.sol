// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzleBase} from "./DeployPuzzleBase.s.sol";
import {TwoTimesFourIsEight} from "@/contracts/puzzles/puzzle-13/PingPong.sol";

/// @notice A script to deploy puzzle instances in Solidity. 
/// To deploy puzzles written in Huff, please see DeployHuffPuzzle.s.sol
contract DeployPuzzle13 is Script {

    PingPong public pingPong;
    
    function run() public {

        uint256 deployerKey = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        // Deploy Puzzle and print address to the console.
        pingPong = new PingPong();
        ICurta(CURTA_ADDR).addPuzzle(pingPong, 1);


        console.log("Puzzle Address: ", address(pingPong));

        vm.stopBroadcast();
    }
}