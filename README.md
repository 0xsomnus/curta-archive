# Curta Archive

Curta archive is a suite of helper scripts and contracts enabling users to play and solve Curta puzzles regardless of whether submissions are open or closed on mainnet.

It is designed to be used on a local mainnet fork and all the modifications to the original code are made with that assumption in mind. We use a mainnet fork rather than an empty anvil testnet for compatibility with puzzles that use external contracts deployed on mainnet.

## Changes
| File | Changes | Rationale |
|  -------- | ------- | ---- |
| Curta.sol| Removed limit on puzzle addition for Authorship tokens | Eliminates redundancy since only individual user will add puzzles locally |
|          | Removed Author + Protocol fee logic + Author tipping   | Redundant, see above |
|          | Removed Phase 3 submission reverts                     | Redundant, the point of this suite is to enable players to solve puzzles without worrying about time constraints. Removing the reverts enables users to simultaneously deploy puzzles of their choosing without worry of time for either over sequentially deploying each puzzle |
| Multiple contracts | Added past puzzles and deploy scripts | See description of codebase |
| foundry.toml | Added auto_detect_solc | Though this is against best practice, this flag was set since a few puzzles are compiled with higher solc versions |

## Setup

1. Install foundry first, if you haven't already then clone this repo and install it's dependencies via the following command

    `$ forge install`

2. Next, you'll need to install the [huff compiler](https://github.com/huff-language/huff-rs) as it's needed to deploy challenges written in huff.

3. Clone this repo

NB: Though we're running this on a mainnet fork, we deploy our own Curta instance for a clean state over using the instance present in the fork. Though you can use
this already deployed instance through the `vm.prank()` and `vm.warp()`(can also use --fork-url-block-number) to impersonate other accounts or set the timestamp to before the puzzle closed, this quickly gets more and more complex as more puzzles are added since you need to figure out the time to warp to. Our approach is much simpler in comparison.

4. Create a .env file at the root of the repo with the contents of .env.example and replace the variables with those you intend to use.

> **NB**: You will need to spin up two new, DIFFERENT accounts for `AUTHORSHIP_TOKEN_PRIVATE_KEY` and `CURTA_PRIVATE_KEY` i.e with zero transactions sent(nonce of 0) otherwise the scripts will fail due to incorrect address pre-computation. Unfortunately, you cannot use the accounts auto-generated by Anvil as they have non-zero nonces.

5. Configure DeployFork.s.sol with the account you intend to use. This is optional as you can just use `vm.prank()` and related cheatcodes to impersonate the accounts already present in the script. Just be sure you're interacting with the contracts you've deployed rather than the instances from the mainnet network state. You don't need to add your address multiple times to the `AUTHORS` array since the puzzle addition limit is not present in this suite.

6. Fork mainnet via anvil with an rpc url using the below command. You can get one from various providers, infura and alchemy come to mind. Please this [website](https://chainlist.org/chain/1) for a list of public rpc urls and take your pick.

    `$ anvil --fork-url <rpc-url>`

7. Deploy the main contracts (Curta, AuthorshipToken, FlagRenderer, FlagsERC721) via DeployFork.s.sol and note down the addresses output.

    `$ forge script script/deploy/DeployFork.s.sol:DeployFork`

Deploy the curta puzzle instances. Run `deploy_puzzles.bash` to deploy them all simultaneously or run the scripts individually depending on your preference. Since the time limits and ether requirements for solving a puzzle are removed, deploying them simultaneously has no drawbacks.

## Contributing

Novel curta puzzles will continue to be released. As a result, anyone is encouraged to contribute any new puzzles and their deploy scripts to this repository to save time for anyone else wanting to play past curta puzzles. Additionally, the suite is a bit hacky regarding the puzzles and their deploy scripts despite functionality remaining consistent with their mainnet instances. If the authors have any nitpicks or improvements, please open a PR.