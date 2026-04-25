import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/finance_transaction.dart';
import '../../domain/entities/transaction_summary.dart';
import '../controllers/transactions_controller.dart';
import '../models/category_breakdown.dart';

final transactionSummaryProvider = Provider<TransactionSummary>((ref) {
  final transactions = ref.watch(transactionsControllerProvider).valueOrNull ?? [];
  return TransactionSummary.fromTransactions(transactions);
});

final expenseCategoryBreakdownProvider = Provider<List<CategoryBreakdown>>((ref) {
  final transactions = ref.watch(transactionsControllerProvider).valueOrNull ?? [];
  final totals = <TransactionCategory, double>{};

  for (final transaction in transactions) {
    if (transaction.type != TransactionType.expense) {
      continue;
    }

    totals.update(
      transaction.category,
      (value) => value + transaction.amount,
      ifAbsent: () => transaction.amount,
    );
  }

  final breakdown = totals.entries
      .map(
        (entry) => CategoryBreakdown(
          category: entry.key,
          amount: entry.value,
        ),
      )
      .toList()
    ..sort((a, b) => b.amount.compareTo(a.amount));

  return breakdown;
});
