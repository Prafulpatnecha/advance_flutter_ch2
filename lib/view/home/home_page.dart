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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/count");
                },
                child: const Text("Counting"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/manage");
                },
                child: const Text("Management System"),
              ),
            ],),
          ],
        ),
      ),
    );
  }
}
