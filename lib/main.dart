import 'package:Inspection/views/login_scren/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/data_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DataModel>(
        create: (_) => DataModel(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inspection Form Field',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
