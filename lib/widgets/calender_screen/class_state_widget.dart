import 'package:flutter/material.dart';

class ClassStateWidget extends StatefulWidget {
  const ClassStateWidget({super.key, required this.color, required this.title});

  final Color color;
  final String title;

  @override
  State<ClassStateWidget> createState() => _ClassStateWidgetState();
}

class _ClassStateWidgetState extends State<ClassStateWidget> {
  bool? selectedValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: widget.color,
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              if (value!) {
                //
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            widget.title,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          ),
        )
      ],
    );
  }
}
