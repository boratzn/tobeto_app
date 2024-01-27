import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
