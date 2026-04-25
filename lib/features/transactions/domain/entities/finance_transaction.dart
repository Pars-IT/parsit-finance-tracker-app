enum TransactionType { income, expense }

enum TransactionCategory { salary, food, transport, shopping, other }

class FinanceTransaction {
  const FinanceTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
    required this.category,
  });

  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final TransactionCategory category;
}

extension TransactionTypeX on TransactionType {
  String get value => switch (this) {
        TransactionType.income => 'income',
        TransactionType.expense => 'expense',
      };

  String get label => switch (this) {
        TransactionType.income => 'Income',
        TransactionType.expense => 'Expense',
      };

  static TransactionType fromValue(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => TransactionType.expense,
    );
  }
}

extension TransactionCategoryX on TransactionCategory {
  String get value => switch (this) {
        TransactionCategory.salary => 'salary',
        TransactionCategory.food => 'food',
        TransactionCategory.transport => 'transport',
        TransactionCategory.shopping => 'shopping',
        TransactionCategory.other => 'other',
      };

  String get label => switch (this) {
        TransactionCategory.salary => 'Salary',
        TransactionCategory.food => 'Food',
        TransactionCategory.transport => 'Transport',
        TransactionCategory.shopping => 'Shopping',
        TransactionCategory.other => 'Other',
      };

  static TransactionCategory fromValue(String value) {
    return TransactionCategory.values.firstWhere(
      (category) => category.value == value,
      orElse: () => TransactionCategory.other,
    );
  }
}

