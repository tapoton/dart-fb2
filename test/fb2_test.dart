import 'package:fb2/models/book_formatted_text.dart';
import 'package:fb2/models/book_image.dart';
import 'package:fb2/models/book_paragraph.dart';
import 'package:fb2/parsing/book_image_parsing.dart';
import 'package:fb2/parsing/book_paragraph_parsing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {
  test('parses valid image correctly', () {
    final xml = '''
    <?xml version="1.0"?>
    <FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0"
      xmlns:l="http://www.w3.org/1999/xlink">
      <p>Абзац текста до картинки.</p>
      <image l:href="#picture.jpg"/>
      <p>Абзац текста после картинки.</p>
    </FictionBook>
    ''';
    final document = XmlDocument.parse(xml);
    final xmlFictionBook = document.getElement('FictionBook')!;
    final xmlImage = xmlFictionBook.getElement('image')!;

    final image = BookImageParser.parse(xmlImage);

    expect(image.href, '#picture.jpg');
    expect(image.id, null);
    expect(image.alt, null);
    expect(image.title, null);
    expect(image.type, null);
  });

  test('parses valid paragraph correctly', () {
    final xml = '''
    <?xml version="1.0"?>
    <FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0"
      xmlns:l="http://www.w3.org/1999/xlink">
      <p xml:lang="ru">Paragraph with <strong>strong</strong>, <emphasis>emphasized</emphasis>, <strikethrough><a l:href="#link">strikethrough link</a>text</strikethrough> and even <image l:href="#picture.jpg"/></p>
    </FictionBook>
    ''';

    final document = XmlDocument.parse(xml);
    final xmlFictionBook = document.getElement('FictionBook')!;
    final xmlParagraph = xmlFictionBook.getElement('p')!;

    final paragraph = BookParagraphParser.parse(xmlParagraph);

    expect(
      paragraph,
      BookParagraph(
        id: null,
        language: 'ru',
        style: null,
        content: [
          BookFormattedTextContent(text: 'Paragraph with '),
          BookFormattedTextContent(
            formattedText: BookStrongText([
              BookFormattedTextContent(text: 'strong'),
            ]),
          ),
          BookFormattedTextContent(text: ', '),
          BookFormattedTextContent(
            formattedText: BookEmphasisText([
              BookFormattedTextContent(text: 'emphasized'),
            ]),
          ),
          BookFormattedTextContent(text: ', '),
          BookFormattedTextContent(
            formattedText: BookStrikethroughText([
              BookFormattedTextContent(
                formattedText: BookLinkText(
                  href: '#link',
                  contents: [
                    BookFormattedTextContent(text: 'strikethrough link')
                  ],
                ),
              ),
              BookFormattedTextContent(text: 'text'),
            ]),
          ),
          BookFormattedTextContent(text: ' and even '),
          BookFormattedTextContent(image: BookImage(href: '#picture.jpg')),
        ],
      ),
    );
  });
}
