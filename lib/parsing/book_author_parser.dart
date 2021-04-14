import 'package:xml/xml.dart';

import '../models/book_author.dart';

class BookAuthorParser {
  static BookAuthor parse(XmlElement element) {
    String? firstName, middleName, lastName, nickname, id;
    List<String> emails = [], homepages = [];

    for (var child in element.children.whereType<XmlElement>()) {
      switch (child.name.qualified) {
        case 'first-name':
          firstName = child.text;
          break;
        case 'middle-name':
          middleName = child.text;
          break;
        case 'last-name':
          lastName = child.text;
          break;
        case 'nickname':
          nickname = child.text;
          break;
        case 'homepage':
          homepages.add(child.text);
          break;
        case 'email':
          emails.add(child.text);
          break;
        case 'id':
          id = child.text;
          break;
        default:
          break;
      }
    }
    return BookAuthor(
      emails: emails,
      firstName: firstName,
      homepages: homepages,
      id: id,
      lastName: lastName,
      middleName: middleName,
      nickname: nickname,
    );
  }
}
