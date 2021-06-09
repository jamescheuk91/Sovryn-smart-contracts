pragma solidity ^0.5.17;

import "../../openzeppelin/Ownable.sol";
import "../../interfaces/IERC20.sol";
import "./IVestingFactory.sol";
import "../../locked/LockedSOV.sol";
import "./VestingRegistry.sol";
import "./VestingRegistry2.sol";
import "./VestingRegistry3.sol";

/**
 * @title Vesting Registry Storage Contract.
 *
 * @notice This contract is just the storage required for vesting registry.
 * It is parent of VestingRegistryProxy and VestingRegistryLogic.
 *
 * @dev Use Ownable as a parent to align storage structure for Logic and Proxy contracts.
 * */

contract VestingRegistryStorage is Ownable {
	///@notice the vesting factory contract
	IVestingFactory public vestingFactory;

	///@notice the Locked SOV contract
	LockedSOV public lockedSOV;

	///@notice the vesting registry contract
	VestingRegistry public vestingRegistry;

	///@notice the vesting registry2 contract
	VestingRegistry2 public vestingRegistry2;

	///@notice the vesting registry3 contract
	VestingRegistry3 public vestingRegistry3;

	///@notice the SOV token contract
	address public SOV;

	///@notice the staking contract address
	address public staking;

	///@notice fee sharing proxy
	address public feeSharingProxy;

	///@notice the vesting owner (e.g. governance timelock address)
	address public vestingOwner;

	///@notice user => uid(hash of token owner, vesting type, cliff, duration) => vesting contract
	mapping(address => mapping(uint256 => address)) public vestingContracts;

	enum VestingType {
		TeamVesting, //MultisigVesting
		Vesting //TokenHolderVesting
	}

	///@notice Vesting details
	struct Vesting {
		uint256 vestingType;
		address vestingAddress;
	}

	///@notice A record of vesting details for a unique id
	///@dev vestings[uid] returns vesting data
	mapping(uint256 => Vesting) public vestings;

	///@notice A record of all unique ids for a particular token owner
	///@dev vestingsOf[tokenOwner] returns array of unique ids
	mapping(address => uint256[]) public vestingsOf;

	///@notice list of vestings addresses for a token owner created through previous regsitries
	address[] public vestingAddresses;
}
