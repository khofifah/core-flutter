import 'package:flutter/material.dart';
import 'package:learning_flutter/CreateEmployee/view_models/add_cv_view_model.dart';
import 'package:learning_flutter/CreateEmployee/view_models/add_photo_view_model.dart';
import 'package:learning_flutter/CreateEmployee/view_models/create_employee_view_model.dart';
import 'package:learning_flutter/EmployeeList/view_models/employee_list_view_model.dart';
import 'package:learning_flutter/services/remote/main_api.dart';
import 'package:learning_flutter/utils/app_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        Provider<MainApi>(create: (_) => MainApi()),
        ChangeNotifierProvider<EmployeeListViewModel>(
            create: (_) => EmployeeListViewModel()),
        ChangeNotifierProvider<CreateEmployeeViewModel>(
            create: (_) => CreateEmployeeViewModel()),
        ChangeNotifierProvider<AddPhotoViewModel>(
            create: (_) => AddPhotoViewModel()),
        ChangeNotifierProvider<AddCvViewModel>(create: (_) => AddCvViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
