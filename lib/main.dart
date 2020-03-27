import 'package:flutter/material.dart';

void main() => runApp(AdvancedCalculator());

class AdvancedCalculator extends StatefulWidget
{
  @override
  AdvancedCalculatorState createState() => AdvancedCalculatorState();
}

class AdvancedCalculatorState extends State<AdvancedCalculator>
{
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText)
  {
    if(buttonText == "CLEAR")
    {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x")
    {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    }
    else if(buttonText == ".")
    {
        if(_output.contains("."))
        {
          return;
        }
        else
        {
          _output += buttonText;
        }
    }
    else if(buttonText == "=")
    {
      num2 = double.parse(output);

      if(operand == "+")
      {
        _output = (num1 + num2).toString();
      }
      if(operand == "-")
      {
        _output = (num1 - num2).toString();
      }
      if(operand == "x")
      {
        _output = (num1 * num2).toString();
      }
      if(operand == "/")
      {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else
    {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget buildNumberPad(String buttonText) {
    return Expanded(
        child: Container(
          color: Colors.pinkAccent.shade50,
          child: OutlineButton(
            padding: EdgeInsets.all(24.0),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent
              ),
            ),
            onPressed: () => buttonPressed(buttonText),
            borderSide: BorderSide(
              color: Colors.pink,
              style: BorderStyle.solid,
              width: 0.1
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.pink,
                            width: 1.0
                        )
                    ),
                    width: 300.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: Text(
                      output,
                      style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink
                      ),
                    ),
                  ),
                  Divider(),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          buildNumberPad("1"),
                          buildNumberPad("2"),
                          buildNumberPad("3"),
                          buildNumberPad("/")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumberPad("4"),
                          buildNumberPad("5"),
                          buildNumberPad("6"),
                          buildNumberPad("x")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumberPad("7"),
                          buildNumberPad("8"),
                          buildNumberPad("9"),
                          buildNumberPad("-")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumberPad("."),
                          buildNumberPad("0"),
                          buildNumberPad("0.0"),
                          buildNumberPad("+")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumberPad("CLEAR"),
                          buildNumberPad("="),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

