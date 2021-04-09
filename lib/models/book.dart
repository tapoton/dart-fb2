import './book_binary.dart';
import './book_body.dart';
import './book_description.dart';
import './book_stylesheet.dart';

class Book {
  final BookStylesheet? stylesheet;
  final BookDescription description;
  final List<BookBody> body;
  final List<BookBinary> binaries;

  const Book({
    this.stylesheet,
    required this.description,
    required this.body,
    this.binaries = const [],
  }) : assert(body.length > 0);
}
