class LoanData {
  final double totalLoan;
  final double monthlyContribution;
  final double savings;
  final double loanBalance;
  final List<MonthlyData> monthlyPayments;
  final String userName;

  LoanData({
    required this.totalLoan,
    required this.monthlyContribution,
    required this.savings,
    required this.loanBalance,
    required this.monthlyPayments,
    required this.userName, required loanPaymentHistory, required savingsHistory,
  });

  factory LoanData.initial() {
    // Create sample data for the last 6 months
    final now = DateTime.now();
    final monthlyPayments = <MonthlyData>[];

    for (int i = 5; i >= 0; i--) {
      final date = DateTime(now.year, now.month - i, 1);
      monthlyPayments.add(
        MonthlyData(
          date: date,
          loanPayment: 2500,
          savings: 500.0 * (6 - i), // Increasing savings over time
        ),
      );
    }

    return LoanData(
      totalLoan: 50000,
      monthlyContribution: 2500,
      savings: 15000,
      loanBalance: 35000,
      monthlyPayments: monthlyPayments,
      userName: 'John Doe',
    );
  }
}

class MonthlyData {
  final DateTime date;
  final double loanPayment;
  final double savings;

  const MonthlyData({
    required this.date,
    required this.loanPayment,
    required this.savings,
  });

  String get monthName {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[date.month - 1];
  }
}