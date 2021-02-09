import 'package:flutter/material.dart';
import 'package:learning_flutter/EmployeeList/view_models/employee_view_model.dart';
import 'package:learning_flutter/services/remote/api.dart';
import 'package:learning_flutter/utils/constant.dart';

class EmployeeListItem extends StatelessWidget {
  final List<EmployeeViewModel> employees;

  EmployeeListItem({this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];

        return ListTile(
          contentPadding: EdgeInsets.all(5),
          title: Text(employee.nama),
          leading: CircleAvatar(
            backgroundImage: employee.foto == null || employee.foto == ''
                ? null
                : NetworkImage('$baseUrl/${employee.foto}'),
          ),
        );
      },
    );
  }
}
