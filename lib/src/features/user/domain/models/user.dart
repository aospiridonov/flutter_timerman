import 'package:freezed_annotation/freezed_annotation.dart';

import 'sports_integration.dart' show SportsIntegration;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @JsonKey(ignore: true, includeIfNull: false) @Default('') String id,
    required String email,
    required String imageUrl,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phone,
    required String birthDay,
    required String sex,
    @Default('') String country,
    @Default('') String region,
    @Default('') String city,
    @Default(<SportsIntegration>[]) List<SportsIntegration> integrations,
  }) = _User;

  factory User.guest() => const User(
        email: 'email',
        imageUrl: 'imageUrl',
        firstName: 'firstName',
        middleName: 'middleName',
        lastName: 'lastName',
        phone: 'phone',
        birthDay: 'birthDay',
        sex: 'm',
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
