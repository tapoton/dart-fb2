import 'package:xml/xml.dart';

import './book_date_parsing.dart';
import './book_epigraph_parser.dart';
import './book_paragraph_parsing.dart';
import './book_subtitle_parser.dart';
import './book_text_parsing.dart';
import './book_title_parser.dart';
import '../models/book_date.dart';
import '../models/book_epigraph.dart';
import '../models/book_paragraph.dart';
import '../models/book_poem.dart';
import '../models/book_subtitle.dart';
import '../models/book_title.dart';

class BookPoemParser {
  static BookPoem parse(XmlElement element) {
    BookTitle? title;
    List<BookEpigraph> epigraphs = [];
    List<BookPoemStanza> stanza = [];
    List<BookParagraph> textAuthors = [];
    BookDate? date;

    for (var child in element.children.whereType<XmlElement>()) {
      switch (child.name.qualified) {
        case 'title':
          title = BookTitleParser.parse(element);
          break;
        case 'epigraph':
          epigraphs.add(BookEpigraphParser.parse(element));
          break;
        case 'stanza':
          stanza.add(BookPoemStanzaParser.parse(element));
          break;
        case 'text-author':
          textAuthors.add(BookParagraphParser.parse(element));
          break;
        case 'date':
          date = BookDateParser.parse(element);
          break;
        default:
          break;
      }
    }
    return BookPoem(
      stanza: stanza,
      date: date,
      epigraphs: epigraphs,
      id: element.getAttribute('id'),
      language: element.getAttribute('xml:lang'),
      textAuthors: textAuthors,
      title: title,
    );
  }
}

class BookPoemStanzaParser {
  static BookPoemStanza parse(XmlElement element) {
    BookTitle? title;
    BookSubtitle? subtitle;
    List<BookPoemLine> lines = [];

    for (var child in element.children.whereType<XmlElement>()) {
      switch (child.name.qualified) {
        case 'title':
          title = BookTitleParser.parse(element);
          break;
        case 'subtitle':
          subtitle = BookSubtitleParser.parse(element);
          break;
        case 'v':
          lines.add(BookPoemLineParser.parse(element));
          break;
        default:
          break;
      }
    }
    return BookPoemStanza(
      lines: lines,
      subtitle: subtitle,
      title: title,
    );
  }
}

class BookPoemLineParser {
  static BookPoemLine parse(XmlElement element) {
    final content =
        element.children.map(BookFormattedTextContentParser.parse).toList();
    return BookPoemLine(
      id: element.getAttribute('id'),
      style: element.getAttribute('style'),
      language: element.getAttribute('xml:lang'),
      content: content,
    );
  }
}
