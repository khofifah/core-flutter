import 'package:flutter/material.dart';
import 'package:learning_flutter/create_employee/pages/create_employee_page.dart';
import 'package:learning_flutter/employee_list/pages/employee_list_page.dart';
import 'package:learning_flutter/testscreen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/create_employee':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => CreateEmployeePage(),
        );
        break;

      case '/test':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => TestScreen(),
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
