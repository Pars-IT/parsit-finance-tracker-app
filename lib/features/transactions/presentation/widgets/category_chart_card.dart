import 'package:flutter/material.dart';

import '../models/category_breakdown.dart';
import 'category_legend_item.dart';
import 'category_pie_chart.dart';

class CategoryChartCard extends StatelessWidget {
  const CategoryChartCard({
    super.key,
    required this.items,
    this.title = 'Expense Categories',
  });

  final List<CategoryBreakdown> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'A circular breakdown of your expense categories.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            if (items.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'No expense data yet. Add some expense transactions to see the category chart.',
                  textAlign: TextAlign.center,
                ),
              )
            else ...[
              Center(child: CategoryPieChart(items: items)),
              const SizedBox(height: 20),
              Column(
                children: items
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CategoryLegendItem(item: item),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

