import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/counter_controller.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController controller=Get.put(CounterController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Count Ui"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                controller.incrementAndDec(true);
              }, icon: const Icon(Icons.add,size: 30,)),
              const SizedBox(width: 10,),
              Obx(() => Text("${controller.count.value}",style: TextStyle(color: Colors.blue.withOpacity(0.5),fontWeight: FontWeight.bold,fontSize: 50),),),
              const SizedBox(width: 10,),
              IconButton(onPressed: () {
                controller.incrementAndDec(false);
              }, icon: const Icon(Icons.remove,size: 30,))
            ],
          ),
        ),
      ),
    );
  }
}
