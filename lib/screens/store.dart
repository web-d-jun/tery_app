import 'package:flutter/material.dart';
import 'package:tery_app/widgets/product_item.dart';

class StoreView extends StatefulWidget {
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '매장을 검색해보세요.',
              ),
            ),
          ),
        ),
        buildProductList(),
      ],
    );
  }
}

getData() {
  print('?');
}

buildProductList() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ProductItem();
        },
      ),
      // child: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(100, (index) {
      //     return const ProductItem();
      //   }),
      // ),
    ),
  );
}
