import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../create_employee/view_models/add_cv_view_model.dart';
import '../create_employee/view_models/add_photo_view_model.dart';
import '../create_employee/view_models/create_employee_view_model.dart';
import '../employee_list/providers/employee_list_provider.dart';
import '../services/remote/main_api.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  Provider<MainApi>(create: (_) => MainApi()),
  ChangeNotifierProvider<EmployeeListProvider>(
      create: (_) => EmployeeListProvider()),
  ChangeNotifierProvider<CreateEmployeeViewModel>(
      create: (_) => CreateEmployeeViewModel()),
  ChangeNotifierProvider<AddPhotoViewModel>(create: (_) => AddPhotoViewModel()),
  ChangeNotifierProvider<AddCvViewModel>(create: (_) => AddCvViewModel()),
];
