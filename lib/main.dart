import 'package:band_names/pages/home.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: 'home',
      routes: {
        'home':(BuildContext context) => HomePage(),
      },
    );
  }
}