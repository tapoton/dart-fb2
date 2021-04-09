import './book_annotation.dart';
import './book_author.dart';
import './book_coverpage.dart';
import './book_date.dart';

class BookDescription {
  final BookTitleInfo titleInfo;
  final BookTitleInfo? sourceTitleInfo;
  final BookDocumentInfo documentInfo;
  final BookPublishInfo? publishInfo;
  final List<String> customInfo;

  const BookDescription({
    required this.titleInfo,
    required this.documentInfo,
    this.sourceTitleInfo,
    this.publishInfo,
    this.customInfo = const [],
  });
}

class BookTitleInfo {
  final List<String> genres;
  final List<BookAuthor> authors;
  final String bookTitle;
  final BookAnnotation? annotation;
  final String? keywords;
  final BookDate? date;
  final BookCoverPage? coverpage;
  final String language;
  final String? sourceLanguage;
  final List<BookAuthor> translators;
  final List<BookSequenceInfo> sequence;

  const BookTitleInfo({
    required this.genres,
    required this.authors,
    required this.bookTitle,
    required this.annotation,
    required this.keywords,
    required this.date,
    this.coverpage,
    required this.language,
    this.sourceLanguage,
    this.translators = const [],
    this.sequence = const [],
  });
}

class BookSequenceInfo {
  final String name;
  final int? number;
  final String? language;

  const BookSequenceInfo({
    required this.name,
    this.number,
    this.language,
  });
}

class BookDocumentInfo {
  final List<BookAuthor> authors;
  final String? programUsed;
  final BookDate date;
  final List<String> sourceUrl;
  final String? sourceOcr;
  final String id;
  final String version;
  final String? history;
  final List<BookAuthor> publishers;

  const BookDocumentInfo({
    required this.authors,
    this.programUsed,
    required this.date,
    this.sourceUrl = const [],
    this.sourceOcr,
    required this.id,
    required this.version,
    this.history,
    this.publishers = const [],
  });
}

class BookPublishInfo {
  final String? bookName;
  final String? publisher;
  final String? city;
  final String? year;
  final String? isbn;
  final List<BookSequenceInfo> sequence;

  BookPublishInfo({
    this.bookName,
    this.publisher,
    this.city,
    this.year,
    this.isbn,
    this.sequence = const [],
  });
}
