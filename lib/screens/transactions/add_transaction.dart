import 'package:flutter/material.dart';
import 'package:moneymanagement/db/category/category_db.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType = CategoryType.income;
  CategoryModel? _selectedCategoryModel;
  Object? _selectedCategoryname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Purpose',
                  border: OutlineInputBorder(),
                ),
              ),
              Divider(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Amount'),
              ),
              TextButton.icon(
                  onPressed: () async {
                    final _selectedDateTemp = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now(),
                    );
                    if (_selectedDateTemp == null) {
                      return;
                    } else {
                      setState(() {
                        _selectedDate = _selectedDateTemp;
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_view_month_rounded),
                  label: _selectedDate == null
                      ? Text('Select date')
                      : Text(_selectedDate.toString())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Income/Expense:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio<CategoryType>(
                    value: CategoryType.income,
                    groupValue: _selectedCategoryType,
                    onChanged: (selectedvaluetemp) {
                      setState(() {
                        _selectedCategoryType = selectedvaluetemp;
                      });
                    },
                  ),
                  Text('Income'),
                  Radio<CategoryType>(
                    value: CategoryType.expense,
                    groupValue: _selectedCategoryType,
                    onChanged: (selectedvaluetemp) {
                      setState(() {
                        _selectedCategoryType = selectedvaluetemp;
                      });
                    },
                  ),
                  Text('Expense'),
                ],
              ),
              DropdownButton(
                hint: Text('Select Category'),
                value: _selectedCategoryname,
                items: incomelistnotifier.value.map((e) {
                  return DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (changedvalue) {
                  setState(() {
                    _selectedCategoryname = changedvalue;
                  });
                  print(changedvalue);
                },
              ),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
