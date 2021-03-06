import 'package:equatable/equatable.dart';

import './book_image.dart';

class BookCoverPage with EquatableMixin {
  final List<BookImage> images;

  const BookCoverPage({
    this.images = const [],
  });

  @override
  String toString() {
    return images.join('\n');
  }

  @override
  List<Object?> get props => [images];
}
