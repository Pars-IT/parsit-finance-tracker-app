import '../../domain/entities/finance_transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._localDataSource);

  final TransactionLocalDataSource _localDataSource;

  @override
  Future<void> addTransaction(FinanceTransaction transaction) async {
    await _localDataSource.addTransaction(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await _localDataSource.deleteTransaction(id);
  }

  @override
  Future<List<FinanceTransaction>> getTransactions() {
    return _localDataSource.getTransactions();
  }
}
