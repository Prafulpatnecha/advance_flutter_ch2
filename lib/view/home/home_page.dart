import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [

            ],),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/count");
              },
              child: Text("Counting"),
            ),
          ],
        ),
      ),
    );
  }
}
