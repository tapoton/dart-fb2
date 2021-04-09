import './book_formatted_text.dart';
import '../utils/one_of.dart';

class BookTable {
  final String? id;
  final String? style;
  final List<BookTableRow> rows;

  const BookTable({this.id, this.style, required this.rows});
}

enum BookTableHorizontalAlignment { left, right, center }
enum BookTableVerticalAlignment { top, middle, bottom }

class BookTableRow {
  final BookTableHorizontalAlignment? alignment;
  final List<OneOf2<BookTableHeader, BookTableDataCell>> elements;

  const BookTableRow({this.alignment, this.elements = const []});
}

class BookTableHeader {
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
}

class BookTableDataCell {
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
}
