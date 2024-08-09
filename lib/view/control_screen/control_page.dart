import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../counter_screen/counter_page.dart';
import '../home/home_page.dart';

class MyAppControl extends StatelessWidget {
  const MyAppControl({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage(),transition: Transition.cupertino),
        GetPage(name: '/count', page: () => const CountPage(),transition: Transition.rightToLeftWithFade),
      ],
    );
  }
}
