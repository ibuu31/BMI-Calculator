import 'package:flutter/material.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF01579B),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //Here <Widget> is important as it initializes key for subclass. It controls how one widget replace the another widget as here 'text' has been replaced by resultText.
                    children: <Widget>[
                      Center(
                        child: Text(
                          resultText.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          bmiResult,
                          style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          interpretation,
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// to calculate and print the result
class Calculator {
  int height;
  int weight;
  //by adding ? i have declared this variable as nullable
  double? _bmi;
  // Constructor
  Calculator({
    required this.height,
    required this.weight,
  });
  // implementing calculator functionality
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    //exclamation mark after bmi ensures the compiler that the value will never be null
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return ('OverWeight');
    } else if (_bmi! > 18) {
      return ('Fit');
    } else {
      return ('UnderWeight');
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return ('Your BMI result is really high');
    } else if (_bmi! > 18) {
      return ('Your BMI is normal');
    } else {
      return ('Your BMI result is really low');
    }
  }
}
