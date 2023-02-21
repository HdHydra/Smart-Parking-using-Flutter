import 'package:flutter/material.dart';
import 'package:model/pages/registration_page.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
