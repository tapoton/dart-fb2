import './book_author.dart';
import './book_cite.dart';
import './book_elements.dart';
import './book_paragraph.dart';
import '../utils/one_of.dart';

class BookEpigraph {
  final String? id;
  final List<BookEpigraphPart> parts;
  final List<BookAuthor> authors;

  const BookEpigraph({
    this.id,
    this.parts = const [],
    this.authors = const [],
  });

  @override
  String toString() {
    return [parts.join('\n'), authors.join('\n')]
        .where((text) => text.isNotEmpty)
        .join('\n');
  }
}

class BookEpigraphPart
    extends OneOf4<BookParagraph, BookPoem, BookCite, BookEmptyLine> {
  BookEpigraphPart({
    BookParagraph? paragraph,
    BookPoem? poem,
    BookCite? cite,
    BookEmptyLine? emptyLine,
  }) : super(paragraph, poem, cite, emptyLine);
}
