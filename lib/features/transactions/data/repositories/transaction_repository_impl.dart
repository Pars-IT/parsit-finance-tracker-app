import 'dart:async';

import '../../domain/entities/finance_transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._localDataSource);

  final TransactionLocalDataSource _localDataSource;
  final StreamController<List<FinanceTransaction>> _controller =
      StreamController<List<FinanceTransaction>>.broadcast();
  bool _initialized = false;

  void dispose() {
    _controller.close();
  }

  @override
  Future<void> addTransaction(FinanceTransaction transaction) async {
    await _localDataSource.addTransaction(TransactionModel.fromEntity(transaction));
    await _emitTransactions();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await _localDataSource.deleteTransaction(id);
    await _emitTransactions();
  }

  @override
  Stream<List<FinanceTransaction>> watchTransactions() async* {
    if (!_initialized) {
      _initialized = true;
      await _emitTransactions();
    }

    yield* _controller.stream;
  }

  Future<void> _emitTransactions() async {
    final transactions = await _localDataSource.getTransactions();
    if (!_controller.isClosed) {
      _controller.add(transactions);
    }
  }
}
