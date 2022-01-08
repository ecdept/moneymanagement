import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/db/transactions/transaction_db.dart';
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
                  '12 \nDec',
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text('RS:${newtransaction.amount}'),
              subtitle: Text(newtransaction.categorytype.name),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
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
}
