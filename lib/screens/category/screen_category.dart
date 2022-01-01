import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';
import 'package:moneymanagement/screens/category/expense_category.dart';
import 'package:moneymanagement/screens/category/income_category.dart';

List<CategoryModel> list = [];

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().getCategories().then((value) {
      print(value.toString());
    });

    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: [
              Tab(text: 'INCOME'),
              Tab(text: 'EXPENSE'),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            IncomeCategory(),
            ExpenseCategory(),
          ]),
        )
      ],
    );
  }
}
