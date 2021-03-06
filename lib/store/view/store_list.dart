import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/store/store.dart';
import 'package:tery_app/store/view/store_list_detail.dart';
import 'package:tery_app/store/models/store.dart';

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
              return index >= state.store.length
                  ? const BottomLoader()
                  : GestureDetector(
                      onTap: () => onTap(context, StoreListDetail.routeName, state.store[index]),
                      child: StoreListItem(
                        store: state.store[index],
                      ),
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
    if (_isBottom) context.read<StoreBloc>().add(StoreFetched());
    // print(_isBottom);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // print('${currentScroll}  .....  ${maxScroll * 0.9} ... ${maxScroll}');
    return currentScroll >= (maxScroll * 0.6);
  }
}

void onTap(ctx, routerName, data) {
  Navigator.pushNamed(
    ctx,
    routerName,
    arguments: data,
  );
}
