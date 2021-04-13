import 'package:equatable/equatable.dart';

import './book_binary.dart';
import './book_body.dart';
import './book_description.dart';
import './book_stylesheet.dart';

class Book with EquatableMixin {
  final BookStylesheet? stylesheet;
  final BookDescription description;
  final List<BookBody> bodies;
  final List<BookBinary> binaries;

  const Book({
    this.stylesheet,
    required this.description,
    required this.bodies,
    this.binaries = const [],
  }) : assert(bodies.length > 0);

  BookBody get mainBody => bodies.first;
  BookBody? get notes => bodies.firstWhere((body) => body.name == 'notes');

  @override
  List<Object?> get props => [stylesheet, description, bodies, binaries];
}
