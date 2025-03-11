import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/loan_data.dart';

final loanDataProvider = StateNotifierProvider<LoanDataNotifier, LoanData>((ref) {
  return LoanDataNotifier();
});

class LoanDataNotifier extends StateNotifier<LoanData> {
  LoanDataNotifier() : super(_createInitialState());

  static LoanData _createInitialState() {
    const totalLoan = 50000.0;
    const monthlyContribution = 2500.0;

    // Create sample data for the last 6 months
    final now = DateTime.now();
    final monthlyPayments = <MonthlyData>[];
    var remainingLoan = totalLoan;
    var currentSavings = 0.0;

    for (int i = 5; i >= 0; i--) {
      final date = DateTime(now.year, now.month - i, 1);

      // Calculate loan payment and savings for this month
      remainingLoan -= monthlyContribution;
      currentSavings += 500.0; // Example: Save $500 each month

      monthlyPayments.add(
        MonthlyData(
          date: date,
          loanPayment: monthlyContribution,
          savings: currentSavings,
        ),
      );
    }

    return LoanData(
      totalLoan: totalLoan,
      monthlyContribution: monthlyContribution,
      savings: currentSavings,
      loanBalance: remainingLoan > 0 ? remainingLoan : 0,
      monthlyPayments: monthlyPayments,
      userName: 'Olabode Subuloye',
    );
  }

  void makeMonthlyPayment() {
    final now = DateTime.now();
    final newLoanBalance = state.loanBalance - state.monthlyContribution;
    final newSavings = state.savings + 500.0; // Example: Save $500 each month

    final newPayment = MonthlyData(
      date: now,
      loanPayment: state.monthlyContribution,
      savings: newSavings,
    );

    // Keep only the last 6 months of payments
    final updatedPayments = [
      ...state.monthlyPayments.skip(1),
      newPayment,
    ];

    state = state.copyWith(
      savings: newSavings,
      loanBalance: newLoanBalance > 0 ? newLoanBalance : 0,
      monthlyPayments: updatedPayments,
    );
  }

  void updateUserName(String newName) {
    state = state.copyWith(userName: newName);
  }
}