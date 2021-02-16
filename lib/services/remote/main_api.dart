import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learning_flutter/employee_list/models/employee.dart';
import 'package:learning_flutter/services/remote/api.dart';

class MainApi extends Api {
  Future<List> getAllEmployee() async {
    final response = await wrapE(
      () => dio.get<dynamic>('/get'),
    );
    List data = jsonDecode(response.data)['data'];
    return data.map((e) => Employee.fromJson(e)).toList();
  }

  Future<List> getAllEmployeeWithHeader() async {
    final response = await wrapE(
      () => dio.get<dynamic>(
        '/header/get',
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
        '/header/post',
        options: Options(
          headers: {'header': 'KelasMobileMalang'},
        ),
        data: data,
      ),
    );
  }
}
