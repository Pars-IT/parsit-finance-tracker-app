import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/finance_transaction.dart';
import '../utils/transaction_category_style.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    required this.onDelete,
  });

  final FinanceTransaction transaction;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\u20AC');
    final dateFormatter = DateFormat.yMMMd();
    final isIncome = transaction.type == TransactionType.income;
    final categoryStyle = transaction.category.style;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: categoryStyle.color.withAlpha(28),
          child: Icon(
            categoryStyle.icon,
            color: categoryStyle.color,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${transaction.type.label} • ${transaction.category.label} • ${dateFormatter.format(transaction.date)}',
          ),
        ),
        trailing: SizedBox(
          width: 92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '-'}${currencyFormatter.format(transaction.amount)}',
                style: TextStyle(
                  color: isIncome
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w800,
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline_rounded),
                tooltip: 'Delete',
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
