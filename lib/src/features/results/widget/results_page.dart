import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/features/results/widget/result_preview_widget.dart';

import '../model/result_entity.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({Key? key}) : super(key: key);

  bool hasPreviouseEvents = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView.separated(
        itemCount: results.length,
        itemBuilder: (context, index) =>
            ResultPreviewWidget(result: results[index]),
        separatorBuilder: _separatorBuilder,
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    if (results[index].date.isBefore(DateTime.now()) && index != 0) {
      if (!hasPreviouseEvents) {
        hasPreviouseEvents = true;
        return Column(
          children: const [
            Divider(color: Colors.black87),
            Text(
              'Прошлые события',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5)
          ],
        );
      }
    }

    return const SizedBox(height: 5);
  }

  final results = <ResultEntity>[];
}
