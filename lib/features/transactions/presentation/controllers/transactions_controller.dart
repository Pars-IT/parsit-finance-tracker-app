import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/finance_transaction.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/get_transactions.dart';
import '../providers/transaction_usecase_providers.dart';

final transactionsControllerProvider = AsyncNotifierProvider.autoDispose<
    TransactionsController, List<FinanceTransaction>>(
  TransactionsController.new,
);

class TransactionsController
    extends AutoDisposeAsyncNotifier<List<FinanceTransaction>> {
  final Uuid _uuid = const Uuid();

  GetTransactions get _getTransactions => ref.read(getTransactionsUseCaseProvider);
  AddTransaction get _addTransaction => ref.read(addTransactionUseCaseProvider);
  DeleteTransaction get _deleteTransaction =>
      ref.read(deleteTransactionUseCaseProvider);

  @override
  Future<List<FinanceTransaction>> build() {
    return _getTransactions();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getTransactions());
  }

  Future<void> createTransaction({
    required String title,
    required double amount,
    required TransactionType type,
    required TransactionCategory category,
  }) async {
    await _addTransaction(
      FinanceTransaction(
        id: _uuid.v4(),
        title: title.trim(),
        amount: amount,
        type: type,
        date: DateTime.now(),
        category: category,
      ),
    );
    await _reload();
  }

  Future<void> removeTransaction(String id) async {
    await _deleteTransaction(id);
    await _reload();
  }

  Future<void> _reload() async {
    state = AsyncData(await _getTransactions());
  }
}
