import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoViewModel extends ChangeNotifier {
  PickedFile image;

  Future<void> pickImage(ImageSource source) async {
    PickedFile photo = await ImagePicker().getImage(source: source);
    image = photo == null ? image : photo;
    notifyListeners();
  }
}
