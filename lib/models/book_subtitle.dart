import 'package:equatable/equatable.dart';

import './book_formatted_text.dart';

class BookSubtitle with EquatableMixin {
  final String? id;
  final String? style;
  final String? language;
  final List<BookFormattedTextContent> content;

  const BookSubtitle({
    this.id,
    this.style,
    this.language,
    this.content = const [],
  });

  @override
  List<Object?> get props => [id, style, language, content];
}
