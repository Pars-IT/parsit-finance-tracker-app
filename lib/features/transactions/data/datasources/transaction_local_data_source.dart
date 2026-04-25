import 'package:sqflite/sqflite.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/app_database.dart';
import '../models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String id);
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  const TransactionLocalDataSourceImpl(this._database);

  final AppDatabase _database;

  Future<Database> get _db async => _database.database;

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final db = await _db;
    await db.insert(
      AppConstants.transactionsTable,
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final db = await _db;
    await db.delete(
      AppConstants.transactionsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final db = await _db;
    final maps = await db.query(
      AppConstants.transactionsTable,
      orderBy: 'date DESC',
    );

    return maps.map(TransactionModel.fromMap).toList();
  }
}

