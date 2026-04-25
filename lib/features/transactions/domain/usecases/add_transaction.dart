import '../entities/finance_transaction.dart';
import '../repositories/transaction_repository.dart';

class AddTransaction {
  const AddTransaction(this._repository);

  final TransactionRepository _repository;

  Future<void> call(FinanceTransaction transaction) {
    return _repository.addTransaction(transaction);
  }
}

