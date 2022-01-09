import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';

class ExpenseCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryDB().refreshCategories();
    return ValueListenableBuilder(
      valueListenable: expenselistnotifier,
      builder: (BuildContext context, List<CategoryModel> newexpenselist,
          Widget? child) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.purple,
                //   radius: 40,
                //   child: Text(
                //     '12 \nDec',
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                title: Text(newexpenselist[index].name),
                subtitle: Text(newexpenselist[index].type.toString()),
                trailing: IconButton(
                    onPressed: () {
                      CategoryDB().deleteCategories(newexpenselist[index].id);
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: newexpenselist.length,
        );
      },
    );
  }
}
