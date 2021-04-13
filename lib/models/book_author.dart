import 'package:equatable/equatable.dart';

class BookAuthor with EquatableMixin {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? nickname;
  final List<String> homepage;
  final List<String> email;
  final String? id;

  const BookAuthor({
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickname,
    this.homepage = const [],
    this.email = const [],
    this.id,
  });

  @override
  List<Object?> get props =>
      [firstName, middleName, lastName, nickname, homepage, email, id];
}
