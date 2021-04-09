import 'book_empty_line.dart';
import './book_paragraph.dart';
import '../utils/one_of.dart';

class BookTitle {
  final String? language;
  final List<OneOf2<BookParagraph, BookEmptyLine>> content;

  const BookTitle({
    this.language,
    required this.content,
  });
}
