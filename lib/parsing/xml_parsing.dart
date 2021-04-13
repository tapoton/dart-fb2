import 'package:fb2/models/book_formatted_text.dart';
import 'package:fb2/models/book_paragraph.dart';
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

class BookParagraphParser {
  static BookParagraph tryParse(XmlElement element) {
    final content =
        element.children.map(BookFormattedTextContentParser.tryParse).toList();
    return BookParagraph(
      id: element.getAttribute('id'),
      style: element.getAttribute('style'),
      language: element.getAttribute('xml:lang'),
      content: content,
    );
  }
}

class BookFormattedTextParser {
  static BookFormattedText? tryParse(XmlElement element) {
    final childContent =
        element.children.map(BookFormattedTextContentParser.tryParse).toList();

    switch (element.name.qualified) {
      case 'strong':
        return BookStrongText(childContent);
      case 'emphasis':
        return BookEmphasisText(childContent);
      case 'strikethrough':
        return BookStrikethroughText(childContent);
      case 'sub':
        return BookSubText(childContent);
      case 'sup':
        return BookSupText(childContent);
      case 'code':
        return BookCodeText(childContent);
      case 'style':
        return BookStyledText(
          name: element.getAttribute('name')!,
          language: element.getAttribute('xml:lang'),
          contents: childContent,
        );
      case 'a':
        return BookLinkText(
          href: element.attributes
              .firstWhere((attr) => attr.name.local == 'href')
              .value,
          type: element.getAttribute('type'),
          contents: childContent,
        );
      default:
        return null;
    }
  }
}

class BookFormattedTextContentParser {
  static BookFormattedTextContent tryParse(XmlNode node) {
    if (node is XmlText) {
      return BookFormattedTextContent(text: node.text);
    }

    if (node is XmlElement) {
      if (node.name.local == 'image') {
        return BookFormattedTextContent(
          image: BookImageParser.tryParse(node),
        );
      }

      return BookFormattedTextContent(
        formattedText: BookFormattedTextParser.tryParse(node),
      );
    }

    throw Exception('Unknown node type');
  }
}
