import 'package:xml/xml.dart';

import './book_cite_parser.dart';
import './book_paragraph_parsing.dart';
import './book_poem_parser.dart';
import '../models/book_empty_line.dart';
import '../models/book_history.dart';
import '../parsing/book_subtitle_parser.dart';
import '../parsing/book_table_parser.dart';

class BookHistoryParser {
  static BookHistory parse(XmlElement element) {
    final elements = element.children
        .whereType<XmlElement>()
        .map(BookHistoryElementParser.parse)
        .toList();
    return BookHistory(
      id: element.getAttribute('id'),
      language: element.getAttribute('xml:lang'),
      elements: elements,
    );
  }
}

class BookHistoryElementParser {
  static BookHistoryElement parse(XmlElement element) {
    switch (element.name.qualified) {
      case 'p':
        return BookHistoryElement(
            paragraph: BookParagraphParser.parse(element));
      case 'cite':
        return BookHistoryElement(cite: BookCiteParser.parse(element));
      case 'empty-line':
        return BookHistoryElement(emptyLine: BookEmptyLine());
      case 'poem':
        return BookHistoryElement(poem: BookPoemParser.parse(element));
      case 'subtitle':
        return BookHistoryElement(subtitle: BookSubtitleParser.parse(element));
      case 'table':
        return BookHistoryElement(table: BookTableParser.parse(element));
      default:
        throw Exception('Unknown hostory content');
    }
  }
}
