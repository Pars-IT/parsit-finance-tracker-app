enum TransactionType { income, expense }

enum TransactionCategory {
  salary,
  freelance,
  food,
  transport,
  shopping,
  bills,
  entertainment,
  health,
  education,
  travel,
  investment,
  gift,
  other,
}

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
        TransactionCategory.freelance => 'freelance',
        TransactionCategory.food => 'food',
        TransactionCategory.transport => 'transport',
        TransactionCategory.shopping => 'shopping',
        TransactionCategory.bills => 'bills',
        TransactionCategory.entertainment => 'entertainment',
        TransactionCategory.health => 'health',
        TransactionCategory.education => 'education',
        TransactionCategory.travel => 'travel',
        TransactionCategory.investment => 'investment',
        TransactionCategory.gift => 'gift',
        TransactionCategory.other => 'other',
      };

  String get label => switch (this) {
        TransactionCategory.salary => 'Salary',
        TransactionCategory.freelance => 'Freelance',
        TransactionCategory.food => 'Food',
        TransactionCategory.transport => 'Transport',
        TransactionCategory.shopping => 'Shopping',
        TransactionCategory.bills => 'Bills',
        TransactionCategory.entertainment => 'Entertainment',
        TransactionCategory.health => 'Health',
        TransactionCategory.education => 'Education',
        TransactionCategory.travel => 'Travel',
        TransactionCategory.investment => 'Investment',
        TransactionCategory.gift => 'Gift',
        TransactionCategory.other => 'Other',
      };

  static TransactionCategory fromValue(String value) {
    return TransactionCategory.values.firstWhere(
      (category) => category.value == value,
      orElse: () => TransactionCategory.other,
    );
  }
}
