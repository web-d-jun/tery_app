import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
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
        child: const Center(
          child: Text('ddd'),
        ),
      ),
    );
  }
}
