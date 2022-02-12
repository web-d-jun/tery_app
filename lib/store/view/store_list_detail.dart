import 'package:flutter/material.dart';
import 'package:tery_app/consts.dart';

class StoreListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매장 상세정보'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: MainConsts.PrimaryColor,
          )),
        ),
        backgroundColor: Color(0xffEA4E83),
      ),
    );
  }
}
