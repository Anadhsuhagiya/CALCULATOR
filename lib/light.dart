import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class light extends StatefulWidget {
  const light({Key? key}) : super(key: key);

  @override
  State<light> createState() => _lightState();
}

class _lightState extends State<light> {


  late int first;
  late int second;
  String history = '';
  String display = '';
  late String result;
  late String operation;

  static Future<void> lightImpact() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
  }

  static Future<void> heavyImpact() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.heavyImpact',
    );
  }

  void btnOnClick(String val) {
    print(val);
    if (val == 'AC') {
      display = '';
      first = 0;
      second = 0;
      result = '';
      history = '';
    } else if (val == 'C') {
      display = '';
      first = 0;
      second = 0;
      result = '';
    } else if (val == '+/-') {
      if (display[0] != '-') {
        result = '-' + display;
      } else {
        result = display.substring(1);
      }
    } else if (val == 'Back') {
      result = display.substring(0, display.length - 1);
    } else if (val == '+' ||
        val == '-' ||
        val == '/' ||
        val == 'x' ||
        val == '^2' ||
        val == '√' ||
        val == '%') {
      first = int.parse(display);
      result = '';
      operation = val;
      if (operation == '√') {
        result = (sqrt(first)).toString();
        history = operation.toString() + first.toString();
      }
      if (operation == '^2') {
        result = (first * first).toString();
        history = "Square of " + first.toString();
      }
    } else if (val == '=') {
      second = int.parse(display);

      if (operation == '+') {
        result = (first + second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == '-') {
        result = (first - second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == 'x') {
        result = (first * second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == '/') {
        result = (first / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if (operation == '%') {
        result = ((first * 100) / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
    } else {
      result = int.parse(display + val).toString();
    }
    setState(() {
      display = result;
    });
  }

  Widget btn(var i) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff595959),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: -5,
                  offset: Offset(2, 4),
                  blurRadius: 10)
            ]),
        margin: EdgeInsets.all(10),
        child: SizedBox(
          height: 80,
          width: 80,
          child: TextButton(
            child: Text(
              i,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 40, color: Colors.white)),
            ),
            onPressed: () => {
              setState(() {
                lightImpact();
                btnOnClick(i);
              })
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment(1, 1),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                history,
                style: GoogleFonts.rubik(
                    textStyle:
                    TextStyle(color: Color(0xffa4a1a1), fontSize: 30)),
              ),
            ),
          ),
          Container(
            alignment: Alignment(1, 1),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                display,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(color: Colors.white, fontSize: 40)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffafafaf),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000),
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        'AC',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 33, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('AC');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color(0xffafafaf),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: -5,
                              offset: Offset(2, 4),
                              blurRadius: 10)
                        ]),
                    child: TextButton(
                      child: Text(
                        'C',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('C');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffafafaf),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Icon(Icons.backspace, color: Colors.black),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('Back');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '%',
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          history = result;
                          btnOnClick('%');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('7'),
              btn('8'),
              btn('9'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '/',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          history = result;
                          btnOnClick('/');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('4'),
              btn('5'),
              btn('6'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        'x',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          history = result;
                          btnOnClick('x');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('1'),
              btn('2'),
              btn('3'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '+',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          history = result;
                          btnOnClick('+');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('00'),
              btn('0'),
              btn('.'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '-',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          history = result;
                          btnOnClick('-');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff595959),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '+/-',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 35, color: Colors.white)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('+/-');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff595959),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '^2',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 35, color: Colors.white)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('^2');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff595959),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '√',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.white)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('√');
                        })
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -5,
                            offset: Offset(2, 4),
                            blurRadius: 10)
                      ]),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      child: Text(
                        '=',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(fontSize: 40, color: Colors.black)),
                      ),
                      onPressed: () => {
                        setState(() {
                          heavyImpact();
                          btnOnClick('=');
                        })
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
