import 'models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/screens/dashbord/dashbord.dart';
import 'views/screens/input/input.dart';
import 'views/screens/login/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DataModel>(
        create: (_) => DataModel(),
      ),
    ],
    builder: (context, child) => MyApp(),
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
      routes: {
        InputScreen.routName: (ctx) => InputScreen(),
        Dashbaord.routeName: (ctx) => Dashbaord(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
