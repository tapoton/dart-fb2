import './book_annotation.dart';
import './book_cite.dart';
import './book_empty_line.dart';
import './book_epigraph.dart';
import './book_image.dart';
import './book_paragraph.dart';
import './book_poem.dart';
import './book_subtitle.dart';
import './book_table.dart';
import './book_title.dart';
import '../utils/one_of.dart';

class BookBody {
  final String? name;
  final String? language;
  final BookImage? image;
  final BookTitle? title;
  final List<BookEpigraph> epigraphs;
  final List<BookBodySection> sections;

  const BookBody({
    this.name,
    this.language,
    this.image,
    this.title,
    this.epigraphs = const [],
    required this.sections,
  });
}

class BookBodySection {
  final String? id;
  final String? language;
  final BookTitle? title;
  final List<BookEpigraph> epigraphs;
  final BookImage? image;
  final BookAnnotation? annotation;
  final OneOf2<List<BookBodySection>, List<BookBodySectionFormattedTextElement>>
      content;

  const BookBodySection({
    this.id,
    this.language,
    this.image,
    this.title,
    this.epigraphs = const [],
    this.annotation,
    this.content = const OneOf2([], null),
  });
}

class BookBodySectionFormattedTextElement extends OneOf7<BookSubtitle,
    BookParagraph, BookImage, BookPoem, BookCite, BookEmptyLine, BookTable> {
  BookBodySectionFormattedTextElement({
    BookSubtitle? subtitle,
    BookParagraph? paragraph,
    BookImage? image,
    BookPoem? poem,
    BookCite? cite,
    BookEmptyLine? emptyLine,
    BookTable? table,
  }) : super(subtitle, paragraph, image, poem, cite, emptyLine, table);
}
