//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';

const CATEGORY_DB_NAME = 'category-database';
ValueNotifier<List<CategoryModel>> incomelistnotifier=ValueNotifier([]);
ValueNotifier<List<CategoryModel>> expenselistnotifier=ValueNotifier([]);


abstract class CategoryDbFunctions {

  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDbFunctions {

  CategoryDB._internal();
  static CategoryDB instance=CategoryDB._internal();
  factory CategoryDB(){
    return instance;
  }
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  @override
  Future<void> refreshCategories() async {
   // final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    CategoryDB().getCategories().then((value) {
      incomelistnotifier.value.clear();
      expenselistnotifier.value.clear();
      Future.forEach(value, (CategoryModel item) {
        if(item.type==CategoryType.income){
          incomelistnotifier.value.add(item);
          print(incomelistnotifier);
        }
        else{
          expenselistnotifier.value.add(item);
        }
      });
    }
      );
    incomelistnotifier.notifyListeners();
    expenselistnotifier.notifyListeners();
    }
  @override
  Future<void> deleteCategories(String deleteid) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
     _categoryDB.delete(deleteid);
     print(deleteid);
     refreshCategories();
  }
  }



