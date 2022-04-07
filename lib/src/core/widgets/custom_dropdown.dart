import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    Key? key,
    required this.labelText,
    this.value,
    required this.items,
    this.hintText = '',
    this.isEditable = true,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isEditable;
  final List<String> items;
  String? value;

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String get labelText => widget.labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      //color: Colors.red,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            //height: 25,
            width: double.infinity,
            child: Container(
              //color: Colors.red,
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
            //color: Colors.red,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: SizedBox(
                height: 16,
                //color: Colors.blue,
                child: DropdownButton<String>(
                  hint: Text(widget.hintText),
                  //iconSize: 20,
                  value: widget.value,
                  dropdownColor: Colors.white,
                  isDense: true,
                  isExpanded: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.value = newValue!;
                    });
                  },
                  items: widget.items.map<DropdownMenuItem<String>>(
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
      ),
    );
  }
}
