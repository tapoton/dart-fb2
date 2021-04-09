class BookImage {
  final String? type;
  final String href;
  final String? alt;
  final String? title;
  final String? id;

  const BookImage({
    this.type,
    this.title,
    this.alt,
    required this.href,
    this.id,
  });
}
