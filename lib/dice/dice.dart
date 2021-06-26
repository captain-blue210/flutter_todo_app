import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
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
                        leftDiceNumber = 3;
                        print('leftDiceNumber = $leftDiceNumber');
                        // setState(() {
                        //   leftDiceNumber = 6;
                        //   print('diceNumber = $leftDiceNumber');
                        // });
                      },
                      child: Image.asset('images/dice$leftDiceNumber.png')),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        print('Right Button got pressed');
                      },
                      child: Image.asset('images/dice1.png')),
                ),
              )
            ],
          ),
        ),
      );
    }
  }