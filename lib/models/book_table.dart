import 'package:equatable/equatable.dart';

import './book_formatted_text.dart';
import '../utils/one_of.dart';

class BookTable with EquatableMixin {
  final String? id;
  final String? style;
  final List<BookTableRow> rows;

  const BookTable({this.id, this.style, required this.rows});

  @override
  List<Object?> get props => [id, style, rows];
}

enum BookTableHorizontalAlignment { left, right, center }
enum BookTableVerticalAlignment { top, middle, bottom }

class BookTableRowElement extends OneOf2<BookTableHeader, BookTableDataCell> {
  BookTableRowElement.header(BookTableHeader? header) : super(header, null);
  BookTableRowElement.dataCell(BookTableDataCell? cell) : super(null, cell);
}

class BookTableRow with EquatableMixin {
  final BookTableHorizontalAlignment? alignment;
  final List<OneOf2<BookTableHeader, BookTableDataCell>> elements;

  const BookTableRow({this.alignment, this.elements = const []});

  @override
  List<Object?> get props => [alignment, elements];
}

class BookTableHeader with EquatableMixin {
  final String? id;
  final String? style;
  final int? colspan;
  final int? rowspan;
  final BookTableHorizontalAlignment horizontalAlignment;
  final BookTableVerticalAlignment verticalAlignment;
  final String? language;
  final List<BookFormattedTextContent> text;

  const BookTableHeader({
    this.id,
    this.style,
    this.colspan,
    this.rowspan,
    BookTableHorizontalAlignment? horizontalAlignment,
    BookTableVerticalAlignment? verticalAlignment,
    this.language,
    this.text = const [],
  })  : this.horizontalAlignment =
            horizontalAlignment ?? BookTableHorizontalAlignment.left,
        this.verticalAlignment =
            verticalAlignment ?? BookTableVerticalAlignment.top;

  @override
  List<Object?> get props => [
        id,
        style,
        colspan,
        rowspan,
        horizontalAlignment,
        verticalAlignment,
        language,
        text,
      ];
}

class BookTableDataCell with EquatableMixin {
  final String? id;
  final String? style;
  final int? colspan;
  final int? rowspan;
  final BookTableHorizontalAlignment horizontalAlignment;
  final BookTableVerticalAlignment verticalAlignment;
  final String? language;
  final List<BookFormattedTextContent> text;

  const BookTableDataCell({
    this.id,
    this.style,
    this.colspan,
    this.rowspan,
    BookTableHorizontalAlignment? horizontalAlignment,
    BookTableVerticalAlignment? verticalAlignment,
    this.language,
    this.text = const [],
  })  : this.horizontalAlignment =
            horizontalAlignment ?? BookTableHorizontalAlignment.left,
        this.verticalAlignment =
            verticalAlignment ?? BookTableVerticalAlignment.top;
  @override
  List<Object?> get props => [
        id,
        style,
        colspan,
        rowspan,
        horizontalAlignment,
        verticalAlignment,
        language,
        text,
      ];
}
