import 'package:flutter/material.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';

ValueNotifier<CategoryType> radiobuttonnotifier =
    ValueNotifier(CategoryType.income);

class Radiobutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: radiobuttonnotifier,
      builder: (BuildContext ctx, CategoryType type, Widget? _) {
        return Row(
          children: [
            Radio<CategoryType>(
              value: CategoryType.income,
              groupValue: type,
              onChanged: (value) {
                radiobuttonnotifier.value = value!;
              },
            ),
            Text('Income'),
            Radio<CategoryType>(
              value: CategoryType.expense,
              groupValue: type,
              onChanged: (value) {
                radiobuttonnotifier.value = value!;
              },
            ),
            Text('Expense'),
          ],
        );
      },
    );
  }
}
