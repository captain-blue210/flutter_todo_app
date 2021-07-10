import 'package:flutter/material.dart';

class SafeAreaSample extends StatelessWidget {
  const SafeAreaSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                width: 200,
              )
            ],
          )
        ),
      ),
    );
  }
}
