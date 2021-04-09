import './book_date.dart';
import './book_epigraph.dart';
import './book_formatted_text.dart';
import './book_paragraph.dart';
import './book_subtitle.dart';
import './book_title.dart';

class BookPoem {
  final String? id;
  final String? language;

  final BookTitle? title;
  final List<BookEpigraph> epigraphs;
  final List<BookPoemStanza> stanza;
  final List<BookParagraph> textAuthor;
  final BookDate? date;

  const BookPoem({
    this.id,
    this.language,
    this.title,
    this.epigraphs = const [],
    required this.stanza,
    this.textAuthor = const [],
    this.date,
  });
}

class BookPoemStanza {
  final BookTitle? title;
  final BookSubtitle? subtitle;
  final List<BookPoemLine> lines;

  const BookPoemStanza({
    this.title,
    this.subtitle,
    required this.lines,
  });
}

class BookPoemLine {
  final String? id;
  final String? style;
  final String? language;
  final List<BookFormattedTextContent> content;

  const BookPoemLine({
    this.id,
    this.style,
    this.language,
    this.content = const [],
  });
}
