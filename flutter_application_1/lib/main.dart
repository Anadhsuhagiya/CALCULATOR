import 'package:flutter/material.dart';
import 'package:flutter_application_1/Calculation.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: Scaffold(
        body: Calculation(),
      ),
    );
  }
}
