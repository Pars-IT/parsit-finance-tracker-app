import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parsit_finance_tracker_app/features/transactions/domain/entities/finance_transaction.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/controllers/transactions_controller.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows app title', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          transactionsControllerProvider.overrideWith(
            () => _FakeTransactionsController(),
          ),
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

class _FakeTransactionsController extends TransactionsController {
  @override
  Future<List<FinanceTransaction>> build() async => [];
}
