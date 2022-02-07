import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/widgets/product_item.dart';
import 'package:tery_app/store/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class StoreView extends StatefulWidget {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _getData = ScrollController();
  late Future<List<Store>> store;

  @override
  void initState() {
    super.initState();
    // store = fetchPost();

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
          child: BlocProvider(
            create: (_) => StoreBloc(httpClient: http.Client())..add(StoreFetched()),
            child: StoreList(),
          ),
        ),
      ],
    );
  }
}
