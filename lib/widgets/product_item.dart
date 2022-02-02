import 'package:flutter/material.dart';
import 'package:tery_app/model/store.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.items}) : super(key: key);
  final Store items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2.0, style: BorderStyle.solid)),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Image.network('${items.imageUrl}'),
            ),
          ],
        ),
      ),
    );
  }
}
