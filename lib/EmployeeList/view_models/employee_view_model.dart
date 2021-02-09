import 'package:learning_flutter/EmployeeList/models/employee.dart';

class EmployeeViewModel {
  Employee employee;

  EmployeeViewModel({this.employee});

  String get nama {
    return this.employee.nama;
  }

  int get umur {
    return this.employee.umur;
  }

  bool get fulltime {
    return this.employee.fulltime;
  }

  String get foto {
    return this.employee.foto;
  }

  String get cv {
    return this.employee.cv;
  }
}
