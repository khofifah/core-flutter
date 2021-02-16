import 'package:flutter/material.dart';
import 'package:learning_flutter/employee_list/view_models/employee_list_view_model.dart';
import 'package:learning_flutter/employee_list/widgets/employee_list_item.dart';
import 'package:learning_flutter/utils/shared_preferences_handler.dart';
import 'package:provider/provider.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage>
    with SharedPreferencesHandler {
  EmployeeListViewModel dataEmployees;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataEmployees =
          Provider.of<EmployeeListViewModel>(context, listen: false);
      getData();
    });
    super.initState();
  }

  getData() async {
    await dataEmployees.getAllEmployeeWithHeader();
    setState(() {
      isLoading = false;
    });
    var data = await getUserData();
  }

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
        onPressed: () => Navigator.pushNamed(context, '/create_employee'),
      ),
    );
  }
}
