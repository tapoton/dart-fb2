import 'package:fb2/models/book.dart';
import 'package:fb2/models/book_binary.dart';
import 'package:fb2/models/book_body.dart';
import 'package:fb2/models/book_description.dart';
import 'package:fb2/models/book_stylesheet.dart';
import 'package:fb2/parsing/book_body_parser.dart';
import 'package:xml/xml.dart';

class BookParser {
  static Book parse(XmlElement element) {
    List<BookBody> bodies = [];
    BookDescription? description;
    List<BookBinary> binaries = [];
    BookStylesheet? stylesheet;

    // TODO: implement the rest
    for (var child in element.children.whereType<XmlElement>()) {
      switch (child.name.qualified) {
        case 'body':
          bodies.add(BookBodyParser.parse(element));
          break;
        default:
          break;
      }
    }
    return Book(
      bodies: bodies,
      description: description!,
      binaries: binaries,
      stylesheet: stylesheet!,
    );
  }
}
