import 'package:flutter/material.dart';

class NewButtonStyle extends StatelessWidget {
  const NewButtonStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ボタンスタイルサンプル'),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            overlayColor: MaterialStateProperty.all<Color>(Colors.teal.shade300)
          ),
          onPressed: () {

          },
          child: const Text(
              'サンプル',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
