import '../entities/finance_transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactions {
  const GetTransactions(this._repository);

  final TransactionRepository _repository;

  Future<List<FinanceTransaction>> call() {
    return _repository.getTransactions();
  }
}
