
import 'package:advance_flutter_ch2/view/management_system/modal/employees_modal.dart';
import 'package:get/get.dart';

class ManagementController extends GetxController {
  RxList<EmployeesModal> serverList = <EmployeesModal>[].obs;

  void dataAdding(Map serverMap) {
    serverList.add(EmployeesModal.fromData(serverMap));
  }
  void updateData(Map serverMap,int index)
  {
    // print(serverMap['id']);
    serverList[index].id=serverMap['id'];
    serverList[index].name=serverMap['name'];
    serverList[index].email=serverMap['email'];
    serverList[index].address=serverMap['address'];
    serverList[index].department=serverMap['department'];
    serverList[index].shiftTime=serverMap['shiftTime'];
    update();
  }
  void deleteData(int index)
  {
    serverList.removeAt(index);
  }
}
