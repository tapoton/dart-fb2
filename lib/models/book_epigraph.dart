import 'package:equatable/equatable.dart';

import './book_cite.dart';
import 'book_empty_line.dart';
import './book_paragraph.dart';
import './book_poem.dart';
import '../utils/one_of.dart';

class BookEpigraph with EquatableMixin {
  final String? id;
  final List<BookEpigraphPart> parts;
  final List<BookParagraph> textAuthor;

  const BookEpigraph({
    this.id,
    this.parts = const [],
    this.textAuthor = const [],
  });

  @override
  String toString() {
    return [parts.join('\n'), textAuthor.join('\n')]
        .where((text) => text.isNotEmpty)
        .join('\n');
  }

  @override
  List<Object?> get props => [id, parts, textAuthor];
}

class BookEpigraphPart
    extends OneOf4<BookParagraph, BookPoem, BookCite, BookEmptyLine> {
  const BookEpigraphPart({
    BookParagraph? paragraph,
    BookPoem? poem,
    BookCite? cite,
    BookEmptyLine? emptyLine,
  }) : super(paragraph, poem, cite, emptyLine);
}
