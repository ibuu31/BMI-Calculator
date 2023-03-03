import 'package:flutter/material.dart';
import 'Screens/bmi_calculator.dart';

//these two variables are global variables.
var initialCardColour = const Color(0xFF01579B);
var afterClickColour = Colors.black87;

//when we assign that the number 1 is for male and 2 is for female, it is better to use enum instead.
enum Gender {
  male,
  female,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calc'),
          ),
          body: const BmiCalculator(),
        ));
  }
}
