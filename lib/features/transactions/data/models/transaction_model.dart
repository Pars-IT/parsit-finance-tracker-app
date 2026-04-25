import '../../domain/entities/finance_transaction.dart';

class TransactionModel extends FinanceTransaction {
  const TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
    required super.type,
    required super.date,
    required super.category,
  });

  factory TransactionModel.fromEntity(FinanceTransaction entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      type: entity.type,
      date: entity.date,
      category: entity.category,
    );
  }

  factory TransactionModel.fromMap(Map<String, Object?> map) {
    return TransactionModel(
      id: map['id']! as String,
      title: map['title']! as String,
      amount: (map['amount']! as num).toDouble(),
      type: TransactionTypeX.fromValue(map['type']! as String),
      date: DateTime.parse(map['date']! as String),
      category: TransactionCategoryX.fromValue(map['category']! as String),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'type': type.value,
      'category': category.value,
      'date': date.toIso8601String(),
    };
  }
}

