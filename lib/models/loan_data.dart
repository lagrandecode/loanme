class LoanData {
  final double totalLoan;
  final double monthlyContribution;
  final double savings;
  final double loanBalance;
  final List<MonthlyData> monthlyPayments;
  final String userName;

  const LoanData({
    required this.totalLoan,
    required this.monthlyContribution,
    required this.savings,
    required this.loanBalance,
    required this.monthlyPayments,
    required this.userName,
  });

  // Create a copy of LoanData with optional parameter updates
  LoanData copyWith({
    double? totalLoan,
    double? monthlyContribution,
    double? savings,
    double? loanBalance,
    List<MonthlyData>? monthlyPayments,
    String? userName,
  }) {
    return LoanData(
      totalLoan: totalLoan ?? this.totalLoan,
      monthlyContribution: monthlyContribution ?? this.monthlyContribution,
      savings: savings ?? this.savings,
      loanBalance: loanBalance ?? this.loanBalance,
      monthlyPayments: monthlyPayments ?? this.monthlyPayments,
      userName: userName ?? this.userName,
    );
  }

  factory LoanData.initial() {
    // Create sample data for the last 6 months
    final now = DateTime.now();
    final monthlyPayments = <MonthlyData>[];
    var remainingLoan = 50000.0;
    var currentSavings = 0.0;

    for (int i = 5; i >= 0; i--) {
      final date = DateTime(now.year, now.month - i, 1);
      remainingLoan -= 2500.0;
      currentSavings += 500.0;

      monthlyPayments.add(
        MonthlyData(
          date: date,
          loanPayment: 2500.0,
          savings: currentSavings,
        ),
      );
    }

    return LoanData(
      totalLoan: 50000.0,
      monthlyContribution: 2500.0,
      savings: currentSavings,
      loanBalance: remainingLoan > 0 ? remainingLoan : 0,
      monthlyPayments: monthlyPayments,
      userName: 'Olabode Subuloye',
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

  // Create a copy of MonthlyData with optional parameter updates
  MonthlyData copyWith({
    DateTime? date,
    double? loanPayment,
    double? savings,
  }) {
    return MonthlyData(
      date: date ?? this.date,
      loanPayment: loanPayment ?? this.loanPayment,
      savings: savings ?? this.savings,
    );
  }
}