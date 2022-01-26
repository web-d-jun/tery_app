import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class Fetch extends PostEvent {
  @override
  String toString() => 'Fatch';

  @override
  List<Object?> get props => throw UnimplementedError();
}
