import 'package:equatable/equatable.dart';

class BookEmptyLine with EquatableMixin {
  @override
  String toString() {
    return '\n';
  }

  @override
  List<Object?> get props => [];
}
