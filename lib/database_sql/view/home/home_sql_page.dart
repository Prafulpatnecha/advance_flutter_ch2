import 'dart:io';

import 'package:advance_flutter_ch2/database_sql/contoller/sql_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeSqlPage extends StatelessWidget {
  const HomeSqlPage({super.key});

  @override
  Widget build(BuildContext context) {
    SqlController sqlController = Get.put(SqlController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataBase For SQLITE"),
      ),
      body: GetBuilder<SqlController>(
        builder: (controller) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    sqlController.readIncomeRecord(1);
                  },
                  child: Card(
                      color: Colors.green.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() => Text("${sqlController.incomeTotal}")),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    sqlController.readIncomeRecord(0);

                  },
                  child: Card(
                    color: Colors.red.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() => Text("${sqlController.total}"),),
                      ),),
                ),
                GestureDetector(
                  onTap: () {
                    sqlController.getRecord();
                  },
                  child: Card(
                    color: Colors.blue.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() => Text("${sqlController.incomeTotal.value-sqlController.total.value}"),),
                      ),),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: sqlController.data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: sqlController.data[index]["isIncome"] == 1
                          ? Colors.green.shade100
                          : Colors.red.shade200,
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(sqlController.data[index]["id"].toString()),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: FileImage(
                                  File(sqlController.data[index]["image"])),
                            )
                          ],
                        ),
                        subtitle: Text("\$ " +
                            sqlController.data[index]["amount"].toString()),
                        title: Text(sqlController.data[index]["category"]
                            .toString()
                            .capitalizeFirst
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Edit And Update"),
                                      content: Container(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      TextEditingController
                                                          txtAmount =
                                                          TextEditingController();
                                                      TextEditingController
                                                          txtCategory =
                                                          TextEditingController();
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                "Amount Edit"),
                                                            content: editAmount(
                                                                txtAmount,
                                                                TextInputType
                                                                    .number,
                                                                "Amount"),
                                                            actions: [
                                                              buildMaterialButtonEdit(
                                                                sqlController,
                                                                index,
                                                                txtAmount,
                                                                txtCategory,
                                                                sqlController
                                                                    .backBool
                                                                    .value,
                                                                0,
                                                              ),
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  sqlController
                                                                          .imageFile =
                                                                      null;
                                                                  Get.back();
                                                                },
                                                                child: const Text(
                                                                    "Cancel"),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      if (sqlController
                                                          .backBool.value) {
                                                        sqlController.backBool
                                                            .value = false;
                                                        Get.back();
                                                      }
                                                    },
                                                    child:
                                                        const Text("Amount")),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      TextEditingController
                                                          txtAmount =
                                                          TextEditingController();
                                                      TextEditingController
                                                          txtCategory =
                                                          TextEditingController();
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                "Category Edit"),
                                                            content: editAmount(
                                                                txtCategory,
                                                                TextInputType
                                                                    .text,
                                                                "Category"),
                                                            actions: [
                                                              buildMaterialButtonEdit(
                                                                sqlController,
                                                                index,
                                                                txtAmount,
                                                                txtCategory,
                                                                sqlController
                                                                    .backBool
                                                                    .value,
                                                                1,
                                                              ),
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child: const Text(
                                                                    "Cancel"),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      if (sqlController
                                                          .backBool.value) {
                                                        sqlController.backBool
                                                            .value = false;
                                                        Get.back();
                                                      }
                                                    },
                                                    child:
                                                        const Text("Category")),
                                              ],
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  TextEditingController
                                                      txtAmount =
                                                      TextEditingController();
                                                  TextEditingController
                                                      txtCategory =
                                                      TextEditingController();
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            "Category Edit"),
                                                        content: Obx(
                                                          () => SwitchListTile(
                                                            value: sqlController
                                                                .incomeBool
                                                                .value,
                                                            onChanged: (value) {
                                                              sqlController
                                                                  .getIncome(
                                                                      value);
                                                            },
                                                            title: const Text(
                                                                "Income/Expanse"),
                                                          ),
                                                        ),
                                                        actions: [
                                                          buildMaterialButtonEdit(
                                                            sqlController,
                                                            index,
                                                            txtAmount,
                                                            txtCategory,
                                                            sqlController
                                                                .backBool.value,
                                                            2,
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () {
                                                              sqlController
                                                                  .incomeBool
                                                                  .value = false;
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                "Cancel"),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (sqlController
                                                      .backBool.value) {
                                                    sqlController
                                                        .backBool.value = false;
                                                    Get.back();
                                                  }
                                                },
                                                child: const Text(
                                                    "Income/Expanse")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  TextEditingController
                                                      txtAmount =
                                                      TextEditingController();
                                                  TextEditingController
                                                      txtCategory =
                                                      TextEditingController();
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            "Category Edit"),
                                                        content: Container(
                                                          height: 150,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    ImagePicker
                                                                        imagePicker =
                                                                        ImagePicker();
                                                                    XFile?
                                                                        xFileImage =
                                                                        await imagePicker.pickImage(
                                                                            source:
                                                                                ImageSource.gallery);
                                                                    if (xFileImage !=
                                                                        null) {
                                                                      sqlController
                                                                          .imagePick(
                                                                              xFileImage);
                                                                    }
                                                                  },
                                                                  child: GetBuilder<
                                                                      SqlController>(
                                                                    builder: (controller) => (sqlController.imageFile !=
                                                                            null)
                                                                        ? Obx(
                                                                            () =>
                                                                                CircleAvatar(
                                                                              radius: 30,
                                                                              backgroundImage: FileImage(File(sqlController.imageFile!.value.path)),
                                                                            ),
                                                                          )
                                                                        : CircleAvatar(
                                                                            radius:
                                                                                30,
                                                                            backgroundColor:
                                                                                Colors.blue.shade100,
                                                                          ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 10,),
                                                                editAmount(
                                                                    txtAmount,
                                                                    TextInputType
                                                                        .number,
                                                                    "Amount"),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                editAmount(
                                                                    txtCategory,
                                                                    TextInputType
                                                                        .text,
                                                                    "Category"),
                                                                Obx(
                                                                  () =>
                                                                      SwitchListTile(
                                                                    value: sqlController
                                                                        .incomeBool
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      sqlController
                                                                          .getIncome(
                                                                              value);
                                                                    },
                                                                    title: const Text(
                                                                        "Income/Expanse"),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          buildMaterialButtonEdit(
                                                              sqlController,
                                                              index,
                                                              txtAmount,
                                                              txtCategory,
                                                              sqlController
                                                                  .backBool
                                                                  .value,
                                                              3),
                                                          MaterialButton(
                                                            onPressed: () {
                                                              sqlController
                                                                  .incomeBool
                                                                  .value = false;
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                "Cancel"),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (sqlController
                                                      .backBool.value) {
                                                    sqlController
                                                        .backBool.value = false;
                                                    sqlController.imageFile =
                                                        null;
                                                    Get.back();
                                                  }
                                                },
                                                child: const Text(
                                                    "All Record Update")),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () {
                                            sqlController.imageFile = null;
                                            Get.back();
                                          },
                                          child: const Text("Cancel"),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  sqlController.deleteRecord(
                                      id: int.parse(sqlController.data[index]
                                              ['id']
                                          .toString()));
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtAmount = TextEditingController();
          TextEditingController txtCategory = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return buildAlertDialog(
                  txtCategory, txtAmount, sqlController, context);
            },
          );
        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }

  MaterialButton buildMaterialButtonEdit(
      SqlController sqlController,
      int index,
      TextEditingController txtAmount,
      TextEditingController txtCategory,
      bool backBool,
      int changeValue) {
    return MaterialButton(
      onPressed: () {
        int income = 0;
        if (sqlController.incomeBool.value) {
          income = 1;
        } else {
          income = 0;
        }
        sqlController.updateRecord(
            changeValue: changeValue,
            id: int.parse(sqlController.data[index]['id'].toString()),
            amount: (changeValue != 2 && changeValue != 1)
                ? double.parse(txtAmount.text.toString())
                : 0,
            category: txtCategory.text,
            isIncome: income,
            image: (changeValue==3)?sqlController.imageFile!.value.path:"");
        sqlController.incomeBool.value = false;
        sqlController.imageFile = null;
        backBool = true;
        Get.back();
      },
      child: const Text("Save"),
    );
  }

  TextField editAmount(TextEditingController txtAmount, TextInputType textInput,
      String lableValue) {
    return TextField(
      controller: txtAmount,
      keyboardType: textInput,
      decoration: InputDecoration(
          label: Text(lableValue),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }

  AlertDialog buildAlertDialog(
      TextEditingController txtCategory,
      TextEditingController txtAmount,
      SqlController sqlController,
      BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    return AlertDialog(
      title: const Text("DataBase Report"),
      content: Container(
        height: 150,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? xFileImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (xFileImage != null) {
                    sqlController.imagePick(xFileImage);
                  }
                },
                child: GetBuilder<SqlController>(
                  builder: (controller) => (sqlController.imageFile != null)
                      ? Obx(
                          () => CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(
                                File(sqlController.imageFile!.value.path)),
                          ),
                        )
                      : CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue.shade100,
                        ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildTextFormField(txtCategory, TextInputType.text, "Category"),
              const SizedBox(
                height: 5,
              ),
              buildTextFormField(txtAmount, TextInputType.number, "Amount"),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => SwitchListTile(
                  value: sqlController.incomeBool.value,
                  onChanged: (value) {
                    sqlController.getIncome(value);
                  },
                  title: const Text("Income/Expanse"),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            int income = 0;
            if (sqlController.incomeBool.value) {
              income = 1;
            } else {
              income = 0;
            }
            if (txtCategory.text.isNotEmpty && txtAmount.text.isNotEmpty) {
              sqlController.insertRecord(
                  amount: double.parse(txtAmount.text),
                  category: txtCategory.text,
                  isIncome: double.parse(income.toString()),
                  image: sqlController.imageFile!.value.path);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Value most be Filled!!!")));
            }
            sqlController.incomeBool.value = false;
            sqlController.imageFile = null;
            Navigator.of(context).pop();
          },
          child: const Text("Save"),
        ),
        MaterialButton(
          onPressed: () {
            sqlController.incomeBool.value = false;
            sqlController.imageFile = null;
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  TextFormField buildTextFormField(TextEditingController txtController,
      TextInputType inputType, String labelName) {
    return TextFormField(
      keyboardType: inputType,
      controller: txtController,
      decoration: InputDecoration(
        label: Text(labelName),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
