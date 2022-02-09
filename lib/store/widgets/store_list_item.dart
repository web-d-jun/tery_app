import 'package:flutter/material.dart';
import 'package:tery_app/store/store.dart';

class StoreListItem extends StatelessWidget {
  const StoreListItem({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.0, style: BorderStyle.solid)),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Image.network(store.imageUrl),
            Container(
              child: Text('${store.id}'),
            )
          ],
        ),
      ),
    );
  }
}
