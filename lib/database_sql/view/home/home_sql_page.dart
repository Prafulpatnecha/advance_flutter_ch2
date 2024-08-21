import 'dart:ffi';

import 'package:advance_flutter_ch2/database_sql/contoller/sql_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeSqlPage extends StatelessWidget {
  const HomeSqlPage({super.key});

  @override
  Widget build(BuildContext context) {
    SqlController sqlController = Get.put(SqlController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataBase For SQLITE"),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        TextEditingController txtAmount = TextEditingController();
        TextEditingController txtIsIncome = TextEditingController();
        TextEditingController txtCategory = TextEditingController();
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text("DataBase Report"),
            content: Container(
              height: 150,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildTextFormField(txtCategory,TextInputType.text,"Category"),
                    const SizedBox(height: 5,),
                    buildTextFormField(txtAmount,TextInputType.number,"Amount"),
                    const SizedBox(height: 5,),
                    buildTextFormField(txtIsIncome,TextInputType.number,"Income"),
                  ],
                ),
              ),
            ),
            actions: [
              MaterialButton(onPressed: () {
                if(txtIsIncome.text=="")
                  {
                    txtIsIncome.text="0";
                  }
                if(txtCategory.text.isNotEmpty && txtAmount.text.isNotEmpty)
                  {
                    sqlController.insertRecord(amount: double.parse(txtAmount.text), category: txtCategory.text, isIncome: double.parse(txtIsIncome.text));
                  }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Value most be Filled!!!")));
                }
                Navigator.of(context).pop();
              },child: const Text("Save"),),
              MaterialButton(onPressed: () {
                Navigator.of(context).pop();
              },child: const Text("Cancel"),),
            ],
          );
        },);
      },child: const Icon(Icons.play_arrow_outlined),),
    );
  }

  TextFormField buildTextFormField(TextEditingController txtController,TextInputType inputType,String labelName) {
    return TextFormField(
                  keyboardType: inputType,
                  controller: txtController,
                  decoration: InputDecoration(
                    label: Text(labelName),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    ),
                );
  }
}
