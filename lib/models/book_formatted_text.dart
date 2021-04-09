import './book_image.dart';
import '../utils/one_of.dart';

class BookFormattedTextContent
    extends OneOf3<BookFormattedText, BookImage, String> {
  BookFormattedTextContent({
    BookFormattedText? formattedText,
    BookImage? image,
    String? text,
  }) : super(formattedText, image, text);
}

abstract class BookFormattedText {
  final List<BookFormattedTextContent> contents;

  BookFormattedText(this.contents);
}

class BookStyledText extends BookFormattedText {
  final String? language;
  final String name;

  BookStyledText({
    this.language,
    required this.name,
    required List<BookFormattedTextContent> contents,
  }) : super(contents);
}

class BookStrongText extends BookFormattedText {
  BookStrongText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookEmphasisText extends BookFormattedText {
  BookEmphasisText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookStrikethroughText extends BookFormattedText {
  BookStrikethroughText(List<BookFormattedTextContent> contents)
      : super(contents);
}

class BookSubText extends BookFormattedText {
  BookSubText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookSupText extends BookFormattedText {
  BookSupText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookCodeText extends BookFormattedText {
  BookCodeText(List<BookFormattedTextContent> contents) : super(contents);
}

class BookLinkText extends BookFormattedText {
  final String? type;
  final String href;

  BookLinkText({
    this.type,
    required this.href,
    required List<BookFormattedTextContent> contents,
  }) : super(contents);

  bool get isNote => type == 'note';
}
