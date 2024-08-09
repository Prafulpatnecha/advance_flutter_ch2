

import 'package:get/get.dart';

class CounterController extends GetxController
{
    RxInt count=0.obs;
    void incrementAndDec(bool value)
    {
        if(value)
            {
                count++;
            }
        else
            {
                count--;
            }
    }
}