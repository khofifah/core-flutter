import 'package:flutter/material.dart';
import 'package:learning_flutter/employee_list/pages/employee_list_page.dart';
import 'package:learning_flutter/employee_list/providers/employee_list_provider.dart';
import 'package:learning_flutter/utils/shared_preferences_handler.dart';
import 'package:provider/provider.dart';

abstract class EmployeeListViewModel extends State<EmployeeListPage>
    with SharedPreferencesHandler {
  EmployeeListProvider dataEmployees;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataEmployees = Provider.of<EmployeeListProvider>(context, listen: false);
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
}
