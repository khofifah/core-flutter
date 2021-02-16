import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/create_employee/view_models/add_cv_view_model.dart';
import 'package:learning_flutter/create_employee/view_models/add_photo_view_model.dart';
import 'package:learning_flutter/create_employee/view_models/create_employee_view_model.dart';
import 'package:learning_flutter/create_employee/widgets/add_cv.dart';
import 'package:learning_flutter/create_employee/widgets/add_photo.dart';
import 'package:learning_flutter/create_employee/widgets/label_form.dart';
import 'package:provider/provider.dart';

import '../../utils/app_sizes.dart';

class CreateEmployeePage extends StatefulWidget {
  @override
  _CreateEmployeePageState createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerUmur = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addEmployee = Provider.of<CreateEmployeeViewModel>(context);
    final isLoading = context.watch<CreateEmployeeViewModel>().isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Karyawan'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddPhoto(),
                    SizedBox(height: Sizes.s120),
                    LabelForm(label: 'Nama'),
                    TextFormField(
                      controller: controllerNama,
                      decoration: InputDecoration(
                        hintText: 'Khofifah',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Nama tidak boleh kosong!';
                        } else if (value.length < 3) {
                          return 'Nama harus memiliki lebih dari 3 karakter';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 15),
                    LabelForm(label: 'Umur'),
                    TextFormField(
                      controller: controllerUmur,
                      decoration: InputDecoration(
                        hintText: '18',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Umur tidak boleh kosong!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 15),
                    AddCv(),
                    SizedBox(height: 15),
                    ElevatedButton(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: isLoading == true
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 1,
                              )
                            : Text('Submit'),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (formKey.currentState.validate()) {
                          final image = context.read<AddPhotoViewModel>().image;
                          final cv = context.read<AddCvViewModel>().result;
                          FormData formData = FormData.fromMap({
                            'nama': controllerNama.text,
                            'umur': controllerUmur.text,
                            'foto': await MultipartFile.fromFile(image.path),
                            'cv': await MultipartFile.fromFile(
                              cv.files.first.path,
                            ),
                          });
                          addEmployee.createEmployee(formData).then((value) {
                            if (value.statusCode == 200) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Karyawan berhasil ditambahkan'),
                                  backgroundColor: Colors.lightGreen,
                                ),
                              );
                            } else {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Karyawan tidak berhasil ditambahkan'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          });
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Data salah'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
