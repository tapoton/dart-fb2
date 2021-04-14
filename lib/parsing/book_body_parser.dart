import 'package:fb2/parsing/book_epigraph_parser.dart';
import 'package:fb2/parsing/book_title_parser.dart';
import 'package:fb2/utils/nullable_extension.dart';
import './book_image_parsing.dart';

import '../models/book_body.dart';
import 'package:xml/xml.dart';

class BookBodyParser {
  static BookBody parse(XmlElement element) {
    // TODO: SectionParser
    return BookBody(
      sections: [],
      epigraphs: element.children
          .whereType<XmlElement>()
          .where((element) => element.name.qualified == 'epigraph')
          .map(BookEpigraphParser.parse)
          .toList(),
      image: element.getElement('image').map(BookImageParser.parse),
      language: element.getAttribute('xml:lang'),
      name: element.getAttribute('name'),
      title: element.getElement('title').map(BookTitleParser.parse),
    );
  }
}
