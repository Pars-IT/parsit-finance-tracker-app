import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/transaction_actions_controller.dart';
import '../providers/transaction_providers.dart';
import '../widgets/empty_transactions_state.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_tile.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _openAddTransaction(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AddTransactionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider);
    final summary = ref.watch(transactionSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pars IT Finance Tracker'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddTransaction(context),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(transactionsProvider);
          },
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
            children: [
              SummaryCard(
                title: 'Total Balance',
                amount: summary.balance,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                icon: Icons.account_balance_wallet_rounded,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'Income',
                      amount: summary.incomeTotal,
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      textColor:
                          Theme.of(context).colorScheme.onSecondaryContainer,
                      icon: Icons.south_west_rounded,
                      compact: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SummaryCard(
                      title: 'Expense',
                      amount: summary.expenseTotal,
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      textColor: Theme.of(context).colorScheme.onErrorContainer,
                      icon: Icons.north_east_rounded,
                      compact: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Transactions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 12),
              transactionsAsync.when(
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return const EmptyTransactionsState();
                  }

                  return Column(
                    children: transactions
                        .map(
                          (transaction) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TransactionTile(
                              transaction: transaction,
                              onDelete: () async {
                                await ref
                                    .read(transactionActionsControllerProvider)
                                    .removeTransaction(transaction.id);

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Transaction deleted successfully'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Text(
                    'Unable to load transactions.\n$error',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
