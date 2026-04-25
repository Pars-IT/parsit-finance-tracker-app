import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/finance_transaction.dart';
import '../models/category_breakdown.dart';
import '../utils/transaction_category_style.dart';

class CategoryLegendItem extends StatelessWidget {
  const CategoryLegendItem({
    super.key,
    required this.item,
  });

  final CategoryBreakdown item;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: '\u20AC');
    final style = item.category.style;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: style.color.withAlpha(18),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: style.color.withAlpha(32),
            child: Icon(style.icon, color: style.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.category.label,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  formatter.format(item.amount),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: style.color,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
