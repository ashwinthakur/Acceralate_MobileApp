import 'package:flutter/material.dart';
import 'modules/home/Ui/buttomNavigation.dart';

void main() => runApp(Template());

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accelerate_Mobile_App',
      debugShowCheckedModeBanner: false,
      home: ButtomNavigationPage(),
    );
  }
}
