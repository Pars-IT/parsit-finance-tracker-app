import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/widgets/empty_transactions_state.dart';

void main() {
  testWidgets('Empty transactions state shows guidance text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyTransactionsState(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('No transactions yet'), findsOneWidget);
    expect(
      find.text(
        'No transactions yet. Use the menu or add button to record your first income or expense.',
      ),
      findsOneWidget,
    );
  });
}
