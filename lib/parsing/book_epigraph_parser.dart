import 'package:xml/xml.dart';

import './book_cite_parser.dart';
import './book_paragraph_parsing.dart';
import './book_poem_parser.dart';
import '../models/book_empty_line.dart';
import '../models/book_epigraph.dart';

class BookEpigraphParser {
  static BookEpigraph parse(XmlElement element) {
    final parts = element.children
        .whereType<XmlElement>()
        .map(BookEpigraphParsParser.parse)
        .toList();
    final authors = element.children
        .whereType<XmlElement>()
        .where((element) => element.name.qualified == 'text-author')
        .map(BookParagraphParser.parse)
        .toList();
    return BookEpigraph(
      id: element.getAttribute('id'),
      textAuthors: authors,
      parts: parts,
    );
  }
}

class BookEpigraphParsParser {
  static BookEpigraphPart parse(XmlElement element) {
    switch (element.name.qualified) {
      case 'p':
        return BookEpigraphPart(paragraph: BookParagraphParser.parse(element));
      case 'cite':
        return BookEpigraphPart(cite: BookCiteParser.parse(element));
      case 'empty-line':
        return BookEpigraphPart(emptyLine: BookEmptyLine());
      case 'poem':
        return BookEpigraphPart(poem: BookPoemParser.parse(element));
      default:
        throw Exception('Unknown epigraph content');
    }
  }
}
