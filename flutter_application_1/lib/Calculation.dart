import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  int result;

  @override
  Widget build(BuildContext context) {
    return ResultDisplay(text: '0');
  }
}
