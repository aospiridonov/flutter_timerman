import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/event_results/widget/event_results_page.dart';
import 'package:flutter_timerman/src/feature/results/model/user_result.dart';
import 'package:flutter_timerman/src/feature/results/widget/result_list_item.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({
    Key? key,
    required this.usersResult,
    this.userResult,
  }) : super(key: key);

  final List<UserResult> usersResult;
  final UserResult? userResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (usersResult.length >= 3) ...[
            const ResultListHeader(pointLabel: 'Баллы'),
            const SizedBox(height: 2),
            ResultListItem(result: usersResult[0]),
            const SizedBox(height: 2),
            ResultListItem(result: usersResult[1]),
            const SizedBox(height: 2),
            ResultListItem(result: usersResult[2]),
            const SizedBox(height: 2),
          ],
          if (userResult != null) ...[
            const Divider(),
            ResultListItem(result: userResult!),
          ],
          TextButton(
            onPressed: () => _onEventResults(context),
            child: const Text(
              'Подробнее',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onEventResults(BuildContext context) {
    //
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const EventResultsPage(),
      ),
    );
  }
}
