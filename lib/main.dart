import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/app_route.dart';
import 'package:learning_flutter/utils/providers.dart';
import 'package:learning_flutter/utils/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: '/',
    );
  }
}
