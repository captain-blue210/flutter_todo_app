import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = this.getRandomInt();
                        });
                      },
                      child: Image.asset('images/dice$leftDiceNumber.png')),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          rightDiceNumber = this.getRandomInt();
                        });
                      },
                      child: Image.asset('images/dice$rightDiceNumber.png')),
                ),
              )
            ],
          ),
        ),
      );
    }

    int getRandomInt(){
      return Random().nextInt(6) + 1;
    }
  }