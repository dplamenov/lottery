//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Lottery {
    function bet(uint256 guess) public payable {
        require(msg.value >= 0.5 ether, "your bet must be at least 0.5 ether");
        require(
            address(this).balance >= 3 * msg.value,
            "lottery can not accept your bed"
        );

        uint256 rand = random();

        if (rand == guess) {
            payable(msg.sender).transfer(msg.value * 2);
        }
    }

    function random() private pure returns (uint256) {
        return 1;
    }
}
