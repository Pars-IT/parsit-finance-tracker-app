import 'package:flutter_test/flutter_test.dart';
import 'package:parsit_finance_tracker_app/features/transactions/domain/entities/finance_transaction.dart';
import 'package:parsit_finance_tracker_app/features/transactions/domain/entities/transaction_summary.dart';

void main() {
  test('TransactionSummary calculates totals correctly', () {
    final transactions = [
      FinanceTransaction(
        id: '1',
        title: 'Salary',
        amount: 2000,
        type: TransactionType.income,
        date: DateTime(2026, 1, 1),
        category: TransactionCategory.salary,
      ),
      FinanceTransaction(
        id: '2',
        title: 'Food',
        amount: 120,
        type: TransactionType.expense,
        date: DateTime(2026, 1, 2),
        category: TransactionCategory.food,
      ),
    ];

    final summary = TransactionSummary.fromTransactions(transactions);

    expect(summary.incomeTotal, 2000);
    expect(summary.expenseTotal, 120);
    expect(summary.balance, 1880);
  });
}

