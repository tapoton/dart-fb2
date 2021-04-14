import 'package:xml/xml.dart';

import '../models/book_date.dart';

class BookDateParser {
  static BookDate parse(XmlElement element) {
    final value = DateTime.parse(element.getAttribute('value') ?? '');
    return BookDate(value: value, text: element.text);
  }
}
