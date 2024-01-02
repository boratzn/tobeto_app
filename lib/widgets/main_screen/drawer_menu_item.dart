import 'package:flutter/material.dart';
import 'package:tobeto_app/utils/utils.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: generalTexts(title, context),
          ),
        ),
      ),
    );
  }
}
