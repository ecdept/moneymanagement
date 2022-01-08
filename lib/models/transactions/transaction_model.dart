import 'package:hive/hive.dart';
import 'package:moneymanagement/models/transactions/category/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel{

  @HiveField(0)
  final String purpose;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final CategoryType categorytype;

  @HiveField(4)
  final CategoryModel categorymodel;

  @HiveField(5)
   String id='';

  TransactionModel({required this.purpose,required this.amount,required this.date,required this.categorytype,required this.categorymodel}){
    id=DateTime.now().microsecondsSinceEpoch.toString();
  }

}