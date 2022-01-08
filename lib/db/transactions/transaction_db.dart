


import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';
import 'package:moneymanagement/models/transactions/transaction_model.dart';

abstract class TransactionFunctions{
  Future<void> addToTransactiondb(TransactionModel model);
 Future<List<TransactionModel>> getTransactions();
 Future<void> refreshUI();
}


class TransactionDB implements TransactionFunctions{
 ValueNotifier<List<TransactionModel>> listnotifier=ValueNotifier([]) ;
  TransactionDB.internal();
  static TransactionDB instance=TransactionDB.internal();
  factory TransactionDB(){
    return instance;
  }
  @override
  Future<void> addToTransactiondb(TransactionModel model)async {
    final db=await Hive.openBox<TransactionModel>('TransactionDB');
      db.put(model.id, model);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async{
    final db=await Hive.openBox<TransactionModel>('TransactionDB');
     final transactionsfromdb=db.values.toList();
    return transactionsfromdb ;
  }

  @override
  Future<void> refreshUI()async {
   final _list=await getTransactions();
   listnotifier.value.clear();
   listnotifier.value.addAll(_list);
   listnotifier.notifyListeners();
  }

}