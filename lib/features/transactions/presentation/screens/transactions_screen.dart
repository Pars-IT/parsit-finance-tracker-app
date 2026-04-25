import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/transactions_controller.dart';
import '../widgets/brand_footer.dart';
import '../widgets/transactions_section.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              ref.read(transactionsControllerProvider.notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              transactionsAsync.when(
                data: (transactions) =>
                    TransactionsSection(transactions: transactions),
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

