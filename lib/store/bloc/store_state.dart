part of 'store_bloc.dart';

enum StoreStatus { initial, success, failure }

class StoreState extends Equatable {
  const StoreState({
    this.status = StoreStatus.initial,
    this.store = const <Store>[],
    this.hasReachedMax = false,
  });
  final StoreStatus status;
  final List<Store> store;
  final bool hasReachedMax;

  StoreState copyWith({
    StoreStatus? status,
    List<Store>? store,
    bool? hasReachedMax,
  }) {
    return StoreState(
      status: status ?? this.status,
      store: store ?? this.store,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''StoreState { status: $status, hasReachedMax: $hasReachedMax, store: ${store.length} }''';
  }

  @override
  List<Object> get props => [status, store, hasReachedMax];
}

// class StoreInitial extends StoreState {}
