import './book_empty_line.dart';
import './book_paragraph.dart';
import './book_poem.dart';
import './book_subtitle.dart';
import './book_table.dart';
import '../utils/one_of.dart';

class BookCite {
  final List<BookCiteContent> content;
  final List<BookParagraph> textAuthor;

  const BookCite({
    required this.content,
    this.textAuthor = const [],
  });
}

class BookCiteContent extends OneOf5<BookParagraph, BookSubtitle, BookEmptyLine,
    BookPoem, BookTable> {
  const BookCiteContent({
    BookParagraph? paragraph,
    BookSubtitle? subtitle,
    BookEmptyLine? emptyLine,
    BookPoem? poem,
    BookTable? table,
  }) : super(paragraph, subtitle, emptyLine, poem, table);
}
