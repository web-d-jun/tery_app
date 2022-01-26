import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartView createState() => _CartView();
}

class _CartView extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('cart view'),
    );
  }
}
