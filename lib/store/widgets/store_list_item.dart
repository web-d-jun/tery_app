import 'package:flutter/material.dart';
import 'package:tery_app/store/store.dart';

class StoreListItem extends StatelessWidget {
  const StoreListItem({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 2.0, style: BorderStyle.solid)),
      child: Text('${store.id}'),
    );
  }
}
