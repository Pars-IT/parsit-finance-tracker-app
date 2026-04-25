import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parsit_finance_tracker_app/features/transactions/domain/entities/finance_transaction.dart';
import 'package:parsit_finance_tracker_app/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/providers/transaction_usecase_providers.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows app title', (tester) async {
    final repository = _FakeTransactionRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          transactionRepositoryProvider.overrideWithValue(repository),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Pars IT Finance Tracker'), findsOneWidget);
    expect(find.text('Recent Transactions'), findsOneWidget);
  });
}

class _FakeTransactionRepository implements TransactionRepository {
  @override
  Future<void> addTransaction(FinanceTransaction transaction) async {}

  @override
  Future<void> deleteTransaction(String id) async {}

  @override
  Future<List<FinanceTransaction>> getTransactions() async => [];
}
