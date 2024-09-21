# Staking Contract

This is a Solidity smart contract that implements a staking mechanism for ERC20 tokens. Users can stake tokens to earn rewards based on the duration and amount of their stake. The contract is designed to be secure and efficient, utilizing OpenZeppelin libraries for access control, pausing, reentrancy protection, and safe token transfers.

## Features

- **Stake Tokens:** Users can stake approved tokens to earn rewards.
- **Claim Rewards:** Users can claim rewards accumulated based on their staked amount and the time staked.
- **Unstake Tokens:** Users can unstake their tokens along with any pending rewards.
- **Owner Control:** The contract owner can approve users, set the reward rate, and pause/unpause the contract.

## Prerequisites

- Solidity version: `^0.8.0`
- OpenZeppelin Contracts: Make sure to install the OpenZeppelin contracts library.

## Installation

To install the required OpenZeppelin contracts, use npm:

```bash
npm install @openzeppelin/contracts


## Members

Kristely Gabriela Carvajal Herra
