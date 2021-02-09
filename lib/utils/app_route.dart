import 'package:flutter/material.dart';
import 'package:learning_flutter/CreateEmployee/pages/create_employee_page.dart';
import 'package:learning_flutter/EmployeeList/pages/employee_list_page.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/createEmployee':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => CreateEmployeePage(),
        );
        break;

      case '/':
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => EmployeeListPage(),
        );
        break;
    }
  }
}
