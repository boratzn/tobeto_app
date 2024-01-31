import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key, required this.imgPath, required this.onTap});

  final String imgPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.grey[200]
              : Colors.white10,
        ),
        child: Image.asset(
          imgPath,
          height: 35,
        ),
      ),
    );
  }
}
