import './book_author.dart';
import './book_elements.dart';
import '../utils/one_of.dart';

class BookEpigraph {
  final String? id;
  final List<OneOf4<BookParagraph, BookPoem, BookCite, BookEmptyLine>> lines;
  final List<BookAuthor> authors;

  const BookEpigraph({
    this.id,
    this.lines = const [],
    this.authors = const [],
  });

  @override
  String toString() {
    return [lines.join('\n'), authors.join('\n')]
        .where((text) => text.isNotEmpty)
        .join('\n');
  }
}
