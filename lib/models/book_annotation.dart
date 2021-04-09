import './book_cite.dart';
import './book_empty_line.dart';
import './book_paragraph.dart';
import './book_poem.dart';
import './book_subtitle.dart';
import './book_table.dart';
import '../utils/one_of.dart';

class BookAnnotationElement extends OneOf6<BookParagraph, BookPoem, BookCite,
    BookSubtitle, BookEmptyLine, BookTable> {
  BookAnnotationElement({
    BookParagraph? paragraph,
    BookPoem? poem,
    BookCite? cite,
    BookSubtitle? subtitle,
    BookEmptyLine? emptyLine,
    BookTable? table,
  }) : super(paragraph, poem, cite, subtitle, emptyLine, table);
}

class BookAnnotation {
  final List<BookAnnotationElement> elements;

  const BookAnnotation(this.elements);

  @override
  String toString() {
    return elements.join('\n');
  }
}
