import 'package:advance_flutter_ch2/view/management_system/controller/management_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../components/home_component.dart';

class HomeManage extends StatelessWidget {
  const HomeManage({super.key});

  @override
  Widget build(BuildContext context) {
    ManagementController managementController = Get.put(ManagementController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        centerTitle: true,
        title: const Text("Management System"),
      ),
      body: GetBuilder<ManagementController>(
          builder: (_) {
            return Obx(
              () =>  ListView.builder(
                itemCount: managementController.serverList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      readShowDialog(context,managementController.serverList[index].name,managementController.serverList[index].address);
                    },
                    child: Card(
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            setSlidableAction(managementController, index),
                            SlidableAction(
                              onPressed: (context) {
                                managementController.deleteData(index);
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Text(
                              managementController.serverList[index].id.toString()),
                          title: Text(
                            managementController.serverList[index].name
                                .toString()
                                .capitalizeFirst!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "${managementController
                                            .serverList[index].department
                                            .toString()
                                            .toString()
                                            .toUpperCase()}/",
                                    style:
                                        const TextStyle(color: Colors.black, fontSize: 13)),
                                TextSpan(
                                    text: managementController.serverList[index].email
                                        .toString()
                                        .toUpperCase(),
                                    style:
                                        const TextStyle(color: Colors.black, fontSize: 10)),
                              ],
                            ),
                          ),
                          trailing: Text(managementController
                              .serverList[index].shiftTime
                              .toString()
                              .capitalizeFirst!),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtId = TextEditingController();
          TextEditingController txtName = TextEditingController();
          TextEditingController txtEmail = TextEditingController();
          TextEditingController txtAddress = TextEditingController();
          TextEditingController txtDepartment = TextEditingController();
          TextEditingController txtShiftTime = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTextFormField(txtId, "Id"),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTextFormField(txtName, "Name"),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTextFormField(txtEmail, "Email"),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTextFormField(txtAddress, "Address"),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTextFormField(txtDepartment, "Department"),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTextFormField(txtShiftTime, "Shift Time"),
                      ],
                    ),
                  ),
                ),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Map serverMap = {
                        'id': int.parse(txtId.text.toString()),
                        'name': txtName.text.toString(),
                        'email': txtEmail.text.toString(),
                        'address': txtAddress.text.toString(),
                        'department': txtDepartment.text.toString(),
                        'shiftTime': txtShiftTime.text.toString(),
                      };
                      managementController.dataAdding(serverMap);
                    },
                    child: const Text("Save"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }

  SlidableAction setSlidableAction(ManagementController managementController, int index) {
    return SlidableAction(
                          onPressed: (context) {
                            TextEditingController txtId = TextEditingController();
                            TextEditingController txtName =
                                TextEditingController();
                            TextEditingController txtEmail =
                                TextEditingController();
                            TextEditingController txtAddress =
                                TextEditingController();
                            TextEditingController txtDepartment =
                                TextEditingController();
                            TextEditingController txtShiftTime =
                                TextEditingController();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: SizedBox(
                                    height: 100,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          buildTextFormField(txtId, "Id"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          buildTextFormField(txtName, "Name"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          buildTextFormField(txtEmail, "Email"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          buildTextFormField(
                                              txtAddress, "Address"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          buildTextFormField(
                                              txtDepartment, "Department"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          buildTextFormField(
                                              txtShiftTime, "Shift Time"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Map serverMap = {
                                          'id': int.parse(txtId.text.toString()),
                                          'name': txtName.text.toString(),
                                          'email': txtEmail.text.toString(),
                                          'address': txtAddress.text.toString(),
                                          'department':
                                              txtDepartment.text.toString(),
                                          'shiftTime':
                                              txtShiftTime.text.toString(),
                                        };
                                        // print(serverMap);
                                        managementController.updateData(
                                            serverMap, index);
                                      },
                                      child: const Text("Save"),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          label: 'Edit',
                          icon: Icons.edit,
                        );
  }
}
