import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Card extends StatelessWidget {
  //creating constructor and initializing cardChild and cardColour.
  final Widget cardChild;
  final Color cardColour;
  const Card({required this.cardChild, required this.cardColour, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: cardColour, borderRadius: BorderRadius.circular(10)),
      child: cardChild,
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int height = 180;
  int weight = 60;
  int age = 18;

  Color maleCardColour = initialCardColour;
  Color femaleCardColour = initialCardColour;

  void updateCardColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      maleCardColour = afterClickColour;
      femaleCardColour = initialCardColour;
    } else if (selectedGender == Gender.female) {
      femaleCardColour = afterClickColour;
      maleCardColour = initialCardColour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              //male card
              Expanded(
                child: GestureDetector(
                  child: Card(
                    cardColour: maleCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.male,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      updateCardColour(Gender.male);
                    });
                  },
                ),
              ),
              //female card
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateCardColour(Gender.female);
                    });
                  },
                  child: Card(
                    cardColour: femaleCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.female,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //height card
        Expanded(
          child: Card(
            cardColour: initialCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Text(
                      'cm',
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    }),
                const Text(
                  'Height',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              //weight card
              Expanded(
                child: Card(
                  cardColour: initialCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            'kg',
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                              heroTag: 'Weight1',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(Icons.add)),
                          FloatingActionButton.small(
                              heroTag: 'Weight2',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(Icons.remove)),
                        ],
                      ),
                      const Text(
                        'Weight',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              //age card
              Expanded(
                child: Card(
                  cardColour: initialCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        age.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                              heroTag: 'Age1',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add)),
                          FloatingActionButton.small(
                              heroTag: 'Age2',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove)),
                        ],
                      ),
                      const Text(
                        'Age',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Calculator calc = Calculator(height: height, weight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            color: const Color(0XFF1A237E),
            child: const Center(
                child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}
