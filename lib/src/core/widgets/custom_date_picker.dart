import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    Key? key,
    required this.labelText,
    required this.selectedDate,
    this.hintText = '',
    this.isEditable = true,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isEditable;
  DateTime selectedDate;

  @override
  State<CustomDatePicker> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  String get text =>
      DateFormat.yMd(Localizations.localeOf(context).languageCode)
          .format(widget.selectedDate);

  String get labelText => widget.labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      child: TextButton(
        onPressed: () => _buildDatePicker(context),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                labelText,
                softWrap: false,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildDatePicker(BuildContext context) async {
    if (!widget.isEditable) {
      return;
    }
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  Future<void> buildMaterialDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.selectedDate = picked;
      });
    }
  }

  /// This builds cupertion date picker in iOS
  void buildCupertinoDatePicker(BuildContext context) {
    // ignore: avoid_dynamic_calls
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              if (picked != widget.selectedDate) {
                setState(() {
                  widget.selectedDate = picked;
                });
              }
            },
            initialDateTime: widget.selectedDate,
            minimumYear: 2000,
            maximumYear: 2025,
          ),
        );
      },
    );
  }
}
