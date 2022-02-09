import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:faker/faker.dart';

import 'package:tery_app/store/models/store.dart';

part 'store_event.dart';
part 'store_state.dart';

const _storeLimit = 20;
const throttleDuration = Duration(microseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({required this.httpClient}) : super(const StoreState()) {
    on<StoreFetched>(_onStoreFetched, transformer: throttleDroppable(throttleDuration));
  }
  final http.Client httpClient;

  Future<void> _onStoreFetched(StoreFetched event, Emitter<StoreState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StoreStatus.initial) {
        final store = await _fetchStore();
        return emit(
          state.copyWith(
            status: StoreStatus.success,
            store: store,
            hasReachedMax: false,
          ),
        );
      }

      final store = await _fetchStore(state.store.length);

      store.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: StoreStatus.success,
              store: List.of(state.store)..addAll(store),
              hasReachedMax: false,
            ));
    } catch (e) {
      emit(state.copyWith(status: StoreStatus.failure));
    }
  }

  Future<List<Store>> _fetchStore([startIndex = 0]) async {
    final response = await httpClient.get(Uri.https(
      'my-json-server.typicode.com',
      '/web-d-jun/tery_app/stores',
      <String, String>{'_start': '$startIndex', '_limit': '$_storeLimit'},
    ));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return body.map((dynamic json) {
        json['imageUrl'] = faker.image.image();
        print(faker.image.image());
        return Store(
            id: json['id'], title: json['title'], body: json['body'], imageUrl: json['imageUrl']);
      }).toList();
    }
    throw Exception('error fetch');
  }
}
