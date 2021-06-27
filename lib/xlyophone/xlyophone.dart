import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xlyophone extends StatefulWidget {
  const Xlyophone({Key? key}) : super(key: key);

  @override
  _XlyophoneState createState() => _XlyophoneState();
}

class _XlyophoneState extends State<Xlyophone> {
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                player.play('note1.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () async {
                player.play('note2.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              onPressed: () async {
                player.play('note3.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              onPressed: () async {
                player.play('note4.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                player.play('note5.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                player.play('note6.wav');
              },
              child: Text(''),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () async {
                player.play('note7.wav');
              },
              child: Text(''),
            ),
          ],
        ),
    );
  }
}
