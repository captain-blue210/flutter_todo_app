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
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
          ),
          onPressed: () {},
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
