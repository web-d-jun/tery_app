import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:tery_app/store/models/store.dart';

part 'store_event.dart';
part 'store_state.dart';

const _storeLimit = 20;

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({required this.httpClient}) : super(const StoreState()) {
    on<StoreFetched>(_onStoreFetched);
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
      'jsonplaceholder.typicode.com',
      '/posts',
      <String, String>{'_start': '$startIndex', '_limit': '$_storeLimit'},
    ));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return body.map((dynamic json) {
        return Store(id: json['id'], title: json['title'], body: json['body']);
      }).toList();
    }
    throw Exception('error fetch');
  }
}
