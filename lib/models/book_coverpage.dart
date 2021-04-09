import './book_image.dart';

class BookCoverPage {
  final List<BookImage> images;

  const BookCoverPage({
    this.images = const [],
  });

  @override
  String toString() {
    return images.join('\n');
  }
}
