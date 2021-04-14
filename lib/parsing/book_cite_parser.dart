import 'package:xml/xml.dart';

import './book_paragraph_parsing.dart';
import './book_poem_parser.dart';
import './book_subtitle_parser.dart';
import './book_table_parser.dart';
import '../models/book_cite.dart';
import '../models/book_empty_line.dart';
import '../utils/nullable_extension.dart';

class BookCiteParser {
  static BookCite parse(XmlElement element) {
    final content = element.children
        .whereType<XmlElement>()
        .compactMap(BookCiteContentParser.parse);
    final authors = element.children
        .whereType<XmlElement>()
        .where((element) => element.name.qualified == 'text-author')
        .map(BookParagraphParser.parse)
        .toList();
    return BookCite(
      id: element.getAttribute('id'),
      language: element.getAttribute('xml:lang'),
      content: content,
      textAuthors: authors,
    );
  }
}

class BookCiteContentParser {
  static BookCiteContent parse(XmlElement element) {
    switch (element.name.qualified) {
      case 'p':
        return BookCiteContent(paragraph: BookParagraphParser.parse(element));
      case 'subtitle':
        return BookCiteContent(subtitle: BookSubtitleParser.parse(element));
      case 'empty-line':
        return BookCiteContent(emptyLine: BookEmptyLine());
      case 'poem':
        return BookCiteContent(poem: BookPoemParser.parse(element));
      case 'table':
        return BookCiteContent(table: BookTableParser.parse(element));
      default:
        throw Exception('Unknown cite content');
    }
  }
}
