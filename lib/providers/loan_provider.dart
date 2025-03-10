import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/loan_data.dart';

final loanDataProvider = StateNotifierProvider<LoanDataNotifier, LoanData>((ref) {
  return LoanDataNotifier();
});

class LoanDataNotifier extends StateNotifier<LoanData> {
  LoanDataNotifier() : super(LoanData.initial());

  void updateLoanData({
    double? totalLoan,
    double? monthlyContribution,
    double? savings,
    double? loanBalance,
    List<double>? loanPaymentHistory,
    List<double>? savingsHistory,
    String? userName,
  }) {
    state = LoanData(
      totalLoan: totalLoan ?? state.totalLoan,
      monthlyContribution: monthlyContribution ?? state.monthlyContribution,
      savings: savings ?? state.savings,
      loanBalance: loanBalance ?? state.loanBalance,
      loanPaymentHistory: loanPaymentHistory ?? state.loanPaymentHistory,
      savingsHistory: savingsHistory ?? state.savingsHistory,
      userName: userName ?? state.userName, monthlyPayments: [],
    );
  }
}