import 'package:equatable/equatable.dart';

class Store extends Equatable {
  const Store({required this.id, required this.title, required this.imageUrl});

  final int id;
  final String title;
  final String imageUrl;

  @override
  List<Object> get props => [id, title, imageUrl];
}
