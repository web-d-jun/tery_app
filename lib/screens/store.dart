import 'package:flutter/material.dart';
import 'package:tery_app/widgets/product_item.dart';

class StoreView extends StatefulWidget {
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _getData = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
      );
    });
    _getData.addListener(() {
      print('scroll....');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _getData.dispose();
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              controller: _getData,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return const ProductItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}
