import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/items_data.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<ItemData>(
      create: (BuildContext context) => ItemData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.green,
          // accentColor: Colors.green,
          appBarTheme: const AppBarTheme(color: Colors.green),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white))),
      home: const HomePage(),
    );
  }
}
