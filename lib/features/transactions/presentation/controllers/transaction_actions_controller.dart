import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/finance_transaction.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../providers/transaction_providers.dart';

final transactionActionsControllerProvider =
    Provider<TransactionActionsController>((ref) {
  return TransactionActionsController(
    addTransaction: ref.watch(addTransactionUseCaseProvider),
    deleteTransaction: ref.watch(deleteTransactionUseCaseProvider),
  );
});

class TransactionActionsController {
  TransactionActionsController({
    required AddTransaction addTransaction,
    required DeleteTransaction deleteTransaction,
  })  : _addTransaction = addTransaction,
        _deleteTransaction = deleteTransaction;

  final AddTransaction _addTransaction;
  final DeleteTransaction _deleteTransaction;
  final Uuid _uuid = const Uuid();

  Future<void> createTransaction({
    required String title,
    required double amount,
    required TransactionType type,
    required TransactionCategory category,
  }) {
    return _addTransaction(
      FinanceTransaction(
        id: _uuid.v4(),
        title: title.trim(),
        amount: amount,
        type: type,
        date: DateTime.now(),
        category: category,
      ),
    );
  }

  Future<void> removeTransaction(String id) {
    return _deleteTransaction(id);
  }
}

