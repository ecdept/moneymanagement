import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/db/transactions/transaction_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';
import 'package:moneymanagement/models/transactions/transaction_model.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  TransactionDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.listnotifier,
      builder: (BuildContext context,List<TransactionModel> value, Widget? child) {

      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final newtransaction=value[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                child: Text(
                  parseDate(newtransaction.date),
                  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: newtransaction.categorytype==CategoryType.income?Colors.green:Colors.red,
              ),
              title: Text('RS:${newtransaction.amount}'),
              subtitle: Text(newtransaction.categorymodel.name),
              trailing: IconButton(onPressed: () {
                TransactionDB.instance.deleteTransaction(newtransaction);
              }, icon: Icon(Icons.delete)),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: value.length,
      );
    },

    );
  }
  String parseDate(DateTime date){
    final formatedDate=DateFormat.MMMd().format(date);
    final splittedDate=formatedDate.split(' ');
    return ("${splittedDate.last}\n${splittedDate.first}");
  }
}
