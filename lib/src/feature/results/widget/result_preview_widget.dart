import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/results/model/result_entity.dart';
import 'package:flutter_timerman/src/feature/results/widget/result_list_view.dart';

class ResultPreviewWidget extends StatefulWidget {
  const ResultPreviewWidget({
    Key? key,
    required this.result,
  }) : super(key: key);

  final ResultEntity result;

  @override
  State<ResultPreviewWidget> createState() => _ResultPreviewWidgetState();
}

class _ResultPreviewWidgetState extends State<ResultPreviewWidget> {
  bool isExpanded = false;

  void swithExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            //color: Colors.lightBlue,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: 0,
                  child: Text(
                    result.dateLabel,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      result.eventTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  left: -10,
                  child: IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: -10,
                  child: IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: -5,
                  height: 25,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Transform.rotate(
                        angle: isExpanded ? -90 * pi / 180 : 90 * pi / 180,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      onPressed: swithExpand,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: const SizedBox(
            height: 2,
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: ResultListView(
            usersResult: result.usersResult,
            userResult: result.userResult,
          ),
        ),
      ],
    );
  }
}
