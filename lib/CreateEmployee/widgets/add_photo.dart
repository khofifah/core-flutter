import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_flutter/CreateEmployee/view_models/add_photo_view_model.dart';
import 'package:learning_flutter/utils/app_sizes.dart';
import 'package:provider/provider.dart';

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      final addPhoto = Provider.of<AddPhotoViewModel>(context);
      final image = context.watch<AddPhotoViewModel>().image;

      return Container(
        width: double.infinity,
        child: Column(
          children: [
            image == null
                ? Icon(
                    Icons.person,
                    size: Sizes.s150,
                    color: Colors.grey[300],
                  )
                : Image.file(
                    File(image.path),
                    width: Sizes.s150,
                    fit: BoxFit.fitWidth,
                  ),
            ElevatedButton(
              child: Text('Tambahkan foto'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Pilih Gambar'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pilih satu sumber untuk gambar yang ingin dikirim',
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                child: Text('Gallery'),
                                onPressed: () {
                                  addPhoto
                                      .pickImage(ImageSource.gallery)
                                      .then((value) => Navigator.pop(context));
                                },
                              ),
                              ElevatedButton(
                                child: Text('Camera'),
                                onPressed: () {
                                  addPhoto
                                      .pickImage(ImageSource.camera)
                                      .then((value) => Navigator.pop(context));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
