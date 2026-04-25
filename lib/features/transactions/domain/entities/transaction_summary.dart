import 'finance_transaction.dart';

class TransactionSummary {
  const TransactionSummary({
    required this.incomeTotal,
    required this.expenseTotal,
  });

  final double incomeTotal;
  final double expenseTotal;

  double get balance => incomeTotal - expenseTotal;

  factory TransactionSummary.fromTransactions(
    List<FinanceTransaction> transactions,
  ) {
    var income = 0.0;
    var expense = 0.0;

    for (final transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        income += transaction.amount;
      } else {
        expense += transaction.amount;
      }
    }

    return TransactionSummary(
      incomeTotal: income,
      expenseTotal: expense,
    );
  }
}

