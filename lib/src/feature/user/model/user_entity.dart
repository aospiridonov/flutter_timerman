import 'package:flutter_timerman/src/feature/user/model/sports_integration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String email,
    required String image,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phone,
    required String birthDay,
    @Default('') String country,
    @Default('') String region,
    @Default('') String city,
    @Default(<SportsIntegration>[]) List<SportsIntegration> integrations,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
