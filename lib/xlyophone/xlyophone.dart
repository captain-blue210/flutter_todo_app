import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xlyophone extends StatefulWidget {
  const Xlyophone({Key? key}) : super(key: key);

  @override
  _XlyophoneState createState() => _XlyophoneState();
}

class _XlyophoneState extends State<Xlyophone> {

  void playSound(int soundNo){
    final AudioCache player = AudioCache();
    player.play('note$soundNo.wav');
  }

  Widget buildKey(Color color, int soundNumber){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () async {
          playSound(soundNumber);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Xlyophone'),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.teal, 4),
              buildKey(Colors.green, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
    );
  }
}
