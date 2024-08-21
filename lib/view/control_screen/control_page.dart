import 'package:advance_flutter_ch2/database_sql/view/home/home_sql_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../counter_screen/counter_page.dart';
import '../home/home_page.dart';
import '../management_system/view/home/home_manage.dart';

class MyAppControl extends StatelessWidget {
  const MyAppControl({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage(),transition: Transition.cupertino),
        GetPage(name: '/count', page: () => const CountPage(),transition: Transition.rightToLeftWithFade),
        GetPage(name: '/manage', page: () => const HomeManage(),transition: Transition.leftToRightWithFade),
        GetPage(name: '/finance', page: () => const HomeSqlPage(),transition: Transition.topLevel),
      ],
    );
  }
}
