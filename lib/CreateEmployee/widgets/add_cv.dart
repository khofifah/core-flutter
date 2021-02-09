import 'package:flutter/material.dart';
import 'package:learning_flutter/CreateEmployee/view_models/add_cv_view_model.dart';
import 'package:learning_flutter/CreateEmployee/widgets/label_form.dart';
import 'package:learning_flutter/utils/app_sizes.dart';
import 'package:provider/provider.dart';

class AddCv extends StatefulWidget {
  @override
  _AddCvState createState() => _AddCvState();
}

class _AddCvState extends State<AddCv> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      final addCv = Provider.of<AddCvViewModel>(context);
      final result = context.watch<AddCvViewModel>().result;
      final fileName = result == null ? null : result.files.first.name;

      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelForm(label: 'Curriculum Vitae'),
            Row(
              children: [
                fileName == null ? Container() : Text(fileName),
                IconButton(
                  color: Colors.lightBlue,
                  icon: Icon(
                    fileName == null ? Icons.add : Icons.edit,
                    size: Sizes.s15,
                  ),
                  onPressed: () {
                    addCv.pickFile();
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
