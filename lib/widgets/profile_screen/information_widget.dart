import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  const InformationCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgPath});

  final String title;
  final String subTitle;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading: Image.asset(imgPath),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}
