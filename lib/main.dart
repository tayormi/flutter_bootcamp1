import 'package:flutter/material.dart';
import 'package:shoppinglist/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Shopping List',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primarySwatch: Colors.lime),
      // A widget which will be started on application startup
      home: const HomeScreen(),
    );
  }
}
