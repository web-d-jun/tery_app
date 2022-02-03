import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:tery_app/bloc/post_event.dart';

import 'package:tery_app/store/models/store.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({required this.httpClient}) : super(const StoreState()) {
    on<StoreFetched>(_onStoreFetched);
  }
  final http.Client httpClient;

  Future<void> _onStoreFetched(
      StoreFetched event, Emitter<StoreState> emit) async {}
}
