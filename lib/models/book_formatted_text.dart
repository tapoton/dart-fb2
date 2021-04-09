import './book_image.dart';
import '../utils/one_of.dart';

class BookFormattedTextContent
    extends OneOf3<BookFormattedText, BookImage, String> {
  const BookFormattedTextContent({
    BookFormattedText? formattedText,
    BookImage? image,
    String? text,
  }) : super(formattedText, image, text);
}

abstract class BookFormattedText {
  final List<BookFormattedTextContent> contents;

  const BookFormattedText(this.contents);
}

class BookStyledText extends BookFormattedText {
  final String? language;
  final String name;

  const BookStyledText({
    this.language,
    required this.name,
    required List<BookFormattedTextContent> contents,
  }) : super(contents);
}

class BookStrongText extends BookFormattedText {
  const BookStrongText(List<BookFormattedTextContent> contents)
      : super(contents);
}

class BookEmphasisText extends BookFormattedText {
  const BookEmphasisText(List<BookFormattedTextContent> contents)
      : super(contents);
}

class BookStrikethroughText extends BookFormattedText {
  const BookStrikethroughText(List<BookFormattedTextContent> contents)
      : super(contents);
}

class BookSubText extends BookFormattedText {
  const BookSubText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookSupText extends BookFormattedText {
  const BookSupText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookCodeText extends BookFormattedText {
  const BookCodeText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookLinkText extends BookFormattedText {
  final String? type;
  final String href;

  const BookLinkText({
    this.type,
    required this.href,
    required List<BookFormattedTextContent> contents,
  }) : super(contents);

  bool get isNote => type == 'note';
}
