import 'package:xml/xml.dart';

import './book_paragraph_parsing.dart';
import '../models/book_empty_line.dart';
import '../models/book_paragraph.dart';
import '../models/book_title.dart';
import '../utils/nullable_extension.dart';
import '../utils/one_of.dart';

class BookTitleParser {
  static BookTitle parse(XmlElement element) {
    final List<OneOf2<BookParagraph, BookEmptyLine>> content =
        element.children.whereType<XmlElement>().compactMap((element) {
      switch (element.name.qualified) {
        case 'p':
          return OneOf2(BookParagraphParser.parse(element), null);
        case 'empty-line':
          return OneOf2(null, BookEmptyLine());
      }
    });
    return BookTitle(
      content: content,
      language: element.getAttribute('xml:lang'),
    );
  }
}
