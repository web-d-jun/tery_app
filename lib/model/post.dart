import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post(this.id, this.title, this.body);

  final int id;
  final String title;
  final String body;

  @override
  String toString() => 'Post { id: $id }';
  @override
  List<Object> get props => [id, title, body];
}
