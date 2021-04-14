import 'package:xml/xml.dart';

import './book_text_parsing.dart';
import '../models/book_subtitle.dart';

class BookSubtitleParser {
  static BookSubtitle parse(XmlElement element) {
    final content =
        element.children.map(BookFormattedTextContentParser.parse).toList();
    return BookSubtitle(
      id: element.getAttribute('id'),
      style: element.getAttribute('style'),
      language: element.getAttribute('xml:lang'),
      content: content,
    );
  }
}
