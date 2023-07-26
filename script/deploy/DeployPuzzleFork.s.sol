// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {DeployPuzzle1} from "./DeployPuzzle1.s.sol";
import {DeployPuzzle2} from "./DeployPuzzle2.s.sol";
import {DeployPuzzle3} from "./DeployPuzzle3.s.sol";
import {DeployPuzzle4} from "./DeployPuzzle4.s.sol";
import {DeployPuzzle6} from "./DeployPuzzle6.s.sol";
import {DeployPuzzle7} from "./DeployPuzzle7.s.sol";
import {DeployPuzzle8} from "./DeployPuzzle8.s.sol";
import {DeployPuzzle9} from "./DeployPuzzle9.s.sol";
import {DeployPuzzle10} from "./DeployPuzzle10.s.sol";
import {DeployPuzzle11} from "./DeployPuzzle11.s.sol";
import {DeployPuzzle12} from "./DeployPuzzle12.s.sol";
import {DeployPuzzle13} from "./DeployPuzzle13.s.sol";
import {DeployPuzzle14} from "./DeployPuzzle14.s.sol";

contract DeployPuzzleFork {
    function run() public {
        DeployPuzzle1().run();
        DeployPuzzle2().run();
        DeployPuzzle3().run();
        DeployPuzzle4().run();
        DeployPuzzle5().run();
        DeployPuzzle6().run();
        DeployPuzzle7().run();
        DeployPuzzle8().run();
        DeployPuzzle9().run();
        DeployPuzzle10().run();
        DeployPuzzle11().run();
        DeployPuzzle12().run();
        DeployPuzzle13().run();
        DeployPuzzle14().run();
    }
}