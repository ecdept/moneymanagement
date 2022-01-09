import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';

class IncomeCategory extends StatelessWidget {
  const IncomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryDB().refreshCategories();
    return ValueListenableBuilder(
      valueListenable: incomelistnotifier,
      builder: (BuildContext context, List<CategoryModel> newincomelist, Widget? child) {
       return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                // leading: const CircleAvatar(
                //   backgroundColor: Colors.purple,
                //   radius: 40,
                //   child: Text(
                //     '12 \nDec',
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                title: Text(newincomelist[index].name),
                subtitle: Text(newincomelist[index].id),
                trailing: IconButton(onPressed: () {
                  String n=newincomelist[index].id;
                 CategoryDB().deleteCategories(newincomelist[index].id);
                 print('delete id:$n');
                }, icon: Icon(Icons.delete)),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: newincomelist.length,
        );
      },

    );
  }
}
