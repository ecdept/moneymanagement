import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';
import 'package:moneymanagement/screens/home/widgets/radiobutton_alertbox_category.dart';

final addcategorynotifier = TextEditingController();

alertboxToAddcategory(BuildContext context) {
  return AlertDialog(
    title: Text('Add Category:'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: addcategorynotifier,
          decoration: InputDecoration(
            hintText: 'Add Category',
            border: OutlineInputBorder(),
          ),
        ),
        Radiobutton(),
        ElevatedButton(
          onPressed: () {
            final data = CategoryModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              name: addcategorynotifier.text,
              type: radiobuttonnotifier.value,
            );
            CategoryDB().insertCategory(data);
            CategoryDB().refreshCategories();
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        )
      ],
    ),
  );
}
