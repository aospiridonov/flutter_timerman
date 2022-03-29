import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.child,
    required this.onChanged,
    this.value = false,
  }) : super(key: key);

  final Widget child;
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (bool? newValue) => onChanged(newValue!),
          ),
          const SizedBox(width: 5),
          Expanded(child: child),
        ],
      ),
    );
  }
}
