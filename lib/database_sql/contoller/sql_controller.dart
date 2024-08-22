import 'package:advance_flutter_ch2/database_sql/sql_helper/sql_home_helper.dart';
import 'package:get/get.dart';

class SqlController extends GetxController{

  RxList data=[].obs;
  RxBool incomeBool=false.obs;
  RxBool backBool=false.obs;
  RxDouble total= 0.0.obs;
  RxDouble incomeTotal= 0.0.obs;

  void getIncome(bool value)
  {
    incomeBool.value=value;
  }
  @override
  void onInit()
  {
    super.onInit();
    initDataDb();
    getRecord();
  }

  Future<void> initDataDb()
  async {
     DbHelper.dbHelper.database;
     getRecord();
  }
  Future<void> insertRecord({required double amount,required double isIncome,required String category})
  async {
    await DbHelper.dbHelper.insertData(amount: amount, isIncome: isIncome, category: category);
    getRecord();
  }

  Future<RxList> getRecord()
  async {
    data.value= await DbHelper.dbHelper.readData();
    total=0.0.obs;
    incomeTotal=0.0.obs;
    for(int i=0; i<data.length;i++)
      {
        if(data[i]["isIncome"]==0)
          {
            total.value=total.value+data[i]["amount"];
          }
        else{
            incomeTotal.value=incomeTotal.value+data[i]["amount"];
        }
      }
    update();
    return data;
  }
  //todo update
  Future<void> updateRecord(
      {
        required int changeValue,
      required int id,
      required double amount,
      required String category,
      required int isIncome})
  async {
    await DbHelper.dbHelper.updateData(changeValue, id, amount, category, isIncome);
    getRecord();
  }
  Future<void> deleteRecord({required int id})
  async {
    await DbHelper.dbHelper.deleteData(id);
    getRecord();
  }
}