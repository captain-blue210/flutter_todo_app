import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderSample extends StatelessWidget {
  final String data = 'sample';

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => data,
      child: Scaffold(
        appBar: AppBar(title: Text('Provider Sample')),
        body: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}
