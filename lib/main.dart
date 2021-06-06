import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(
              color: Colors.indigo,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 4;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                leftDiceNumber = rollDice();
                rightDiceNumber = rollDice();
                // ignore: avoid_print
                print("Left Button Pressed and is $leftDiceNumber");
              });
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          child: TextButton(
              onPressed: () {
                setState(() {
                  rightDiceNumber = rollDice();
                  leftDiceNumber = rollDice();
                  // ignore: avoid_print
                  print("Right Button Pressed and is $rightDiceNumber");
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png')),
        ),
      ]),
    );
  }
}

int rollDice() {
  int diceNumber = Random().nextInt(6) + 1;
  return diceNumber;
}
