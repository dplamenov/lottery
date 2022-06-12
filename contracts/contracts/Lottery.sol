//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Lottery {
    event Win(address indexed player, uint256 guess, uint256 winValue);
    event Loss(address indexed player, uint256 guess, uint256 num);

    function bet(uint256 guess) public payable {
        require(msg.value >= 0.5 ether, "your bet must be at least 0.5 ether");
        require(
            address(this).balance >= 3 * msg.value,
            "lottery can not accept your bed"
        );

        uint256 rand = random();

        if (rand == guess) {
            payable(msg.sender).transfer(msg.value * 3);
            emit Win(msg.sender, guess, msg.value * 3);
        } else {
            emit Loss(msg.sender, guess, rand);
        }
    }

    function random() private pure returns (uint256) {
        return 1;
    }
}
