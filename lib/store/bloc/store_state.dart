part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();
  
  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {}
