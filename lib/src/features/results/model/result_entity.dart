import 'package:flutter_timerman/src/features/results/model/user_result.dart';

class ResultEntity {
  ResultEntity({
    required this.date,
    required this.dateLabel,
    required this.eventTitle,
    this.usersResult = const <UserResult>[],
    this.userResult,
  });

  /// Is end event date
  final DateTime date;
  final String dateLabel;
  final String eventTitle;
  final List<UserResult> usersResult;
  final UserResult? userResult;
}
