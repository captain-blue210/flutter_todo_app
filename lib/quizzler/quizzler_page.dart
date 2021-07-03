import 'package:flutter/material.dart';
import 'package:flutter_todo_app/quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Quizzler'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                    //The user picked true.
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    //The user picked false.
                    checkAnswer(false);
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }

  void checkAnswer(bool answer) {
    if (quizBrain.getQuestionAnswer() == answer) {
      print('correct answer !');
    } else {
      print('wrong answer...');
    }
  }
}
