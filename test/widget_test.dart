import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:parsit_finance_tracker_app/features/transactions/presentation/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows app title', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Pars IT Finance Tracker'), findsOneWidget);
    expect(find.text('Recent Transactions'), findsOneWidget);
  });
}
