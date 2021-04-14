import 'package:xml/xml.dart';

import './book_text_parsing.dart';
import '../models/book_table.dart';
import '../utils/nullable_extension.dart';

class BookTableParser {
  static BookTable parse(XmlElement element) {
    final rows = element.children
        .whereType<XmlElement>()
        .where((e) => e.name.qualified == 'tr')
        .map(BookTableRowParser.parse)
        .toList();
    return BookTable(
      rows: rows,
      id: element.getAttribute('id'),
      style: element.getAttribute('style'),
    );
  }
}

class BookTableRowParser {
  static final _horizontalAlignments = const {
    'left': BookTableHorizontalAlignment.left,
    'center': BookTableHorizontalAlignment.center,
    'right': BookTableHorizontalAlignment.right,
  };
  static final _verticalAlignments = const {
    'top': BookTableVerticalAlignment.top,
    'middle': BookTableVerticalAlignment.middle,
    'bottom': BookTableVerticalAlignment.bottom,
  };

  static BookTableRow parse(XmlElement element) {
    final alignment = element
        .getAttribute('align')
        .flatMap((align) => _horizontalAlignments[align]);

    final elements =
        element.children.whereType<XmlElement>().compactMap((element) {
      switch (element.name.qualified) {
        case 'th':
          final header = BookTableHeader(
            id: element.getAttribute('id'),
            colspan: element.getAttribute('colspan').flatMap(int.tryParse),
            rowspan: element.getAttribute('rowspan').flatMap(int.tryParse),
            horizontalAlignment: element
                .getAttribute('align')
                .flatMap((align) => _horizontalAlignments[align]),
            verticalAlignment: element
                .getAttribute('valign')
                .flatMap((align) => _verticalAlignments[align]),
            language: element.getAttribute('xml:lang'),
            style: element.getAttribute('style'),
            text: element.children
                .map(BookFormattedTextContentParser.parse)
                .toList(),
          );

          return BookTableRowElement.header(header);

        case 'td':
          final cell = BookTableDataCell(
            colspan: element.getAttribute('colspan').flatMap(int.tryParse),
            horizontalAlignment: element
                .getAttribute('align')
                .flatMap((align) => _horizontalAlignments[align]),
            id: element.getAttribute('id'),
            language: element.getAttribute('xml:lang'),
            rowspan: element.getAttribute('rowspan').flatMap(int.tryParse),
            style: element.getAttribute('style'),
            text: element.children
                .map(BookFormattedTextContentParser.parse)
                .toList(),
            verticalAlignment: element
                .getAttribute('valign')
                .flatMap((align) => _verticalAlignments[align]),
          );

          return BookTableRowElement.dataCell(cell);
      }
    }).toList();

    return BookTableRow(alignment: alignment, elements: elements);
  }
}
