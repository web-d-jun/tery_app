import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/store/store.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(builder: (context, state) {
      switch (state.status) {
        case StoreStatus.failure:
          return const Center(
            child: Text('failed to fetch Store'),
          );
        case StoreStatus.success:
          if (state.store.isEmpty) {
            return const Center(child: Text('no Store'));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: state.hasReachedMax ? state.store.length : state.store.length + 1,
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return StoreListItem(
                store: state.store[index],
              );
            },
          );

        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    print(_isBottom);
    if (_isBottom) context.read<StoreBloc>().add(StoreFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
