class BookDate {
  final DateTime? value;
  final String? text;

  const BookDate({this.value, this.text});

  @override
  String toString() {
    return text ?? value?.toString() ?? '<unknown date>';
  }
}
