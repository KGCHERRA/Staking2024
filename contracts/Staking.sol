// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Staking is ERC20, ERC20Permit {
    constructor(IERC20 _stakingToken)
        ERC20("MyToken", "MTK")
        ERC20Permit("MyToken")
    {
        stakingToken = _stakingToken;
        owner = msg.sender;
    }

    IERC20 public stakingToken;
    uint256 public rewardRate = 100;
    uint256 public totalStaked;

    address public owner;

    struct Stake {
        uint256 amount;
        uint256 rewardDebt;
        uint256 lastBlock;
    }

    mapping(address => Stake) public stakes;

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    // Function to stake tokens
    function stake(uint256 _amount) external {
        require(_amount > 0, "Cannot stake 0 tokens");

        // Transfer the staking tokens from the user to the contract
        stakingToken.transferFrom(msg.sender, address(this), _amount);

        // Update staking information
        Stake storage userStake = stakes[msg.sender];
        userStake.amount += _amount;
        userStake.lastBlock = block.number;
        userStake.rewardDebt = pendingRewards(msg.sender);

        totalStaked += _amount;
    }

    // Function to view pending rewards for a user
    function pendingRewards(address _user) public view returns (uint256) {
        Stake memory userStake = stakes[_user];
        uint256 blocksStaked = block.number - userStake.lastBlock;
        return (userStake.amount * rewardRate * blocksStaked) / 1e18;
    }

    // Function to claim rewards
    function claimRewards() public {
        uint256 rewards = pendingRewards(msg.sender);
        require(rewards > 0, "No rewards available");

        // Reset the user's stake reward debt and last block
        Stake storage userStake = stakes[msg.sender];
        userStake.rewardDebt = 0;
        userStake.lastBlock = block.number;

        // Transfer the rewards (here assuming the stakingToken itself is used as rewards)
        stakingToken.transfer(msg.sender, rewards);
    }

    // Function to unstake tokens (with rewards)
    function unstake(uint256 _amount) external {
        Stake storage userStake = stakes[msg.sender];
        require(userStake.amount >= _amount, "Insufficient staked amount");

        // Claim any pending rewards before unstaking
        claimRewards();

        // Reduce the user's staked amount
        userStake.amount -= _amount;
        totalStaked -= _amount;

        // Transfer the staked tokens back to the user
        stakingToken.transfer(msg.sender, _amount);
    }

    // Function to set reward rate (only owner)
    function setRewardRate(uint256 _newRate) external isOwner {
        rewardRate = _newRate;
    }
}