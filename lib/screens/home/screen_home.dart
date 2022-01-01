//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/screens/category/screen_category.dart';
import 'package:moneymanagement/screens/home/widgets/alertbox_category.dart';
import 'package:moneymanagement/screens/home/widgets/bottom_navigation.dart';
import 'package:moneymanagement/screens/transactions/add_transaction.dart';
import 'package:moneymanagement/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransactions(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    CategoryDB().refreshCategories();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: Text('MONEY MANAGER')),
      ),
      bottomNavigationBar: MoneyManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int modifiedindex, Widget? c) {
          return _pages[modifiedindex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add transactions');
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return AddTransaction();
            }));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext ctx) => alertboxToAddcategory(context));
            print('Add Categories');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
