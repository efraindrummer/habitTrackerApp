import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trackerhabits/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("Habit_Database");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}