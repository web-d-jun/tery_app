import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:tery_app/store/models/store.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({required this.httpClient}) : super(const StoreState()) {
    // on<StoreEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
  final http.Client httpClient;
}
