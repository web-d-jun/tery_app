import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<StoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
