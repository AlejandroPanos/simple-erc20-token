# SimpleToken

A minimal ERC20 token contract built on Solidity using OpenZeppelin's audited ERC20 implementation. Deployed with a fixed name and symbol, and an initial supply minted entirely to the deployer at deployment time.

---

## What It Does

- Deploys a standard ERC20 token with the name SimpleToken and symbol ST
- Mints the entire initial supply to the deployer on deployment
- Supports all standard ERC20 operations — transfers, approvals, and transferFrom — inherited from OpenZeppelin

---

## Project Structure

```
.
├── src/
│   └── SimpleToken.sol             # ERC20 token contract
├── script/
│   └── DeploySimpleToken.s.sol     # Foundry deploy script
└── test/
    └── TestSimpleToken.t.sol       # Unit tests
```

---

## Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed

### Install dependencies and build

```bash
forge install
forge build
```

### Run tests

```bash
forge test
```

### Deploy to a local Anvil chain

In one terminal, start Anvil:

```bash
anvil
```

In another terminal, run the deploy script:

```bash
forge script script/DeploySimpleToken.s.sol --rpc-url http://localhost:8545 --broadcast
```

### Deploy to Sepolia

```bash
forge script script/DeploySimpleToken.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast
```

---

## Contract Overview

### State

| Variable | Type     | Description              |
| -------- | -------- | ------------------------ |
| `NAME`   | `string` | Token name — SimpleToken |
| `SYMBOL` | `string` | Token symbol — ST        |

### Functions

All standard ERC20 functions are inherited from OpenZeppelin and available out of the box — `transfer`, `transferFrom`, `approve`, `allowance`, `balanceOf`, `totalSupply`, `name`, `symbol`, `decimals`.

| Function                             | Visibility      | Description                                                         |
| ------------------------------------ | --------------- | ------------------------------------------------------------------- |
| `constructor(uint256 initialSupply)` | `public`        | Deploys the token and mints the full initial supply to the deployer |
| `getTokenName()`                     | `external pure` | Returns the token name                                              |
| `getTokenSymbol()`                   | `external pure` | Returns the token symbol                                            |

---

## Tests

| Test                                    | What It Checks                                    |
| --------------------------------------- | ------------------------------------------------- |
| `testTokenNameIsSetCorrectly`           | Token name is set to SimpleToken                  |
| `testTokenSymbolIsSetCorrectly`         | Token symbol is set to ST                         |
| `testInitialBalanceMatchesJohnsBalance` | Initial supply is transferred correctly           |
| `testAlicesBalanceStartsAsZero`         | New addresses start with zero balance             |
| `testTransferBetweenTwoWorksCorrectly`  | Direct transfers between addresses work correctly |
| `testAllowancesWorkBetweenTwoSenders`   | Approval and transferFrom flow works correctly    |

---

## Dependencies

- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) — audited ERC20 implementation

---

## License

MIT
