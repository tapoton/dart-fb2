import './book_author.dart';
import './book_elements.dart';
import './book_paragraph.dart';
import '../utils/one_of.dart';

class BookCite {
  final List<BookCiteContent> content;
  final List<BookAuthor> authors;

  BookCite({
    required this.content,
    required this.authors,
  });
}

class BookCiteContent extends OneOf5<BookParagraph, BookSubtitle, BookEmptyLine,
    BookPoem, BookTable> {
  BookCiteContent({
    BookParagraph? paragraph,
    BookSubtitle? subtitle,
    BookEmptyLine? emptyLine,
    BookPoem? poem,
    BookTable? table,
  }) : super(paragraph, subtitle, emptyLine, poem, table);
}
