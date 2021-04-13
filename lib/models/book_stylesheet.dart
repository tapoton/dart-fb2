import 'package:equatable/equatable.dart';

class BookStylesheet with EquatableMixin {
  final String type;
  final String content;

  BookStylesheet({required this.type, required this.content});

  @override
  List<Object?> get props => [type, content];
}
