import 'dart:convert';

import 'package:flutter_timerman/src/feature/user/model/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static UserEntity myUser = const UserEntity(
    email: 'aospiridonov@gmail.com',
    image:
        'https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg',
    firstName: 'Alexander',
    middleName: 'Olegovich',
    lastName: 'Spiridonov',
    birthDay: '18.06.1990',
    phone: '+7',
  );

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(UserEntity user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static UserEntity getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null
        ? myUser
        : UserEntity.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }
}
