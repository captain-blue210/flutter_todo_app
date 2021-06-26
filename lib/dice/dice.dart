import 'package:flutter/material.dart';

class Dice extends StatelessWidget {

  int leftDiceNumber = 5;

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
                      print('Left Button got pressed');
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
