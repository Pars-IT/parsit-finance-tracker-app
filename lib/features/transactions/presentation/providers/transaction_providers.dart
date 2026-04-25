import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/datasources/transaction_local_data_source.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/entities/transaction_summary.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/watch_transactions.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.instance;
});

final transactionLocalDataSourceProvider =
    Provider<TransactionLocalDataSource>((ref) {
  return TransactionLocalDataSourceImpl(ref.watch(appDatabaseProvider));
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final repository =
      TransactionRepositoryImpl(ref.watch(transactionLocalDataSourceProvider));
  ref.onDispose(repository.dispose);
  return repository;
});

final watchTransactionsUseCaseProvider = Provider<WatchTransactions>((ref) {
  return WatchTransactions(ref.watch(transactionRepositoryProvider));
});

final addTransactionUseCaseProvider = Provider<AddTransaction>((ref) {
  return AddTransaction(ref.watch(transactionRepositoryProvider));
});

final deleteTransactionUseCaseProvider = Provider<DeleteTransaction>((ref) {
  return DeleteTransaction(ref.watch(transactionRepositoryProvider));
});

final transactionsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(watchTransactionsUseCaseProvider).call();
});

final transactionSummaryProvider = Provider<TransactionSummary>((ref) {
  final transactions = ref.watch(transactionsProvider).valueOrNull ?? [];
  return TransactionSummary.fromTransactions(transactions);
});
