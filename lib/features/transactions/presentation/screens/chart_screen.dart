import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/transaction_providers.dart';
import '../widgets/brand_footer.dart';
import '../widgets/category_chart_card.dart';

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartItems = ref.watch(expenseCategoryBreakdownProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Chart')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            CategoryChartCard(
              items: chartItems,
              title: 'Expense Breakdown',
            ),
            const BrandFooter(),
          ],
        ),
      ),
    );
  }
}

