import 'package:Inspection/data/data.dart';
import 'package:Inspection/views/home_screen/home.dart';
import 'package:Inspection/views/home_screen/models/dataModel.dart';
import 'package:Inspection/views/login_scren/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
