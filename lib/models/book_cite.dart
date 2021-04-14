import 'package:equatable/equatable.dart';

import './book_empty_line.dart';
import './book_paragraph.dart';
import './book_poem.dart';
import './book_subtitle.dart';
import './book_table.dart';
import '../utils/one_of.dart';

class BookCite with EquatableMixin {
  final String? id;
  final String? language;
  final List<BookCiteContent> content;
  final List<BookParagraph> textAuthors;

  const BookCite({
    this.id,
    this.language,
    required this.content,
    this.textAuthors = const [],
  });

  @override
  List<Object?> get props => [id, language, content, textAuthors];
}

class BookCiteContent extends OneOf5<BookParagraph, BookSubtitle, BookEmptyLine,
    BookPoem, BookTable> {
  const BookCiteContent({
    BookParagraph? paragraph,
    BookSubtitle? subtitle,
    BookEmptyLine? emptyLine,
    BookPoem? poem,
    BookTable? table,
  }) : super(paragraph, subtitle, emptyLine, poem, table);
}
