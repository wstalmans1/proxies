// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Proxy {
    address public implementation;

    function changeImplementation(address _implementation) external {
        implementation = _implementation;
    }

    function changeX(uint _x) external {
        (bool success, ) = implementation.call(abi.encodeWithSignature("changeX(uint256)", _x));
        require(success, "Call to implementation failed");
    }

    function getX() external view returns (uint) {
        (bool success, bytes memory data) = implementation.staticcall(abi.encodeWithSignature("x()"));
        require(success, "Call to implementation failed");
        return abi.decode(data, (uint));
    }
}

// Logic1 and Logic2 contracts remain the same