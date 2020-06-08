pragma solidity ^0.5.16;

contract ApprovalContract {
	
	address public sender;
	address payable public receiver;

	address public constant approver = 0xb10532Bbfb6C59F566D63278235ec44D9C2b203b;

	function deposit(address payable _receiver) external payable {
	require(msg.value > 0);
	sender = msg.sender;
	receiver = _receiver;
	}

	function viewApprover() external pure returns(address) {
	return(approver);
	}

	function approve() external payable {
		require(msg.sender == approver);
		receiver.transfer(address(this).balance);
	}
}