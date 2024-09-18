import 'package:flutter/material.dart';
import 'package:list_pais/views/login_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Bestsellers',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginView(),
    );
  }
}