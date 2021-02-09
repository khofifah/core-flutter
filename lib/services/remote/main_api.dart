import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learning_flutter/EmployeeList/models/employee.dart';
import 'package:learning_flutter/services/remote/api.dart';

class MainApi extends Api {
  Future<List> getAllEmployee() async {
    final response = await wrapE(
      () => dio.get<dynamic>('$apiBaseUrl/get'),
    );
    List data = jsonDecode(response.data)['data'];
    return data.map((e) => Employee.fromJson(e)).toList();
  }

  Future<List> getAllEmployeeWithHeader() async {
    final response = await wrapE(
      () => dio.get<dynamic>(
        '$apiBaseUrl/header/get',
        options: Options(
          headers: {'header': 'KelasMobileMalang'},
        ),
      ),
    );
    List data = jsonDecode(response.data)['data'];
    return data.map((e) => Employee.fromJson(e)).toList();
  }

  Future<Response<dynamic>> createEmployee(dynamic data) async {
    return wrapE(
      () => dio.post(
        '$apiBaseUrl/header/post',
        options: Options(
          headers: {'header': 'KelasMobileMalang'},
        ),
        data: data,
      ),
    );
  }
}
