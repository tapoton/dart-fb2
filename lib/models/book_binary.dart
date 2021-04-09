import 'dart:typed_data';

class BookBinary {
  final String contentType;
  final String id;

  final Uint8List data;

  const BookBinary({
    required this.contentType,
    required this.id,
    required this.data,
  });
}
