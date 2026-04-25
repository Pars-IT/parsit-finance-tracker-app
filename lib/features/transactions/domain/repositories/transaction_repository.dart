import '../entities/finance_transaction.dart';

abstract class TransactionRepository {
  Stream<List<FinanceTransaction>> watchTransactions();
  Future<void> addTransaction(FinanceTransaction transaction);
  Future<void> deleteTransaction(String id);
}

