import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/app_sizes.dart';

class LabelForm extends StatelessWidget {
  final String label;

  LabelForm({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: FontSizes.s16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
