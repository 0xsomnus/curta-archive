// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";

import { AuthorshipToken } from "@/AuthorshipToken.sol";
import { BaseRenderer } from "@/BaseRenderer.sol";
import { Curta } from "@/Curta.sol";
import { IPuzzle } from "@/interfaces/IPuzzle.sol";
import { ITokenRenderer } from "@/interfaces/ITokenRenderer.sol";
import { MockPuzzle } from "@/utils/mock/MockPuzzle.sol";
import { LibRLP } from "@/utils/LibRLP.sol";

/// @notice A base test contract for Curta. In `setUp`, it deploys an instance
/// of `AuthorshipToken` and `Curta`. Additionally, it funds 2 addresses
/// `0xBEEF` and `0xC0FFEE` with 1000 ether for testing. It also contains a few
/// helper functions.
contract BaseTest is Test {
    // -------------------------------------------------------------------------
    // Contracts
    // -------------------------------------------------------------------------

    /// @notice The Authorship Token contract.
    AuthorshipToken internal authorshipToken;

    /// @notice The base renderer contract for Curta.
    BaseRenderer internal tokenRenderer;

    /// @notice The Curta contract.
    Curta internal curta;

    /// @notice A mock puzzle contract.
    /// @dev This instance of `MockPuzzle` is just used for its functions (i.e.
    /// not directly accessed in tests).
    MockPuzzle internal mockPuzzle;

    // -------------------------------------------------------------------------
    // Setup
    // -------------------------------------------------------------------------

    function setUp() public {
        // Transaction #1.
        tokenRenderer = new BaseRenderer();

        // Curta will be deployed on transaction #3.
        address curtaAddress = LibRLP.computeAddress(address(this), 3);

        // Transaction #2.
        authorshipToken = new AuthorshipToken(curtaAddress, "");

        // Transaction #3.
        curta = new Curta(ITokenRenderer(address(tokenRenderer)), authorshipToken);

        vm.deal(address(0xBEEF), 1000 ether);
        vm.deal(address(0xC0FFEE), 1000 ether);

        // Transaction #4.
        mockPuzzle = new MockPuzzle();
    }

    // -------------------------------------------------------------------------
    // Helper Functions
    // -------------------------------------------------------------------------

    /// @notice Deploys and adds a puzzle to Curta.
    /// @param _as The address to deploy the puzzle as.
    function _deployAndAddPuzzle(address _as) internal {
        MockPuzzle puzzle = new MockPuzzle();
        _mintAuthorshipToken(_as);

        vm.startPrank(_as);
        curta.addPuzzle(IPuzzle(puzzle), authorshipToken.totalSupply());
        vm.stopPrank();
    }

    /// @notice Mints an Authorship Token to `_to` by acting as Curta.
    /// @param _to The address to mint the token to.
    function _mintAuthorshipToken(address _to) internal {
        vm.prank(address(curta));

        authorshipToken.curtaMint(_to);
    }

    /// @notice Submits a solution to the puzzle of ID `_puzzleId` as `_as`.
    /// @dev The puzzle is assumed to be `MockPuzzle`.
    /// @param _puzzleId The ID of the puzzle to solve.
    /// @param _as The address to solve the puzzle as.
    function _solveMockPuzzle(uint32 _puzzleId, address _as) internal {
        uint256 solution = mockPuzzle.getSolution(_as);

        vm.startPrank(_as);
        curta.solve(_puzzleId, solution);
        vm.stopPrank();
    }
}