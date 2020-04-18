import 'HomePage.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Scratch And Win',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primaryColor: Colors.pink,
     ),
     home: HomePage(),
   );
 }
}