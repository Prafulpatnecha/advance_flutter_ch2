import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> readShowDialog(BuildContext context,String name,String address) {
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text(name.toString().capitalizeFirst!),
      content: Text("Address : \n$address"),
      actions: [
        MaterialButton(onPressed: () {
          Navigator.of(context).pop();
        },child: const Text("Close"),)
      ],
    );
  },);
}

TextFormField buildTextFormField(TextEditingController txtId, String value) {
  return TextFormField(
    controller: txtId,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      label: Text(value),
      border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      focusedBorder:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    ),
  );
}