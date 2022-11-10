import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {

  late int first;
  late int second;
  String history = '';
  String display = '';
  late String result;
  late String operation;

  void btnOnClick(String val)
  {
    print(val);
    if(val == 'AC')
    {
      display = '';
      first = 0;
      second = 0;
      result = '';
      history = '';
    }
    else if(val == 'C')
    {
      display = '';
      first = 0;
      second = 0;
      result = '';
    }
    else if(val == '+/-')
    {
      if(display[0] != '-' )
      {
        result = '-'+display;
      }
      else
      {
        result = display.substring(1);
      }
    }
    else if(val == 'Back')
    {
      result = display.substring(0 , display.length - 1);
    }
    else if(val == '+' || val == '-' || val == '/' || val == 'x' || val == '^2' || val == '√' || val == '%')
    {
      first = int.parse(display);
      result = '';
      operation = val;
      if(operation == '√')
      {
        result = (sqrt(first)).toString();
        history = operation.toString() + first.toString();
      }
      if(operation == '^2')
      {
        result = (first * first).toString();
        history = "Square of " + first.toString();
      }
    }
    else if(val == '=')
    {
      second = int.parse(display);
      if(operation == '+')
      {
        result = (first + second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '-')
      {
        result = (first - second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == 'x')
      {
        result = (first * second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '/')
      {
        result = (first / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '%')
      {
        result = ((first * 100) / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
    }
    else
    {
      result = int.parse(display + val).toString();
    }
    setState(() {

      display = result;
    });
  }

  Widget btn(var i) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 80,
        width: 80,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Text(
            i,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 40,
                )),
          ),
          onPressed: () => {
            setState(() {

              btnOnClick(i);
            })
          },
          color: Colors.black,
          textColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    textStyle: TextStyle(color: Colors.grey, fontSize: 30)),
              ),
            ),
          ),
          Container(
            alignment: Alignment(1, 1),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                display ,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(color: Colors.black, fontSize: 40)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      'AC',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 33)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('AC');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      'C',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('C');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Icon(Icons.backspace),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('Back');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '%',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('%');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('7'),
              btn('8'),
              btn('9'),
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '/',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('/');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('4'),
              btn('5'),
              btn('6'),
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      'x',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('x');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('1'),
              btn('2'),
              btn('3'),
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '+',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('+');
                      })
                    },
                    color: Colors.orange,
                    textColor: Colors.black,
                  ),
                ),
              ),)
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
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text(
                        '-',
                        style:
                        GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                      ),
                      onPressed: () => {
                        setState(() {
                          btnOnClick('-');
                        })
                      },
                      color: Colors.orange,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '+/-',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 35)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('+/-');
                      })
                    },
                    color: Colors.green,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '^2',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 35)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('^2');
                      })
                    },
                    color: Colors.green,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '√',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('√');
                      })
                    },
                    color: Colors.green,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      '=',
                      style:
                      GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40)),
                    ),
                    onPressed: () => {
                      setState(() {
                        btnOnClick('=');
                      })
                    },
                    color: Colors.green,
                    textColor: Colors.black,
                  ),
                ),
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
