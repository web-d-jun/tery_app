import 'package:flutter/material.dart';
import 'package:tery_app/store/store.dart';

class StoreListItem extends StatelessWidget {
  const StoreListItem({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
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
              child: Image.network(store.imageUrl),
            ),
            Container(
              child: Text('${store.id}'),
            )
          ],
        ),
      ),
    );
  }
}
