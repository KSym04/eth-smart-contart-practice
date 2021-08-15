pragma solidity ^0.4.22;

contract ApprovalContract {
    // Set variables.
    address public sender;
    address public receiver;
    address public constant approver = 0xD3ac5dbe34E1680b85Da426F9d177DD8B9c3Eb7D;

    function deposit(address _receiver) external payable {
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address) {
        return (approver);
    }

    function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
    }
}