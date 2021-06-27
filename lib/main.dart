import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/axis/axis_sample.dart';
import 'package:flutter_todo_app/dice/dice.dart';
import 'package:flutter_todo_app/magicball/magic_ball.dart';
import 'package:flutter_todo_app/mi_card/mi_card.dart';
import 'package:flutter_todo_app/task_list.dart';
import 'package:flutter_todo_app/xlyophone/xlyophone.dart';

import 'add_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => MiCard(),
                  ));
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Dice(),
                    ));
              },
              child: Text('Dicee'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => AxisSample(),
                    ));
              },
              child: Text('Axis Sample'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => MagicBall(),
                    ));
              },
              child: Text('Magic Ball'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Xlyophone(),
                    ));
              },
              child: Text('Xlyophone'),
            ),
            TaskList(),
            AddTask(),
          ],
        ),
      ),
    );
  }
}
