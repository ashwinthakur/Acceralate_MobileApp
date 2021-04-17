import 'package:flutter/material.dart';
import 'package:new_video/modules/user/ui/login.dart';
import 'modules/home/Ui/buttomNavigationbar.dart';

void main() => runApp(Template());

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accelerate',
      debugShowCheckedModeBanner: false,
      home: ButtomNavigationPage(),
    );
  }
}
