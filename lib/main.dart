import 'package:flutter/material.dart';
import 'package:infectify/page/tabs_page.dart';

import 'locator.dart';

void main() {
  initializeServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infectify',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.lightGreenAccent,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      home: TabsPage(),
    );
  }
}
