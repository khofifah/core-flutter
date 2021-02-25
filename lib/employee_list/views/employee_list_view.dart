import 'package:flutter/material.dart';
import 'package:learning_flutter/employee_list/views/employee_list_view_model.dart';
import 'package:learning_flutter/employee_list/widgets/employee_list_item.dart';

class EmployeeListView extends EmployeeListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Karyawan'),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: EmployeeListItem(
                    employees: dataEmployees.employees,
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/test'),
      ),
    );
  }
}
