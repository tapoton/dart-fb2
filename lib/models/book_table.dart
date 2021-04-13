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
  final List<BookFormattedText> text;

  const BookTableHeader({
    this.id,
    this.style,
    this.colspan,
    this.rowspan,
    this.horizontalAlignment = BookTableHorizontalAlignment.left,
    this.verticalAlignment = BookTableVerticalAlignment.top,
    this.language,
    this.text = const [],
  });

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
  final List<BookFormattedText> text;

  const BookTableDataCell({
    this.id,
    this.style,
    this.colspan,
    this.rowspan,
    this.horizontalAlignment = BookTableHorizontalAlignment.left,
    this.verticalAlignment = BookTableVerticalAlignment.top,
    this.language,
    this.text = const [],
  });

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
