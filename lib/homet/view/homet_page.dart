import 'package:flutter/material.dart';

class HometPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HometPage());
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('test'),
    );
  }
}
