import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/color_theme_data.dart';
import 'package:get_it_done_app/models/items_data.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (BuildContext context) => ColorThemeData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorThemeData>(context).loadThemeToSharedPref();
    Provider.of<ItemData>(context).loadItemsFromSharedPref();
    return MaterialApp(
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: const HomePage(),
    );
  }
}
