import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    Key? key,
    required this.labelText,
    this.value = 'One',
    this.hintText = '',
    this.isEditable = true,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isEditable;
  String value = 'One';

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String get labelText => widget.labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.red,
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
            child: Container(
              color: Colors.blue,
              child: DropdownButton<String>(
                value: widget.value,
                //icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                style: const TextStyle(color: Colors.black),
                //underline: Container(height: 1, color: Colors.grey),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.value = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
/*
    return TextButton(
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
    );
    */
  }
}
