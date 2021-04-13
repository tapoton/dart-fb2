import 'package:xml/xml.dart';

import '../models/book_image.dart';

class BookImageParser {
  static BookImage tryParse(XmlElement element) {
    final attributes = Map.fromIterables(
      element.attributes.map((attr) => attr.name.local),
      element.attributes.map((attr) => attr.value),
    );
    return BookImage(
      type: attributes['type'],
      href: attributes['href']!,
      alt: attributes['alt'],
      title: attributes['title'],
      id: attributes['id'],
    );
  }
}
