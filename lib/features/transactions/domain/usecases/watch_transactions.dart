import '../entities/finance_transaction.dart';
import '../repositories/transaction_repository.dart';

class WatchTransactions {
  const WatchTransactions(this._repository);

  final TransactionRepository _repository;

  Stream<List<FinanceTransaction>> call() {
    return _repository.watchTransactions();
  }
}

