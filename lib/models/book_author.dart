import 'package:equatable/equatable.dart';

class BookAuthor with EquatableMixin {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? nickname;
  final List<String> homepages;
  final List<String> emails;
  final String? id;

  const BookAuthor({
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickname,
    this.homepages = const [],
    this.emails = const [],
    this.id,
  });

  @override
  List<Object?> get props =>
      [firstName, middleName, lastName, nickname, homepages, emails, id];
}
