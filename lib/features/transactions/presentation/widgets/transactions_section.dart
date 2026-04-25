import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/finance_transaction.dart';
import '../controllers/transactions_controller.dart';
import 'empty_transactions_state.dart';
import 'transaction_tile.dart';

class TransactionsSection extends ConsumerWidget {
  const TransactionsSection({
    super.key,
    required this.transactions,
    this.limit,
  });

  final List<FinanceTransaction> transactions;
  final int? limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (transactions.isEmpty) {
      return const EmptyTransactionsState();
    }

    final visibleTransactions = limit == null
        ? transactions
        : transactions.take(limit!).toList(growable: false);

    return Column(
      children: visibleTransactions
          .map(
            (transaction) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TransactionTile(
                transaction: transaction,
                onDelete: () async {
                  await ref
                      .read(transactionsControllerProvider.notifier)
                      .removeTransaction(transaction.id);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Transaction deleted successfully'),
                      ),
                    );
                  }
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

