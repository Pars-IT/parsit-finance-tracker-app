import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/transactions_controller.dart';
import '../providers/transaction_providers.dart';
import '../widgets/app_drawer.dart';
import '../widgets/brand_footer.dart';
import '../widgets/category_chart_card.dart';
import '../widgets/summary_card.dart';
import '../widgets/transactions_section.dart';
import 'add_transaction_screen.dart';
import 'about_screen.dart';
import 'chart_screen.dart';
import 'contact_screen.dart';
import 'transactions_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _openAddTransaction(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AddTransactionScreen(),
      ),
    );
  }

  Future<void> _openScreen(BuildContext context, Widget screen) async {
    Navigator.of(context).pop();
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsControllerProvider);
    final summary = ref.watch(transactionSummaryProvider);
    final chartItems = ref.watch(expenseCategoryBreakdownProvider);

    return Scaffold(
      drawer: AppDrawer(
        onAddTransaction: () {
          Navigator.of(context).pop();
          _openAddTransaction(context);
        },
        onViewTransactions: () => _openScreen(context, const TransactionsScreen()),
        onViewChart: () => _openScreen(context, const ChartScreen()),
        onViewAbout: () => _openScreen(context, const AboutScreen()),
        onViewContact: () => _openScreen(context, const ContactScreen()),
      ),
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
          onRefresh: () => ref.read(transactionsControllerProvider.notifier).refresh(),
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
              CategoryChartCard(items: chartItems),
              const SizedBox(height: 24),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 12),
              transactionsAsync.when(
                data: (transactions) =>
                    TransactionsSection(transactions: transactions, limit: 5),
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
              const BrandFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
