import 'package:fb2/models/book_formatted_text.dart';

class BookParagraph {
  final String? id;
  final String? style;
  final String? language;
  final List<BookFormattedTextContent> content;

  BookParagraph({
    this.id,
    this.style,
    this.language,
    this.content = const [],
  });
}
