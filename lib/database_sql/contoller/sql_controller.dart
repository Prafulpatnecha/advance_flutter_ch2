import 'package:advance_flutter_ch2/database_sql/sql_helper/sql_home_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SqlController extends GetxController{

  @override
  void onInit()
  {
    super.onInit();
    initDataDb();
  }

  Future<void> initDataDb()
  async {
     DbHelper.dbHelper.database;
  }
  Future<void> insertRecord({required double amount,required double isIncome,required String category})
  async {
    await DbHelper.dbHelper.insertData(amount: amount, isIncome: isIncome, category: category);
  }
}