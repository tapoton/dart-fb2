import 'package:xml/xml.dart';

import './book_text_parsing.dart';
import '../models/book_paragraph.dart';

class BookParagraphParser {
  static BookParagraph parse(XmlElement element) {
    final content =
        element.children.map(BookFormattedTextContentParser.parse).toList();
    return BookParagraph(
      id: element.getAttribute('id'),
      style: element.getAttribute('style'),
      language: element.getAttribute('xml:lang'),
      content: content,
    );
  }
}
