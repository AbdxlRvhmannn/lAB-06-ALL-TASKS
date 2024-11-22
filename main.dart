

// CODE FOR THE CALCULATOR APP




import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String history = '';
  double? num1 = 0;
  double? num2 = 0;
  String operand = '';

  // Function to handle the button press
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        output = '0';
        history = '';
        num1 = 0;
        num2 = 0;
        operand = '';
      } else if (buttonText == '=') {
        num2 = double.tryParse(output);
        if (operand == '+') {
          output = (num1! + num2!).toString();
        } else if (operand == '-') {
          output = (num1! - num2!).toString();
        } else if (operand == '×') {
          output = (num1! * num2!).toString();
        } else if (operand == '÷') {
          output = (num1! / num2!).toString();
        }
        history = '';
        num1 = double.tryParse(output);
        operand = '';
      } else if (buttonText == '÷' ||
          buttonText == '×' ||
          buttonText == '-' ||
          buttonText == '+') {
        operand = buttonText;
        num1 = double.tryParse(output);
        history = '$output $operand';
        output = '0';
      } else {
        if (output == '0') {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white), // Title in white
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // History
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: Text(
              history,
              style: const TextStyle(
                  fontSize: 24, color: Colors.white70),
            ),
          ),
          // Output
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: Text(
              output,
              style: const TextStyle(
                  fontSize: 48, color: Colors.white),
            ),
          ),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              calcButton('AC', Colors.grey, Colors.white),
              calcButton('÷', Colors.orange, Colors.white),
              calcButton('×', Colors.orange, Colors.white),
              calcButton('-', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              calcButton('7', Colors.grey, Colors.white),
              calcButton('8', Colors.grey, Colors.white),
              calcButton('9', Colors.grey, Colors.white),
              calcButton('+', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              calcButton('4', Colors.grey, Colors.white),
              calcButton('5', Colors.grey, Colors.white),
              calcButton('6', Colors.grey, Colors.white),
              calcButton('=', Colors.orange, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              calcButton('1', Colors.grey, Colors.white),
              calcButton('2', Colors.grey, Colors.white),
              calcButton('3', Colors.grey, Colors.white),
              calcButton('0', Colors.grey, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              calcButton('.', Colors.black, Colors.white),
              calcButton('%', Colors.grey, Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget calcButton(String text, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
      ),
    );
  }
}









