import 'package:equatable/equatable.dart';

//TODO: Переписать на freezed
//
class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String? email;
  final String id;
  final String? name;
  final String? photo;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
