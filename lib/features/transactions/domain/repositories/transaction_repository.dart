import '../entities/finance_transaction.dart';

abstract class TransactionRepository {
  Future<List<FinanceTransaction>> getTransactions();
  Future<void> addTransaction(FinanceTransaction transaction);
  Future<void> deleteTransaction(String id);
}
