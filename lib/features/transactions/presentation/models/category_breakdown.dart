import '../../domain/entities/finance_transaction.dart';

class CategoryBreakdown {
  const CategoryBreakdown({
    required this.category,
    required this.amount,
  });

  final TransactionCategory category;
  final double amount;
}
