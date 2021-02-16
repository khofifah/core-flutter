import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/services/remote/main_api.dart';

class CreateEmployeeViewModel extends ChangeNotifier {
  bool isLoading = false;

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<Response<dynamic>> createEmployee(dynamic data) async {
    showLoading();
    final results = await MainApi().createEmployee(data);
    hideLoading();
    return results;
  }
}
