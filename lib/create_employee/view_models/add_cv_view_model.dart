import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddCvViewModel extends ChangeNotifier {
  FilePickerResult result;

  Future<void> pickFile() async {
    FilePickerResult file = await FilePicker.platform.pickFiles();
    result = file == null ? result : file;
    notifyListeners();
  }
}
