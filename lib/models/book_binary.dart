import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class BookBinary with EquatableMixin {
  final String contentType;
  final String id;

  final Uint8List data;

  const BookBinary({
    required this.contentType,
    required this.id,
    required this.data,
  });

  @override
  List<Object?> get props => [contentType, id, data];
}
