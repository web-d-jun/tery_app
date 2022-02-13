import 'package:flutter/material.dart';
import 'package:tery_app/consts.dart';
import 'package:tery_app/store/models/store.dart';

class StoreListDetail extends StatelessWidget {
  // const StoreListDetail({Key? key, required this.obj}) : super(key: key);
  // final List<dynamic> obj;
  const StoreListDetail({Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);
  final int id;
  final String title;
  final String imageUrl;

  static const routeName = '/store-detail';

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
      body: Center(
        child: Text(title),
      ),
    );
  }
}
