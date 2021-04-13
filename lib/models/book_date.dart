import 'package:equatable/equatable.dart';

class BookDate with EquatableMixin {
  final DateTime? value;
  final String? text;

  const BookDate({this.value, this.text});

  @override
  String toString() {
    return text ?? value?.toString() ?? '<unknown date>';
  }

  @override
  List<Object?> get props => [value, text];
}
