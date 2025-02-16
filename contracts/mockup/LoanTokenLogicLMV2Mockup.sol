pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;

import "../connectors/loantoken/modules/beaconLogicLM/LoanTokenLogicLM.sol";

contract LoanTokenLogicLMV1Mockup is LoanTokenLogicLM {
    function getListFunctionSignatures()
        external
        pure
        returns (bytes4[] memory functionSignatures, bytes32 moduleName)
    {
        bytes4[] memory res = new bytes4[](31);

        // Loan Token Logic Standard
        res[0] = this.borrow.selector;
        res[1] = this.marginTrade.selector;
        res[2] = this.marginTradeAffiliate.selector;
        res[3] = this.transfer.selector;
        res[4] = this.transferFrom.selector;
        res[5] = this.profitOf.selector;
        res[6] = this.tokenPrice.selector;
        res[7] = this.checkpointPrice.selector;
        res[8] = this.marketLiquidity.selector;
        res[9] = this.avgBorrowInterestRate.selector;
        res[10] = this.borrowInterestRate.selector;
        res[11] = this.nextBorrowInterestRate.selector;
        res[12] = this.supplyInterestRate.selector;
        res[13] = this.nextSupplyInterestRate.selector;
        res[14] = this.totalSupplyInterestRate.selector;
        res[15] = this.totalAssetBorrow.selector;
        res[16] = this.totalAssetSupply.selector;
        res[17] = this.getMaxEscrowAmount.selector;
        res[18] = this.assetBalanceOf.selector;
        res[19] = this.getEstimatedMarginDetails.selector;
        res[20] = this.getDepositAmountForBorrow.selector;
        res[21] = this.getBorrowAmountForDeposit.selector;
        res[22] = this.checkPriceDivergence.selector;
        res[23] = this.calculateSupplyInterestRate.selector;

        // Loan Token LM & OVERLOADING function
        /**
         * @notice BE CAREFUL,
         * LoanTokenLogicStandard also has mint & burn function (overloading).
         * You need to compute the function signature manually --> bytes4(keccak256("mint(address,uint256,bool)"))
         */
        res[24] = bytes4(keccak256("mint(address,uint256)")); /// LoanTokenLogicStandard
        res[25] = bytes4(keccak256("mint(address,uint256,bool)")); /// LoanTokenLogicLM
        res[26] = bytes4(keccak256("burn(address,uint256)")); /// LoanTokenLogicStandard
        res[27] = bytes4(keccak256("burn(address,uint256,bool)")); /// LoanTokenLogicLM

        // Advanced Token
        res[28] = this.approve.selector;

        // Advanced Token Storage
        // res[31] = this.totalSupply.selector;
        res[29] = this.balanceOf.selector;
        res[30] = this.allowance.selector;

        return (res, stringToBytes32("LoanTokenLogicLM"));
    }
}

contract LoanTokenLogicLMV2Mockup is LoanTokenLogicLM {
    function testNewFunction() external pure returns (bool) {
        return true;
    }

    function getListFunctionSignatures()
        external
        pure
        returns (bytes4[] memory functionSignatures, bytes32 moduleName)
    {
        bytes4[] memory res = new bytes4[](33);

        // Loan Token Logic Standard
        res[0] = this.borrow.selector;
        res[1] = this.marginTrade.selector;
        res[2] = this.marginTradeAffiliate.selector;
        res[3] = this.transfer.selector;
        res[4] = this.transferFrom.selector;
        res[5] = this.profitOf.selector;
        res[6] = this.tokenPrice.selector;
        res[7] = this.checkpointPrice.selector;
        res[8] = this.marketLiquidity.selector;
        res[9] = this.avgBorrowInterestRate.selector;
        res[10] = this.borrowInterestRate.selector;
        res[11] = this.nextBorrowInterestRate.selector;
        res[12] = this.supplyInterestRate.selector;
        res[13] = this.nextSupplyInterestRate.selector;
        res[14] = this.totalSupplyInterestRate.selector;
        res[15] = this.totalAssetBorrow.selector;
        res[16] = this.totalAssetSupply.selector;
        res[17] = this.getMaxEscrowAmount.selector;
        res[18] = this.assetBalanceOf.selector;
        res[19] = this.getEstimatedMarginDetails.selector;
        res[20] = this.getDepositAmountForBorrow.selector;
        res[21] = this.getBorrowAmountForDeposit.selector;
        res[22] = this.checkPriceDivergence.selector;
        res[23] = this.calculateSupplyInterestRate.selector;

        // Loan Token LM & OVERLOADING function
        /**
         * @notice BE CAREFUL,
         * LoanTokenLogicStandard also has mint & burn function (overloading).
         * You need to compute the function signature manually --> bytes4(keccak256("mint(address,uint256,bool)"))
         */
        res[24] = bytes4(keccak256("mint(address,uint256)")); /// LoanTokenLogicStandard
        res[25] = bytes4(keccak256("mint(address,uint256,bool)")); /// LoanTokenLogicLM
        res[26] = bytes4(keccak256("burn(address,uint256)")); /// LoanTokenLogicStandard
        res[27] = bytes4(keccak256("burn(address,uint256,bool)")); /// LoanTokenLogicLM

        // Advanced Token
        res[28] = this.approve.selector;

        // Advanced Token Storage
        res[29] = this.totalSupply.selector;
        res[30] = this.balanceOf.selector;
        res[31] = this.allowance.selector;

        // Mockup
        res[32] = this.testNewFunction.selector;

        return (res, stringToBytes32("LoanTokenLogicLM"));
    }
}
