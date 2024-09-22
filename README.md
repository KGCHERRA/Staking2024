## Members

1. Gabriela Carvajal Herra
2. Josue Arroyo Aráuz
3. Álvaro Araya Obando
4. Jose Cruz

# Staking Contract

This is a Solidity smart contract that implements a staking mechanism for ERC20 tokens. Users can stake tokens to earn rewards based on the duration and amount of their stake. The contract is designed to be secure and efficient, utilizing OpenZeppelin libraries for access control, pausing, reentrancy protection, and safe token transfers. Also, only pre approved users can stake tokens in the contract.

## Features

- **Stake Tokens:** Users can stake approved tokens to earn rewards.
- **Claim Rewards:** Users can claim rewards accumulated based on their staked amount and the time staked.
- **Unstake Tokens:** Users can unstake their tokens along with any pending rewards.
- **Owner Control:** The contract owner can approve users, set the reward rate, and pause/unpause the contract.
- **Pause/Unpause:** The contract owner can pause or unpause the contract
- **Approve:** The contract owner must approve any user's address before they can use the contract

## Patterns used

As mentioned before, we used some patterns to have a more efficient and secure code:

- **Ownable:** Only contract owner can execute some functionality in the code. For example: approve contract users, change the rewardRate, pause and unpause the contract
- **Pausable**:  The contract can be paused/unpaused if any unexpected issue makes this necessary
- **Reentrancy Guard:**  To prevent reentrancy attacks 

## Prerequisites

- Solidity version: `^0.8.0`
- OpenZeppelin Contracts: Make sure to install the OpenZeppelin contracts library.

## Installation

To install the required OpenZeppelin contracts, use npm:

```bash
npm install @openzeppelin/contracts
