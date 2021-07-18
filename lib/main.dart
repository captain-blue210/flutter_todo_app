import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/axis/axis_sample.dart';
import 'package:flutter_todo_app/bmicalculator/input_page.dart';
import 'package:flutter_todo_app/boxdecoration/background_image.dart';
import 'package:flutter_todo_app/buttonstyle/new_button_style.dart';
import 'package:flutter_todo_app/destini/stroy_page.dart';
import 'package:flutter_todo_app/dice/dice.dart';
import 'package:flutter_todo_app/magicball/magic_ball.dart';
import 'package:flutter_todo_app/mi_card/mi_card.dart';
import 'package:flutter_todo_app/quizzler/quizzler_page.dart';
import 'package:flutter_todo_app/safearea/safeare-sample.dart';
import 'package:flutter_todo_app/task_list.dart';
import 'package:flutter_todo_app/visibility/visibility_sample.dart';
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
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF020E21),
        scaffoldBackgroundColor: Color(0xFF020E21),
      ),
      title: 'TODO',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  Widget buildLinkButton(BuildContext context, Widget widget, String linkName){
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => widget,
            ));
      },
      child: Text('$linkName'),
    );
  }

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
            buildLinkButton(context, Dice(), 'Dicee'),
            buildLinkButton(context, AxisSample(), 'Axis Sample'),
            buildLinkButton(context, MagicBall(), 'Ask me anything'),
            buildLinkButton(context, Xlyophone(), 'Xlyophone'),
            buildLinkButton(context, QuizzlerPage(), 'Quizzler'),
            buildLinkButton(context, SafeAreaSample(), 'SafeArea Sample'),
            buildLinkButton(context, StoryPage(), 'Destini'),
            buildLinkButton(context, BackGroundImage(), 'BoxDecoration Sample'),
            buildLinkButton(context, NewButtonStyle(), 'Button Sample'),
            buildLinkButton(context, InputPage(), 'BMI Calculator'),
            buildLinkButton(context, VisibilitySample(), 'Visibility Sample'),
            TaskList(),
            AddTask(),
          ],
        ),
      ),
    );
  }
}
