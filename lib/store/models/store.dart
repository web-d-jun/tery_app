import 'package:equatable/equatable.dart';

class Store extends Equatable {
  const Store({required this.id, required this.title});

  final int id;
  final String title;

  @override
  List<Object> get props => [id, title];
}
