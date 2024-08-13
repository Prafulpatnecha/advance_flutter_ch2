
class EmployeesModal {
  late int id;
  late String name,email,address,department,shiftTime;

  EmployeesModal(
      {required this.id,
        required this.name,
        required this.email,
        required this.address,
        required this.department,
        required this.shiftTime});
  factory EmployeesModal.fromData(Map m1)
  {
    return EmployeesModal(id: m1['id'], name: m1['name'], email: m1['email'], address: m1['address'], department: m1['department'], shiftTime: m1['shiftTime']);
  }
}